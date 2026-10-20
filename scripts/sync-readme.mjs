// Sync README.md (the GitHub rendering) from README.mbt.md (the literate source).
//
//   node scripts/sync-readme.mjs           # write README.md
//   node scripts/sync-readme.mjs --check   # fail when it is out of date
//
// README.mbt.md is the source of truth: `moon` uses it as the package README, and
// its MoonBit blocks are the ones the tooling understands. GitHub needs ordinary
// Markdown, so the only changes are dropping the `///|` doc markers and turning
// `nocheck` fences into plain MoonBit fences.
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const SRC = path.join(ROOT, "README.mbt.md");
const DST = path.join(ROOT, "README.md");

const source = fs.readFileSync(SRC, "utf8");
const rendered = source
  .split(/\r?\n/)
  .filter((line) => line.trim() !== "///|")
  .join("\n")
  .replace(/```moonbit nocheck/g, "```moonbit");

const current = fs.existsSync(DST) ? fs.readFileSync(DST, "utf8") : "";
if (current === rendered) {
  console.log("README.md is up to date");
  process.exit(0);
}
if (process.argv.includes("--check")) {
  console.error("README.md is out of date: run node scripts/sync-readme.mjs");
  process.exit(1);
}
fs.writeFileSync(DST, rendered);
console.log(`wrote README.md (${rendered.length} bytes)`);
