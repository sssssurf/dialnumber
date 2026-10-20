// Regenerate data/numbering-plans.json from Google's libphonenumber metadata.
//
//   node scripts/update-metadata.mjs            # fetch + extract
//   node scripts/update-metadata.mjs --xml PATH # extract from a local copy
//
// The XML is Apache-2.0 and is *not* committed: only the derived table is, next
// to the SHA-256 of the exact source file it came from, so the extraction is
// reproducible without shipping a 1 MB upstream blob.
import fs from "node:fs";
import path from "node:path";
import crypto from "node:crypto";
import { fileURLToPath } from "node:url";

const ROOT = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const OUT = path.join(ROOT, "data", "numbering-plans.json");
const URL =
  "https://fastly.jsdelivr.net/gh/google/libphonenumber@master/resources/PhoneNumberMetadata.xml";

// The ten number-type elements, in libphonenumber's precedence order.
const TYPES = [
  ["fixedLine", "f"],
  ["mobile", "m"],
  ["tollFree", "t"],
  ["premiumRate", "p"],
  ["sharedCost", "s"],
  ["voip", "v"],
  ["personalNumber", "r"],
  ["uan", "u"],
  ["pager", "g"],
  ["voicemail", "o"],
];

const xmlPath = (() => {
  const i = process.argv.indexOf("--xml");
  if (i > 0) return process.argv[i + 1];
  return path.join(ROOT, ".cache", "PhoneNumberMetadata.xml");
})();

async function ensureXml() {
  if (fs.existsSync(xmlPath)) return;
  fs.mkdirSync(path.dirname(xmlPath), { recursive: true });
  const res = await fetch(URL);
  if (!res.ok) throw new Error(`download failed: ${res.status}`);
  fs.writeFileSync(xmlPath, Buffer.from(await res.arrayBuffer()));
}

const strip = (s) => s.replace(/\s+/g, "");

// Patterns are checked against the deliberately small grammar the engine
// supports; anything else has to be handled before the table can be generated.
function checkPattern(p, where) {
  let i = 0;
  while (i < p.length) {
    const c = p[i];
    if (c >= "0" && c <= "9") { i++; continue; }
    if (c === "\\") { if (p[i + 1] !== "d") throw new Error(`bad escape in ${where}: ${p.slice(i, i + 4)}`); i += 2; continue; }
    if ("[]()-?:{},|".includes(c)) { i++; continue; }
    throw new Error(`unsupported character ${JSON.stringify(c)} in ${where}: ${p.slice(0, 60)}`);
  }
}

// The published IDD is itself an expression ("00|99(?:...)", "0011"). For the
// informational idd_prefix() we keep the shortest purely numeric alternative.
function shortIid(expr) {
  const branches = [];
  const walk = (s) => {
    // split on top-level '|'
    let depth = 0, start = 0;
    for (let i = 0; i < s.length; i++) {
      if (s[i] === "(") depth++;
      else if (s[i] === ")") depth--;
      else if (s[i] === "|" && depth === 0) { branches.push(s.slice(start, i)); start = i + 1; }
    }
    branches.push(s.slice(start));
  };
  walk(expr);
  const numeric = branches.filter((b) => /^\d+$/.test(b)).sort((a, b) => a.length - b.length || a.localeCompare(b));
  return numeric[0] ?? expr;
}

function pick(body, tag) {
  const m = body.match(new RegExp(`<${tag}>([\\s\\S]*?)</${tag}>`));
  return m ? m[1] : null;
}

function patternOf(fragment) {
  const m = fragment?.match(/<nationalNumberPattern>([\s\S]*?)<\/nationalNumberPattern>/);
  return m ? strip(m[1]) : "";
}

function lengthsOf(fragment) {
  const m = fragment?.match(/<possibleLengths\b([^>]*)>/);
  if (!m) return {};
  const attrs = {};
  for (const a of m[1].matchAll(/(\w+)="([^"]*)"/g)) attrs[a[1]] = a[2];
  const out = {};
  if (attrs.national) out.national = expandLengths(attrs.national);
  if (attrs.localOnly) out.localOnly = expandLengths(attrs.localOnly);
  return out;
}

// The metadata writes length sets as "4,10,12" or with an interval, "[5-12]",
// and occasionally mixes the two: "[6-8],10,12".
function expandLengths(raw) {
  const out = [];
  for (const part of raw.split(",")) {
    const s = part.trim();
    const interval = s.match(/^\[(\d+)-(\d+)\]$/);
    if (interval) {
      for (let i = Number(interval[1]); i <= Number(interval[2]); i++) out.push(i);
    } else if (/^\d+$/.test(s)) {
      out.push(Number(s));
    } else {
      throw new Error(`unreadable possible length ${JSON.stringify(s)}`);
    }
  }
  return out;
}

