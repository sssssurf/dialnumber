// One command for the technical acceptance checks. No downloads or publication.
// Linux/macOS with a C compiler: node scripts/acceptance.mjs
// Windows without a C compiler: node scripts/acceptance.mjs --targets js,wasm,wasm-gc
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const directory = path.join(root, '.cache/acceptance');
fs.mkdirSync(directory, { recursive: true });
const targetIndex = process.argv.indexOf('--targets');
const targets = targetIndex < 0 ? ['js','wasm','wasm-gc','native'] :
  (process.argv[targetIndex + 1] ?? '').split(',');
if (!targets.length || targets.some(t => !['js','wasm','wasm-gc','native'].includes(t))) {
  throw new Error('Expected --targets js,wasm,wasm-gc,native (or a subset)');
}
const report = { schema:1, date:new Date().toISOString(), platform:process.platform,
  status:'running', targets, checks:[], compiledSourceSha256:'' };
const reportPath = path.join(directory,'report.json');
function run(label, executable, args) {
  const log = path.join(directory, String(report.checks.length).padStart(2,'0')+'.log');
  const fd = fs.openSync(log,'w');
  const begin = Date.now();
  let result;
  try { result = spawnSync(executable,args,{cwd:root,stdio:['ignore',fd,fd]}); }
  finally { fs.closeSync(fd); }
  const output = fs.readFileSync(log,'utf8').replace(/\r\n/g,'\n');
  const ok = !result.error && result.status === 0;
  const count = output.match(/Total tests:\s*(\d+),\s*passed:\s*(\d+),\s*failed:\s*(\d+)/);
  report.checks.push({ label, command:[executable,...args], status:ok?'passed':'failed',
    exitCode:result.status, durationMs:Date.now()-begin,
    ...(count?{tests:{total:Number(count[1]),passed:Number(count[2]),failed:Number(count[3])}}:{}) });
  fs.writeFileSync(reportPath,JSON.stringify(report,null,2)+'\n');
  console.log(`${ok?'PASS':'FAIL'} ${label}`);
  if (!ok) throw new Error(result.error?.message ?? output.slice(-5000));
  return output;
}
try {
  run('Toolchain','moon',['version','--all']);
  for (const file of ['LICENSE','THIRD_PARTY_NOTICES.md','README.mbt.md',
    'docs/验收材料.md','docs/development-retrospective.md']) {
    if (!fs.readFileSync(path.join(root,file),'utf8').trim()) throw new Error('Empty acceptance artifact: '+file);
  }
  for (const script of ['gen-metadata','gen-corpus','gen-non-geo','gen-compat',
    'gen-google-compat','sync-readme']) run('Generated artifact: '+script,process.execPath,['scripts/'+script+'.mjs','--check']);
  for (const target of targets) {
    run('Check '+target,'moon',['check','--target',target]);
    run('Build '+target,'moon',['build','--target',target]);
    const result = run('Tests '+target,'moon',['test','--target',target]);
    if (!/Total tests:\s*\d+,\s*passed:\s*\d+,\s*failed:\s*0\./.test(result)) {
      throw new Error('Missing successful test summary for '+target);
    }
  }
  run('Documented CLI output',process.execPath,['scripts/check-docs.mjs']);
  const example = run('Public API example','moon',['run','--target','js','examples/basic']);
  const expected = fs.readFileSync(path.join(root,'examples/basic/expected.txt'),'utf8').trim();
  if (example.trim() !== expected) throw new Error('Public API example output changed');
  if (!process.argv.includes('--skip-bench')) run('Benchmarks','moon',['bench','benchmarks']);
  run('Publishable module','moon',['package','--list']);
  const files = [];
  function walk(dir) {
    for (const entry of fs.readdirSync(dir,{withFileTypes:true})) {
      if (['.git','.cache','_build','target','.mooncakes'].includes(entry.name)) continue;
      const absolute = path.join(dir,entry.name);
      if (entry.isDirectory()) walk(absolute);
      else if (entry.name.endsWith('.mbt') || ['moon.mod','moon.pkg'].includes(entry.name)) files.push(absolute);
    }
  }
  walk(root);
  const hash = crypto.createHash('sha256');
  for (const file of files.sort()) hash.update(path.relative(root,file).replaceAll('\\','/')+'\0').update(fs.readFileSync(file,'utf8').replaceAll('\r\n','\n'));
  report.compiledSourceSha256 = hash.digest('hex');
  report.status = 'passed';
} catch (error) {
  report.status = 'failed';
  report.error = error.message;
  console.error(error.message);
  process.exitCode = 1;
} finally {
  fs.writeFileSync(reportPath,JSON.stringify(report,null,2)+'\n');
  console.log('Report: .cache/acceptance/report.json');
}
