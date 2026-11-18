// Supplement network display rules from the same pinned original Java metadata
// used by the reference tests. Validation patterns keep their existing source.
import fs from 'node:fs';
import path from 'node:path';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';
import { formatsOf } from './update-metadata.mjs';

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), '..');
const argument = process.argv.indexOf('--xml');
if (argument < 0 || !process.argv[argument + 1]) throw new Error('Expected --xml PATH');
const bytes = fs.readFileSync(process.argv[argument + 1]);
const sha = crypto.createHash('sha256').update(bytes).digest('hex');
if (sha !== '71ccaff82d09321450143f55cceb6ea2a7965339e7a6a82e86263038bacc8ca7') {
  throw new Error('Expected original libphonenumber v9.0.17 metadata');
}
const filename = path.join(root, 'data/non-geographic.json');
const doc = JSON.parse(fs.readFileSync(filename, 'utf8'));
const formats = new Map();
const localLengths = new Map();
for (const [, attrs, body] of bytes.toString('utf8').matchAll(/<territory\b([^>]*)>([\s\S]*?)<\/territory>/g)) {
  if (!/\bid="001"/.test(attrs)) continue;
  const cc = Number(attrs.match(/\bcountryCode="(\d+)"/)[1]);
  formats.set(cc, formatsOf(body));
  const types = new Map();
  for (const [tag, kind] of [['tollFree','t'], ['sharedCost','s'], ['mobile','m'], ['voip','v'], ['voicemail','o'], ['uan','u'], ['premiumRate','p']]) {
    const section = body.match(new RegExp(`<${tag}>([\\s\\S]*?)</${tag}>`))?.[1];
    const local = section?.match(/\blocalOnly="([^"]+)"/)?.[1];
    if (!local) continue;
    const pattern = section.match(/<nationalNumberPattern>([\s\S]*?)<\/nationalNumberPattern>/)?.[1].replace(/\s+/g,'');
    if (!/^\d+(?:,\d+)*$/.test(local)) throw new Error('Unsupported local-only length list');
    types.set(kind, {pattern, lengths:local.split(',').map(Number)});
  }
  localLengths.set(cc, types);
}
for (const network of doc.networks) {
  const rules = formats.get(network.calling_code);
  if (!rules?.length) throw new Error('Missing network formats: '+network.calling_code);
  network.formats = rules;
  for (const type of network.types) {
    const source = localLengths.get(network.calling_code).get(type.kind);
    if (source && source.pattern !== type.pattern) throw new Error('Local-only source pattern differs');
    type.local_only = source?.lengths ?? [];
  }
}
doc.meta.formatSource = {
  url:'https://raw.githubusercontent.com/google/libphonenumber/v9.0.17/resources/PhoneNumberMetadata.xml',
  license:'Apache-2.0', sha256:sha, generator:'scripts/import-network-formats.mjs',
};
doc.meta.tableSha256 = crypto.createHash('sha256').update(JSON.stringify(doc.networks)).digest('hex');
fs.writeFileSync(filename, JSON.stringify(doc, null, 2)+'\n');
console.log(`Recorded formats for ${formats.size} non-geographic networks`);
