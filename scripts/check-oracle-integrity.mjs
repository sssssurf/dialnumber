// Validate the evidence failure path with small corruptions in scratch copies.
// The original fixtures, generated tests and source checkout are never mutated.
import fs from 'node:fs';
import path from 'node:path';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const directory = path.join(root, '.cache/oracle-integrity');
fs.mkdirSync(directory, { recursive: true });
const scratch = fs.mkdtempSync(path.join(directory, 'run-'));
const files = [
  'scripts/gen-compat.mjs', 'scripts/gen-google-compat.mjs',
  'scripts/format-moonbit.mjs', 'scripts/ReferenceOracle.java',
  'data/numbering-plans.json', 'data/compatibility-corpus.json',
  'data/compatibility-differences.json', 'data/google-compatibility-corpus.json',
  'data/google-compatibility-differences.json', 'compatibility_test.mbt',
  'google_compatibility_test.mbt', 'docs/compatibility.md', 'docs/google-compatibility.md',
];
let sequence = 0;
const checks = [];
function run(script) {
  const log = path.join(directory, String(sequence++) + '.log');
  const fd = fs.openSync(log, 'w');
  let result;
  try {
    result = spawnSync(process.execPath, [path.join(scratch, 'scripts', script), '--check'],
      { cwd: scratch, stdio: ['ignore', fd, fd] });
  } finally { fs.closeSync(fd); }
  if (result.error) throw result.error;
  return { status: result.status, output: fs.readFileSync(log, 'utf8') };
}
function corrupt(label, filename, script, mutate, expected) {
  const target = path.join(scratch, filename);
  const original = fs.readFileSync(target, 'utf8');
  const doc = JSON.parse(original);
  mutate(doc);
  fs.writeFileSync(target, JSON.stringify(doc, null, 2) + '\n');
  try {
    const result = run(script);
    assert.notEqual(result.status, 0, `${label}: corrupted recording was accepted`);
    assert.match(result.output, expected, `${label}: failed for an unrelated reason`);
    checks.push({ label, status: 'rejected for expected integrity failure' });
  } finally { fs.writeFileSync(target, original); }
}
try {
  for (const filename of files) {
    const target = path.join(scratch, filename);
    fs.mkdirSync(path.dirname(target), { recursive: true });
    fs.copyFileSync(path.join(root, filename), target);
  }
  // Passing controls prove the copies, dependencies and toolchain are usable;
  // a later missing-file or formatter failure cannot satisfy a mutation test.
  for (const script of ['gen-compat.mjs', 'gen-google-compat.mjs']) {
    const result = run(script);
    assert.equal(result.status, 0, `Unmodified ${script} control failed: ${result.output}`);
    checks.push({ label: 'unmodified ' + script, status: 'passed' });
  }
  const js = 'data/compatibility-corpus.json';
  const java = 'data/google-compatibility-corpus.json';
  corrupt('JS missing response', js, 'gen-compat.mjs', d => d.rows.pop(), /Missing or extra JavaScript oracle responses/);
  corrupt('JS duplicate response', js, 'gen-compat.mjs', d => { d.rows[1] = d.rows[0]; }, /Unknown, duplicate or changed JavaScript oracle request/);
  corrupt('JS missing typing trace', js, 'gen-compat.mjs', d => d.traces.pop(), /Missing JavaScript typing traces/);
  corrupt('JS shortened typing trace', js, 'gen-compat.mjs', d => d.traces[0].output.pop(), /Incomplete or changed typing trace/);
  corrupt('Java missing response', java, 'gen-google-compat.mjs', d => d.rows.pop(), /Missing or extra Java oracle responses/);
  corrupt('Java duplicate response', java, 'gen-google-compat.mjs', d => { d.rows[1] = d.rows[0]; }, /Unknown, duplicate or mistyped Java oracle response/);
  corrupt('Java shortened typing trace', java, 'gen-google-compat.mjs', d => d.rows.find(r => r[1] === 'typing').pop(), /Incomplete Java oracle response/);
  fs.writeFileSync(path.join(directory, 'report.json'), JSON.stringify({
    date: new Date().toISOString(), status: 'passed', checks,
  }, null, 2) + '\n');
  console.log(`Oracle evidence integrity: 2 controls passed, ${checks.length - 2} corruptions rejected for their exact cause`);
} finally {
  // Resolve and verify the complete target before recursive removal on Windows.
  const resolved = path.resolve(scratch);
  if (path.dirname(resolved) !== path.resolve(directory) || !path.basename(resolved).startsWith('run-')) {
    throw new Error('Refusing to remove an unexpected scratch directory');
  }
  fs.rmSync(resolved, { recursive: true, force: true });
}
