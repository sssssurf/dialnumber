# dialnumber

Phone number parsing, validation and formatting for MoonBit, driven by the
national numbering plans behind ITU-T E.164.

A phone number written by a person is a mess of spaces, dashes, parentheses,
trunk prefixes and country codes, and the same number can be written a dozen
ways. `dialnumber` turns any of them into one value, decides what the plan says
about it, and renders it back in whichever of the standard shapes you need.

The table covers **245 numbering plans**, and each plan carries the real rules
rather than only its lengths: a pattern engine interprets those rules, and a data
pipeline regenerates the whole table from Google's libphonenumber metadata with a
recorded checksum. Every public function is total — bad input comes back as
`None` or `false`, never as an exception.

## What it does

- **Parse** an E.164 number (`+81 90-1234-5678`), a number dialled
  internationally (`011 44 20 7946 0958` from the NANP), or a number dialled
  nationally with a region hint (`090-1234-5678` in Japan) into a `PhoneNumber`.
- **Check possibility** — the cheap test: a known calling code and a length the
  plan uses.
- **Check validity** — the rule test: the national number must match one of the
  plan's published patterns. This is libphonenumber's "valid" verdict, and it is
  a real decision procedure rather than a length check.
- **Name the number type** the rules report: fixed-line, mobile, the shared
  fixed-line-or-mobile, toll-free, premium-rate, shared-cost, voip, uan, personal,
  pager, voicemail — with libphonenumber's precedence between them.
- **Resolve the region** of a number, including every calling code several
  territories share. All 25 territories of the `+1` space resolve from their own
  area-code allocation, so `+1 204…` is Canada, `+1 787…` is Puerto Rico and
  `+1 868…` is Trinidad and Tobago.
- **Format** to E.164, international, national, or an RFC 3966 `tel:` URI — and
  the two human renderings carry the plan's own grouping: `(201) 555-0123`,
  `020 7946 0958`, `090-1234-5678`, `+55 11 98765-4321`.
- **Look up** regions by code or by calling code, with the plan's international
  and national prefixes, the lengths it uses and the raw rules behind a verdict.
- **Read and write** RFC 3966 `tel:` URIs with the full grammar: global and
  local numbers, numeric or domain `;phone-context=`, `;ext=` and `;isub=`.
  Parsing keeps each part separate, and the parser and serialiser are inverses.

## Two levels of validation

The distinction is the same one libphonenumber draws, and it is worth being
explicit about because it is the difference between "could exist" and "is
assigned".

