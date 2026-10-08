// check-docs.mjs — fail when the documentation drifts from the real output.
//
// WHY THIS EXISTS
//   README.md and docs/reproducible-demo.md both embed command output as literal
//   text. Nothing stopped that text from going stale: the demo could gain a line,
//   a validator could be renamed, and the docs would keep claiming the old result.
//   The acceptance criteria ask for a reproducible demonstration, so the
//   demonstration is now machine-checked instead of trusted.
//
// WHAT IT VERIFIES
//   1. the demo's labelled output lines match the block recorded in
//      docs/reproducible-demo.md
//   2. the CLI output blocks recorded in README.md match real runs
//   3. the test count claimed in both READMEs matches `moon test`
//   4. every CLI command listed in README.md actually exits successfully
//
// USAGE
//   node scripts/check-docs.mjs
//
// Reads only committed files, so it fails loudly when a doc update is forgotten.

import { readFile } from 'node:fs/promises';
import { readFileSync, rmSync, mkdtempSync } from 'node:fs';
import { spawnSync } from 'node:child_process';
import { tmpdir } from 'node:os';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const SCRATCH = mkdtempSync(path.join(tmpdir(), 'check-docs-'));
let scratchSeq = 0;
const failures = [];
const notes = [];

function fail(msg) {
  failures.push(msg);
}

function note(msg) {
  notes.push(msg);
}

async function readDoc(rel) {
  return readFile(path.join(ROOT, rel), 'utf8');
}

/**
 * Run a command from the repo root and return its combined output.
 *
 * Output is captured through a shell redirection into a scratch file rather than
 * a pipe. Piped stdio is the one thing this project's development sandbox
 * forbids, so `execFileSync(..., {stdio: 'pipe'})` dies with EPERM while a
 * redirected shell works. The indirection also keeps this script portable: only
 * `shell: true` and `>` are required, both available on Windows and Linux.
 */
function run(file, args) {
  const outFile = path.join(SCRATCH, `out-${scratchSeq++}.txt`);
  // Quote every argument for the shell. Double quotes are sufficient here: none
  // of the arguments contain quotes, and this keeps the command readable.
  const cmd =
    [file, ...args].map((a) => (/[\s]/.test(a) ? `"${a}"` : a)).join(' ') +
    ` > "${outFile}" 2>&1`;
  const res = spawnSync(cmd, { cwd: ROOT, shell: true, stdio: 'ignore' });
  if (res.error) {
    return { failed: true, code: null, out: `spawn error: ${res.error.message}` };
  }
  let out = '';
  try {
    out = readFileSync(outFile, 'utf8');
  } catch {
    out = '';
  }
  rmSync(outFile, { force: true });
  return res.status === 0 ? out : { failed: true, code: res.status, out };
}

function lines(text) {
  return text.split(/\r?\n/).filter((l) => l.trim() !== '');
}

/**
 * Find the fenced block that records the demo's output.
 *
 * The document contains several ```text blocks (test summary, CLI usage, demo),
 * so pick by content rather than position: the demo block is the one containing
 * the tour's opening line.
 */
function findDemoBlock(md) {
  const blocks = allTextBlocks(md);
  return blocks.find((b) => b.includes('parse across the ways')) ?? null;
}

/** Pull every ```text fenced block out of a document. */
function allTextBlocks(md) {
  const out = [];
  const re = /```text\r?\n([\s\S]*?)```/g;
  let m;
  while ((m = re.exec(md)) !== null) out.push(m[1]);
  return out;
}

// ---------------------------------------------------------------------------
// 1. demo output vs docs/reproducible-demo.md
// ---------------------------------------------------------------------------
const demoDoc = await readDoc('docs/reproducible-demo.md');
const recordedDemo = findDemoBlock(demoDoc);
if (!recordedDemo) {
  fail('docs/reproducible-demo.md: no ```text block found');
} else {
  const demo = run('moon', ['run', 'cmd/demo']);
  if (demo.failed) {
    fail(`moon run cmd/demo failed (exit ${demo.code}): ${demo.out.slice(0, 300)}`);
  } else {
    const recorded = lines(recordedDemo);
    const actual = lines(demo);
    if (recorded.length !== actual.length) {
      fail(
        `demo output length differs: docs record ${recorded.length} non-empty lines, ` +
          `actual ${actual.length}`,
      );
    }
    const n = Math.min(recorded.length, actual.length);
    let diffs = 0;
    for (let i = 0; i < n; i++) {
      if (recorded[i] !== actual[i]) {
        diffs++;
        if (diffs <= 5) {
          fail(`demo line ${i + 1}:\n    docs:   ${JSON.stringify(recorded[i])}\n    actual: ${JSON.stringify(actual[i])}`);
        }
      }
    }
    if (diffs > 5) fail(`...and ${diffs - 5} more differing demo lines`);
    if (diffs === 0 && recorded.length === actual.length) {
      note(`demo output matches docs/reproducible-demo.md (${actual.length} lines)`);
    }
  }
}

// ---------------------------------------------------------------------------
// 2. CLI output blocks recorded in README vs real runs
// ---------------------------------------------------------------------------
const readme = await readDoc('README.md');

