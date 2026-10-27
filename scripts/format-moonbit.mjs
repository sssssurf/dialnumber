import fs from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

// Use the installed project toolchain; no shell and no generated-file drift.
export function formatMoonBit(source) {
  const cache = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '../.cache');
  fs.mkdirSync(cache, { recursive: true });
  const scratch = fs.mkdtempSync(path.join(cache, 'format-'));
  try {
    const input = path.join(scratch, 'input.mbt');
    const output = path.join(scratch, 'formatted.mbt');
    fs.writeFileSync(input, source);
    const result = spawnSync('moonfmt', [input, '-o', output], { stdio: 'inherit' });
    if (result.error) throw result.error;
    if (result.status !== 0) throw new Error('moonfmt failed');
    return fs.readFileSync(output, 'utf8');
  } finally {
    fs.rmSync(scratch, { recursive: true, force: true });
  }
}