// Formatting rules. Each rule is a pattern made only of capture groups over
// digit runs, a format string referring to them as $1..$9, and optionally the
// national-prefix rule ($NP) and an international variant.
function formatsOf(body) {
  const af = body.match(/<availableFormats>([\s\S]*?)<\/availableFormats>/);
  if (!af) return [];
  const out = [];
  for (const m of af[1].matchAll(/<numberFormat\b([^>]*)>([\s\S]*?)<\/numberFormat>/g)) {
    const attrs = {};
    for (const a of m[1].matchAll(/(\w+)="([^"]*)"/g)) attrs[a[1]] = a[2];
    const pattern = strip(attrs.pattern ?? "");
    if (!formatPatternOk(pattern)) {
      throw new Error(`unsupported format pattern ${JSON.stringify(pattern)}`);
    }
    const leading = [...m[2].matchAll(/<leadingDigits>([\s\S]*?)<\/leadingDigits>/g)].map((x) => strip(x[1]));
    const format = trimTag(m[2], "format");
    const intl = trimTag(m[2], "intlFormat");
    const prefixRule = (attrs.nationalPrefixFormattingRule ?? "").trim();
    const rule = {
      pattern,
      leading,
      format,
      ...(intl ? { intl } : {}),
      ...(prefixRule ? { prefix_rule: prefixRule } : {}),
      ...(attrs.nationalPrefixOptionalWhenFormatting === "true" ? { optional: true } : {}),
    };
    out.push(rule);
  }
  return out;
}

function trimTag(body, tag) {
  const m = body.match(new RegExp(`<${tag}>([\\s\\S]*?)</${tag}>`));
  return m ? m[1].trim() : "";
}

function formatPatternOk(pattern) {
  return /^(?:\(\\d(?:\{\d+(?:,\d*)?\}|[+*?])?\))+$/.test(pattern);
}

const display = new Intl.DisplayNames(["en"], { type: "region" });

function regionName(code) {
  try {
    return display.of(code) ?? code;
  } catch {
    return code;
  }
}

async function main() {
  await ensureXml();
  const xml = fs.readFileSync(xmlPath);
  const sha = crypto.createHash("sha256").update(xml).digest("hex");
  const text = xml.toString("utf8");

  const territories = [...text.matchAll(/<territory\b([^>]*)>([\s\S]*?)<\/territory>/g)];
  const regions = [];
  let patternCount = 0;
  const skipped = [];

  for (const [, rawAttrs, body] of territories) {
    const attrs = {};
    for (const a of rawAttrs.matchAll(/(\w+)="([^"]*)"/g)) attrs[a[1]] = a[2];
    const code = attrs.id;
    if (!/^[A-Z]{2}$/.test(code)) {
      // The "001" rows are the non-geographic codes (+800, +870, ...): they have
      // no region to resolve to, so they stay out of a region-keyed table.
      skipped.push(attrs.countryCode);
      continue;
    }

    const general = patternOf(pick(body, "generalDesc"));
    if (general) { checkPattern(general, `${code} general`); patternCount++; }

    const types = [];
    for (const [tag, kind] of TYPES) {
      const fragment = pick(body, tag);
      if (!fragment) continue;
      const pattern = patternOf(fragment);
      if (!pattern) continue;
      checkPattern(pattern, `${code} ${tag}`);
      patternCount++;
      const lens = lengthsOf(fragment);
      const example = pick(fragment, "exampleNumber");
      types.push({
        kind,
        pattern,
        national: lens.national ?? [],
        ...(lens.localOnly ? { local_only: lens.localOnly } : {}),
        ...(example ? { example: example.trim() } : {}),
      });
    }

    const formats = formatsOf(body);

    regions.push({
      code,
      name: regionName(code),
      calling_code: Number(attrs.countryCode),
      idd: shortIid(strip(attrs.internationalPrefix ?? "")),
      national_prefix: attrs.nationalPrefix ?? "",
      // How a national number's trunk prefix is recognised when parsing. It is
      // usually the plain prefix, but some plans publish a pattern ("0|80?")
      // because more than one spelling is dialled.
      prefix_parsing: strip(attrs.nationalPrefixForParsing ?? ""),
      // The territory's own leading-digit pattern: how territories that share a
      // calling code tell each other apart, and much cheaper to test than the
      // full type rules.
      leading_digits: strip(attrs.leadingDigits ?? ""),
      // Some plans rewrite the national number while parsing (Argentina turns
      // "011 15-…" into "9 11 …", Belarus drops an extra trunk digit). That
      // machinery is `nationalPrefixForParsing` plus a transform rule; this
      // library does not implement it, and records the fact so the generated
      // round-trip tests do not claim otherwise.
      dial_transform: Boolean(attrs.nationalPrefixTransformRule),
      primary: attrs.mainCountryForCode === "true",
      general,
      types,
      formats,
    });
  }

  regions.sort((a, b) => a.code.localeCompare(b.code));

  const formatCount = regions.reduce((n, r) => n + r.formats.length, 0);
  const doc = {
    meta: {
      source: "google/libphonenumber resources/PhoneNumberMetadata.xml",
      url: URL,
      license: "Apache-2.0",
      sha256: sha,
      retrieved: new Date().toISOString().slice(0, 10),
      regions: regions.length,
      patterns: patternCount,
      formats: formatCount,
      generator: "scripts/update-metadata.mjs",
    },
    regions,
  };

  fs.mkdirSync(path.dirname(OUT), { recursive: true });
  fs.writeFileSync(OUT, JSON.stringify(doc, null, 1) + "\n");

  const bytes = fs.statSync(OUT).size;
  const types = regions.reduce((n, r) => n + r.types.length, 0);
  console.log(
    `regions=${regions.length} types=${types} patterns=${patternCount} formats=${formatCount} ` +
      `bytes=${bytes} skipped_non_geo=${skipped.length} sha256=${sha.slice(0, 12)}`,
  );
  const noPatterns = regions.filter((r) => r.types.length === 0).map((r) => r.code);
  if (noPatterns.length) console.log("regions without type patterns:", noPatterns.join(","));
}

await main();