| Level | Question | Answer comes from |
| --- | --- | --- |
| `is_possible` | known calling code, length the plan uses? | published lengths (and the NANP's shape rules for `+1`) |
| `is_valid` | does the number match a published rule? | the plan's per-type patterns, interpreted by the engine |
| `number_type` | which rule matched? | the same walk, in libphonenumber's precedence order |

For `+1` the structural rule runs first: ten digits, area code and exchange
starting 2–9, no N11 area code. A number can therefore be *possible* and not
*valid* — `+1 555-555-0123` has the right shape, but 555 is not an assigned area
code, so no territory's allocation claims it.

```moonbit nocheck
///|
let pn = @dialnumber.parse("+1 204-254-5000", "")

///|
match pn {
  Some(n) => {
    @dialnumber.region_of_number(n)  // Some("CA")
    @dialnumber.is_possible(n)      // true
    @dialnumber.is_valid(n)         // true
    @dialnumber.number_type(n)      // Some(FixedLineOrMobile)
  }
  None => ()
}
```

## The plans' own grouping

A number is not written the same way in two countries, and the library does not
invent a grouping: `plan_data.mbt` carries each plan's formatting rules — a
pattern of digit groups, the text between them, the leading digits that select
the rule, and the plan's national-prefix rule — and `format_national` /
`format_international` render through the first rule that fits. When a plan
publishes no rule for a shape, the number falls back to its ungrouped form.

```moonbit nocheck
///|
let us = @dialnumber.PhoneNumber::new(1, "2015550123")
@dialnumber.format_national(us, "US")        // Some("(201) 555-0123")
@dialnumber.format_international(us)         // "+1 201-555-0123"

///|
let gb = @dialnumber.PhoneNumber::new(44, "2079460958")
@dialnumber.format_national(gb, "GB")        // Some("020 7946 0958")
@dialnumber.format_international(gb)         // "+44 20 7946 0958"
```

Two rules make the output reproducible rather than plausible. A national
rendering must read back as the same number in the same region — the generated
tests assert exactly that for every fixed-line and mobile example — and the
grouping comes from data, so a plan that changes its style changes with a data
refresh.

National dialling is not always the inverse of formatting: Argentina writes a
mobile as `011 15-…` while its international form carries the `9`, and a few
plans rewrite the number while parsing. That rewriting (`nationalPrefixForParsing`
with a transform rule) is not implemented, and the generated round-trip tests
skip the plans that publish one instead of pretending otherwise.

## The rule engine

`pattern.mbt` is a small regular-expression engine built for exactly the grammar
the numbering plans use: literals, `\d`, character classes with ranges,
non-capturing groups, alternation, and the `?`, `*`, `+`, `{n}`, `{n,}` and
`{n,m}` quantifiers. A recursive-descent parser builds a syntax tree, the tree is
compiled to a Thompson NFA, and matching simulates the NFA over a set of live
states.

Three properties follow from that construction, and all three are tested:

- **Linear in pattern size times input length.** There is no backtracking, so no
  pattern can make a validation call explode — the failure mode that makes
  regex-based validators unsafe on hostile input simply does not exist here.
- **Total.** A pattern that does not parse matches nothing, so a bad data row can
  never become a false positive. `pattern_well_formed` exposes the same check.
- **Data, not code.** The rules are strings in the generated table; a plan that
  changes its ranges is a data refresh, not a source change.

```moonbit nocheck
///|
@dialnumber.matches_pattern("[2-9]\\d{9}", "2042545000")  // true
@dialnumber.matches_pattern("[2-9]\\d{9}", "204254500")   // false: full match only
@dialnumber.pattern_well_formed("[2-9]\\d{9}")            // true
@dialnumber.plan_pattern("DK")                            // Some("[2-9]\\d{7}")
```

## Where the data comes from, and how it is maintained

The table is generated, not hand-written:

```text
PhoneNumberMetadata.xml          upstream, Apache-2.0, pinned by SHA-256
        |  scripts/update-metadata.mjs      fetch, extract, validate the grammar
        v
data/numbering-plans.json        one record per region: prefixes, types,
        |                        patterns, lengths, example numbers,
        |                        and the formatting rules
        |  scripts/gen-metadata.mjs         emit MoonBit
        v
plan_data.mbt                    the table the library compiles
plan_examples_test.mbt           1 132 published example numbers as golden tests
plan_corpus_test.mbt             the engine cross-checked against a regex engine
```

`data/numbering-plans.json` records the source URL, the license, the retrieval
date and the SHA-256 of the exact upstream file it was extracted from, so a
refresh is auditable. Both `scripts/gen-metadata.mjs --check` and
`scripts/gen-corpus.mjs` are run by CI: editing a generated file by hand, or
forgetting to regenerate after a data refresh, fails the build instead of
drifting silently.

```bash
node scripts/update-metadata.mjs   # fetch a fresh copy of the upstream XML
node scripts/gen-metadata.mjs      # regenerate the table and the example tests
node scripts/gen-corpus.mjs        # regenerate the differential corpus
node scripts/check-docs.mjs        # verify the docs still match real output
```

## Coverage: 245 plans and the whole NANP

The table holds every geographic territory the upstream metadata describes, with
the number types each plan defines and the way it writes its numbers: 245
regions, 1 132 per-type rules, 740 formatting rules and 1 132 published example
numbers.

The North American Numbering Plan is the largest shared calling code: 25
territories on `+1`. Each publishes its own area-code allocation, so resolution
walks those allocations instead of a hard-coded list — the United States, Canada,
Puerto Rico, Jamaica, the Bahamas, Trinidad and Tobago, Guam and the rest all
resolve to themselves, while a shared range such as a toll-free `800` number
resolves to the plan's main country.

```moonbit nocheck
///|
@dialnumber.nanp_region_codes().length()  // 25
@dialnumber.nanp_region_of("2042545000")  // Some("CA")
@dialnumber.nanp_region_of("7872345678")  // Some("PR")
@dialnumber.nanp_region_of("2011550123")  // None: NXX starts with 1
```

Non-geographic calling codes (`+800` international freephone and its neighbours)
describe networks rather than territories, so they are outside a region-keyed
table by design; the README's boundary note applies to them.

## RFC 3966 without losing the context

A `tel:` URI can carry a *local* number whose meaning depends on a
`phone-context` — either a numeric prefix (`+1-919`) or a domain
(`example.com`). The two forms are handled differently:

- **numeric context** resolves: the context prefix and the local digits form an
  E.164 number;
- **domain context** parses, serialises and round-trips, but does **not**
  resolve, because answering it requires asking that domain.

The parsed `TelUri` keeps `global_number`, `local_number`, `phone_context`,
`extension` and `isub` in separate fields; nothing is merged into the digits.
`parse_tel_uri_full` and `to_tel_uri_full` are inverses, and resolution is a
separate step (`resolve_tel_uri`). Extensions and ISDN subaddresses are mutually
exclusive, as the RFC requires; unknown, duplicate and empty parameters are
rejected rather than dropped; spaces are not accepted as visual separators; and
an `isub` value is checked as a run of URI characters, so a `%` must start a
complete `%HH` escape.

## RFC 3966: what the grammar actually covers

A local number is not resolved by gluing strings together; the RFC gives it a
context and states what that context means.

```
telephone-subscriber = global-number / local-number
local-number         = local-number-digits *par context *par
context              = ";phone-context=" descriptor
descriptor           = domainname / global-number-digits
```

- A **numeric descriptor** (+1-914-555) is a prefix context. The RFC's own
  example, 	el:863-1234;phone-context=+1-914-555, means +1 914 555 863 1234:
  the context is normalised to its digits, the local digits follow it, and the
  result is checked as a number of that calling code. The context stays a field
  of its own, so parse_tel_uri_full and 	o_tel_uri_full are inverses.
- A **domain descriptor** (example.com) names an authority. How a local number
  reads inside that domain is the domain's answer, not something an offline
  library can infer — so it parses, serialises and round-trips, and
  esolve_tel_uri returns None instead of inventing a country code.

Implemented: global-number/local-number, global-number-digits and
local-number-digits (visual separators, HEXDIG, *, #), both descriptor
shapes, ;ext=, ;isub= (validated as 1*uric, escapes checked and
canonicalised), generic parameters (;pname, ;pname=pvalue, kept and written
back in lexicographical order), case-insensitive scheme and names, and the RFC's
parameter order (ext/isub, then phone-context, then the rest). Not
implemented: authority resolution for a domain context, the decoded semantics of
isub, carrier-code formatting, and incremental (AsYouType) rendering.

## Relationship to other MoonBit libraries

The ecosystem has plenty of validators, and none of them do this. `moon_zod`,
`moonschema` and `jsonschema` validate JSON against a schema, including `email`
and `uuid` string formats; they do not know about telephone numbering.
`moovalid` and `maru` are validator-combinator frameworks. `mooncontract`
validates OpenAPI contracts, and `moonmrz` reads the ICAO 9303 machine-readable
zone of a passport. `dialnumber` sits alongside them: it takes a phone number in
and gives you its parts, its plan, its verdict and its canonical renderings, with
no I/O and no dependencies.

## Install

```bash
moon add sssssurf/dialnumber
```

## Quick start

```moonbit nocheck
///|
let pn = @dialnumber.parse("011 44 20 7946 0958", "US")

///|
match pn {
  Some(n) => {
    @dialnumber.format_e164(n)           // "+442079460958"
    @dialnumber.format_national(n, "GB") // Some("020 7946 0958")
    @dialnumber.is_possible(n)           // true
    @dialnumber.is_valid(n)              // true
    @dialnumber.region_of_number(n)      // Some("GB")
  }
  None => ()
}
```

## Command line

The `cmd/main` package is a small front end. Every subcommand prints a plain
report, and the text below is recorded from a real run.

```bash
moon run cmd/main -- parse "+81 90-1234-5678"
moon run cmd/main -- valid "+1 787-234-5678"
moon run cmd/main -- possible "090-1234-5678" JP
moon run cmd/main -- format "090-1234-5678" JP
moon run cmd/main -- types "+86 131 2345 6789"
moon run cmd/main -- region "+442079460958"
moon run cmd/main -- info JP
moon run cmd/main -- cc de
moon run cmd/main -- tel "tel:555-0123;phone-context=+1-919;ext=42"
moon run cmd/main -- match "\d{8}" 12345678
moon run cmd/main -- list
```

A few of those, with the output they produce:

```text
$ moon run cmd/main -- parse "+81 90-1234-5678"
country_code: 81
national_number: 9012345678
e164: +819012345678
region: JP

$ moon run cmd/main -- valid "+1 787-234-5678"
valid: yes
type: fixed-line-or-mobile
region: PR

$ moon run cmd/main -- types "+86 131 2345 6789"
length candidates: fixed-line,mobile,shared-cost
pattern verdict: mobile

$ moon run cmd/main -- info JP
region: JP
name: Japan
calling_code: 81
idd: 010
national_prefix: 0
lengths: 8,9,10,11,12,13,14,15,16,17

$ moon run cmd/main -- tel "tel:555-0123;phone-context=+1-919;ext=42"
global_number: (none)
local_number: 5550123
phone_context: +1919
extension: 42
isub: (none)
resolved: +19195550123

$ moon run cmd/main -- match "\d{8}" 12345678
well_formed: yes
matches: yes
```

## API

Parsing and validation:

| Function | Purpose |
| --- | --- |
| `parse(input, region)` | read any written form into a `PhoneNumber?` |
| `parse_e164(input)` | read only a `+`-prefixed number |
| `parse_national(input, region)` | read a number as dialled in a region |
| `is_possible(pn)` | known code and a length the plan uses, plus NANP shape for `+1` |
| `is_possible_in_region(pn, region)` | the same, against one named region |
| `is_possible_number(input, region)` | parse then check, in one call |
| `is_valid(pn)` | the national number matches a published rule |
| `is_valid_in_region(pn, region)` | the same, against one named region |
| `is_valid_number(input, region)` | parse then validate, in one call |
| `number_type(pn)` | the type the rules report, in libphonenumber's precedence |
| `number_type_in_region(pn, region)` | the same, within one named region |
| `possible_types(pn)` | number types whose *length* admits the number |
| `possible_types_in_region(pn, region)` | the same, within one region |
| `region_of_number(pn)` | the region the number resolves to |

The pattern engine and the rules behind a verdict:

| Function | Purpose |
| --- | --- |
| `matches_pattern(pattern, text)` | full-match under the numbering-plan grammar |
| `pattern_well_formed(pattern)` | is the rule inside the supported grammar |
| `plan_pattern(code)` | the plan's overall rule, as published |
| `type_pattern(code, kind)` | the rule published for one number type |

Formatting and `tel:` URIs:

| Function | Purpose |
| --- | --- |
| `format_e164(pn)` | `+8613123456789` |
| `format_international(pn)` | `+86 131 2345 6789`, grouped by the plan |
| `format_national(pn, region)` | trunk prefix plus grouped national number |
| `format_dialling(pn, from_region)` | `011 442079460958`, or the national form at home |
| `format_rfc3966(pn)` | `tel:+8613123456789;ext=42` |
| `parse_tel_uri(uri)` | parse and resolve a `tel:` URI |
| `parse_tel_uri_full(uri)` | parse into a `TelUri?` without resolving |
| `to_tel_uri_full(t)` | serialise a `TelUri` canonically |
| `resolve_tel_uri(t)` | resolve parsed parts, when the context allows |
| `to_tel_uri(pn)` | write a `tel:` URI for a number |

The NANP and the region table:

| Function | Purpose |
| --- | --- |
| `nanp_possible(nsn)` | ten-digit NANP structure |
| `nanp_region_of(nsn)` | the territory a `+1` number belongs to |
| `nanp_region_codes()` | every region in the NANP |
| `nanp_area_code(nsn)` | the first three digits of a NANP number |
| `region_codes()` | every region code in the table |
| `region_exists(code)` | is the code in the table |
| `canonical_region_code(code)` | the table's spelling of a code |
| `region_name(code)` | English name |
| `calling_code(code)` | E.164 calling code |
| `idd_prefix(code)` | international dial-out prefix |
| `national_prefix(code)` | trunk prefix, or `None` |
| `possible_lengths(code)` | national-number lengths |
| `local_only_lengths(code)` | lengths accepted only when dialled locally |
| `region_by_calling_code(cc)` | one region for a calling code |
| `regions_by_calling_code(cc)` | every region for a calling code |

The `NumberType` enum names the eleven categories. The `PhoneNumber` struct holds
`country_code`, `national_number` (a string, so a significant leading zero
survives), and `extension`. `TelUri` holds the five parts of a `tel:` URI.

## Performance

Three decisions keep a validation out of the millisecond range: a rule is
compiled once and memoised in the table, the matcher walks only the states that
are alive rather than the whole program, and a territory that publishes leading
digits is filtered by them before its full rules run — the same first question
libphonenumber asks. A plan rule is a large alternation, and after the first digit
only a few of its branches can still match.

Measured with `moon bench benchmarks` (wasm target, mean per call; the first call
for a rule pays its compilation, later calls reuse it):

| Operation | Time |
| --- | --- |
| `is_possible` | 0.13 µs |
| `format_e164` | 0.10 µs |
| `format_national` | 3.9 µs |
| `is_valid` (a single-plan number) | 4.5 µs |
| `parse` (E.164) | 4.9 µs |
| `parse` (`tel:` URI) | 9.1 µs |
| `region_of_number` | 12.8 µs |
| `parse` (national) | 15.8 µs |
| `is_valid` (a NANP number, 25 territories to disambiguate) | 15.9 µs |
| `format_international` | 18.7 µs |

The benchmarks live in `benchmarks/` and are part of the repository so a
regression shows up as a number, not as an opinion.

## Tests

346 tests cover the public API, the pattern engine, the formatting rules, the
generated table, the `tel:` grammar, the invariants of random input, and
robustness against malformed input. The bulk of them are generated from the same
data the library ships, so a data refresh grows the suite with it:

- one block per region, asserting that every published example number is
  accepted by its plan, resolves to the region the data says, reports a
  plausible type, and — for fixed-line and mobile examples — reads back as the
  same number when its national rendering is parsed again;
- a differential corpus that runs every published rule against its example and
  a mutated near miss, with the expected answer computed by an independent
  regular-expression engine;
- property tests: a deterministic generator walks random numbers through the
  invariants (an E.164 rendering parses back to itself, a valid number is always
  possible, a reported type implies validity), and random text through every
  entry point;
- whitebox checks that the table matches the metadata counts, that every rule is
  inside the engine's grammar, and that the NANP is complete;
- unit tests for the grammar, the operators, the refusals, matching time on long
  input, the grouping of a dozen plans, and the round-trip invariant;
- a robustness suite that feeds junk, 500-digit numbers and lone separators
  through every public entry point.

```bash
moon test
```

## License

Apache-2.0. See `LICENSE`. The numbering-plan data is derived from Google's
[libphonenumber](https://github.com/google/libphonenumber) (Apache-2.0), and the
region display names come from CLDR through the generator's `Intl.DisplayNames`.
