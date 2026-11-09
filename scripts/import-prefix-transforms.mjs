// Supplement the archived plan table from a pinned original Google XML.
// Every parsing pattern must match byte-for-byte before its transform is used.
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';
const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const index = process.argv.indexOf('--xml');
if (index < 0 || !process.argv[index + 1]) throw new Error('Expected --xml PATH');
const bytes = fs.readFileSync(process.argv[index + 1]);
const xml = bytes.toString('utf8');
const sourceSha256 = crypto.createHash('sha256').update(bytes).digest('hex');
const expected = '71ccaff82d09321450143f55cceb6ea2a7965339e7a6a82e86263038bacc8ca7';
if (sourceSha256 !== expected) throw new Error('Expected the pinned libphonenumber v9.0.17 XML');
const filename = path.join(root, 'data/numbering-plans.json');
const doc = JSON.parse(fs.readFileSync(filename));
const transforms = new Map();
const territories = new Map();
for (const row of xml.matchAll(/<territory\b([^>]*)>/g)) {
  const attrs = Object.fromEntries([...row[1].matchAll(/(\w+)="([^"]*)"/g)].map(m => [m[1], m[2]]));
  territories.set(attrs.id, attrs);
  if (attrs.nationalPrefixTransformRule) transforms.set(attrs.id, attrs);
}
let count = 0;
const retainedExistingRawPatterns = [];
for (const region of doc.regions) {
  const source = territories.get(region.code);
  if (!source) throw new Error('Missing original region: ' + region.code);
  const iddPattern = (source.internationalPrefix ?? '').replace(/\s+/g, '');
  // The informational IDD was reduced to a numeric alternative in old data.
  // Verify this exact reduction before supplementing the complete pattern.
  const branches = []; let depth = 0, start = 0;
  for (let i = 0; i < iddPattern.length; i++) {
    if (iddPattern[i] === '(') depth++;
    else if (iddPattern[i] === ')') depth--;
    else if (iddPattern[i] === '|' && depth === 0) { branches.push(iddPattern.slice(start, i)); start = i + 1; }
  }
  branches.push(iddPattern.slice(start));
  const numeric = branches.filter(b=>/^\d+$/.test(b)).sort((a,b)=>a.length-b.length || a.localeCompare(b));
  if (region.idd !== (numeric[0] ?? iddPattern)) {
    // A nonnumeric legacy field was already the complete newer pattern.
    // Retain it instead of replacing it with older reference metadata.
    if (/^\d*$/.test(region.idd)) throw new Error('IDD pattern changed: ' + region.code);
    region.idd_pattern = region.idd;
    retainedExistingRawPatterns.push(region.code);
  } else region.idd_pattern = iddPattern;
  region.extension_prefix = source.preferredExtnPrefix ?? ' ext. ';
  const attrs = transforms.get(region.code);
  if (region.dial_transform !== undefined && Boolean(attrs) !== region.dial_transform) {
    throw new Error('Unexpected transform region: ' + region.code);
  }
  if (region.prefix_transform !== undefined && region.prefix_transform !== (attrs?.nationalPrefixTransformRule ?? '')) {
    throw new Error('Unexpected existing transform: ' + region.code);
  }
  if (attrs && attrs.nationalPrefixForParsing.replace(/\s+/g, '') !== region.prefix_parsing) {
    throw new Error('Prefix pattern changed: ' + region.code);
  }
  region.prefix_transform = attrs?.nationalPrefixTransformRule ?? '';
  delete region.dial_transform;
  if (attrs) count++;
}
doc.meta.prefixTransformSource = {
  url: 'https://raw.githubusercontent.com/google/libphonenumber/v9.0.17/resources/PhoneNumberMetadata.xml',
  license: 'Apache-2.0', sha256: sourceSha256, regions: count,
  note: 'Only previously omitted transform attributes; all prefix patterns verified identical. Original plan metadata provenance is unchanged.',
};
doc.meta.diallingSource = {
  url: doc.meta.prefixTransformSource.url, license:'Apache-2.0', sha256:sourceSha256,
  fields:['idd_pattern','extension_prefix'], regions:doc.regions.length, retainedExistingRawPatterns,
  note:'Missing complete internationalPrefix and preferredExtnPrefix attributes; legacy reduced IDD strings verified identical before import.',
};
fs.writeFileSync(filename, JSON.stringify(doc, null, 1) + '\n');
console.log(`Imported ${count} original Google prefix transform rules`);