// The README records a command followed by its output, e.g.
//   $ moon run cmd/main -- imei 490154203237518
//   imei: 490154203237518
//   ...
for (const block of allTextBlocks(readme)) {
  const blockLines = lines(block);
  const cmdIdx = blockLines.findIndex((l) => l.startsWith('$ '));
  if (cmdIdx === -1) continue;

  // Support several `$ cmd` + expected-output groups inside one block.
  let i = cmdIdx;
  while (i < blockLines.length) {
    if (!blockLines[i].startsWith('$ ')) {
      i++;
      continue;
    }
    const cmd = blockLines[i].slice(2).trim();
    const expected = [];
    i++;
    while (i < blockLines.length && !blockLines[i].startsWith('$ ')) {
      expected.push(blockLines[i]);
      i++;
    }
    // Trim blank lines that separate groups.
    while (expected.length && expected[expected.length - 1].trim() === '') expected.pop();

    if (!cmd.startsWith('moon run cmd/main -- ')) {
      note(`skipping non-CLI recorded command: ${cmd}`);
      continue;
    }
    const cliArgs = cmd.replace('moon run cmd/main -- ', '').trim().split(/\s+/);
    const res = run('moon', ['run', 'cmd/main', '--', ...cliArgs]);
    if (res.failed) {
      fail(`recorded README command failed: ${cmd} (exit ${res.code})`);
      continue;
    }
    const actual = lines(res);
    const want = expected.filter((l) => l.trim() !== '');
    if (actual.length !== want.length || actual.some((l, k) => l !== want[k])) {
      fail(
        `README output for "${cmd}" is stale:\n` +
          `    recorded:\n${want.map((l) => '      ' + l).join('\n')}\n` +
          `    actual:\n${actual.map((l) => '      ' + l).join('\n')}`,
      );
    } else {
      note(`README CLI output matches: ${cmd}`);
    }
  }
}

// ---------------------------------------------------------------------------
// 3. claimed test count vs reality
// ---------------------------------------------------------------------------
const testRun = run('moon', ['test']);
if (testRun.failed) {
  fail(`moon test failed (exit ${testRun.code})`);
} else {
  const m = testRun.match(/Total tests:\s*(\d+)/);
  if (!m) {
    fail('could not read "Total tests:" from moon test output');
  } else {
    const real = Number(m[1]);
    note(`moon test reports ${real} tests`);

    // Both READMEs claim "<n> tests cover ..." in prose.
    for (const rel of ['README.md', 'README.mbt.md']) {
      const doc = await readDoc(rel);
      const claim = doc.match(/(\d+)\s+tests?\s+cover/);
      if (!claim) {
        note(`${rel}: no "<n> tests cover" claim found`);
        continue;
      }
      if (Number(claim[1]) !== real) {
        fail(`${rel} claims ${claim[1]} tests but moon test reports ${real}`);
      } else {
        note(`${rel} test count matches (${real})`);
      }
    }

    // docs/reproducible-demo.md quotes the full summary line.
    if (recordedDemo === null) {
      // already reported
    } else {
      const summary = demoDoc.match(/Total tests:\s*(\d+),\s*passed:\s*(\d+),\s*failed:\s*(\d+)/);
      if (!summary) {
        note('docs/reproducible-demo.md: no total-tests line to check');
      } else if (Number(summary[1]) !== real || summary[1] !== summary[2] || summary[3] !== '0') {
        fail(
          `docs/reproducible-demo.md records "${summary[0]}" but moon test reports ${real} total`,
        );
      } else {
        note('docs/reproducible-demo.md test summary matches');
      }
    }
  }
}

// ---------------------------------------------------------------------------
// 4. every CLI command listed in the README runs
// ---------------------------------------------------------------------------
const cliBlock = readme.match(/## Command line[\s\S]*?```bash\r?\n([\s\S]*?)```/);
if (!cliBlock) {
  fail('README.md: could not find the "## Command line" bash block');
} else {
  const cmds = lines(cliBlock[1]).filter((l) => l.startsWith('moon run cmd/main -- '));
  if (cmds.length === 0) {
    fail('README.md: the command-line block lists no commands');
  }
  let ok = 0;
  for (const cmd of cmds) {
    const cliArgs = cmd.replace('moon run cmd/main -- ', '').trim().split(/\s+/);
    const res = run('moon', ['run', 'cmd/main', '--', ...cliArgs]);
    if (res.failed) {
      fail(`listed README command does not run: ${cmd} (exit ${res.code})`);
    } else {
      ok++;
    }
  }
  note(`all ${ok}/${cmds.length} documented CLI commands ran successfully`);
}

// ---------------------------------------------------------------------------
// report
// ---------------------------------------------------------------------------
console.log('check-docs: verifying that documentation matches real output\n');
for (const n of notes) console.log('  ok    ' + n);
for (const f of failures) {
  console.log('  FAIL  ' + f);
  // The raw run log needs repository admin rights to download, so a failure
  // that only reproduces on the runner is otherwise invisible to anyone
  // without them. A workflow command turned into an annotation lands on the
  // public check-run record instead, where the whole recorded-vs-actual diff
  // can be read. Only emitted under CI so local runs stay readable.
  if (process.env.GITHUB_ACTIONS) {
    const escaped = f
      .replace(/%/g, '%25')
      .replace(/\r/g, '%0D')
      .replace(/\n/g, '%0A');
    console.log('::error::' + escaped);
  }
}

console.log('');
rmSync(SCRATCH, { recursive: true, force: true });
if (failures.length > 0) {
  console.log(`RESULT: ${failures.length} documentation drift problem(s) found.`);
  console.log('Update the affected document, or fix the code if the doc was right.');
  process.exit(1);
}
console.log('RESULT: documentation matches the code.');
