# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project aims to
follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.2] - 2026-10-20

Republished with the parameter tests in place: 0.7.1 went out before they were
written, so the version moved instead of rewriting a published release.

## [0.7.0] - 2026-10-20

The RFC 3966 grammar is now wider than it was, and the claim matches the code.

### Added

- Generic parameters (`;pname` and `;pname=pvalue`) are parsed, validated
  against `pname`/`paramchar` and kept in `TelUri.parameters`; the serialiser
  writes them back in lexicographical order, as RFC 3966 §5.1 asks.
- `isub` accepts the two `uric` characters a parameter grammar tends to
  swallow: `;` and `?`.

### Changed

- `to_tel_uri_full` writes parameters in RFC order: `ext`/`isub` first, then
  `phone-context`, then the rest. A local number with an extension now
  serialises as `tel:5550123;ext=42;phone-context=+1919`.
- An unknown parameter is preserved instead of refused; a name or value outside
  the grammar is still rejected.
- The test count is now 345.

## [0.6.0] - 2026-10-20

Leading digits as the first question, and the performance that follows from it.

### Added

- Every territory's published `leadingDigits` pattern is part of the table, and
  the prefix matcher (`run_pattern_prefix`) answers "does the number start
  inside this territory's allocation?" in one pass over the input.
- `nationalPrefixForParsing` is used to recognise a trunk prefix while parsing,
  so a plan that accepts more than one spelling parses them the same way.

### Changed

- `region_of_number` and `nanp_region_of` filter candidates by their leading
  digits before running the full type rules: the same order libphonenumber uses,
  and the reason a `+1` resolution now takes 12.8 µs instead of 45.
- Format selection also uses the cached leading-digit pattern, with the same
  prefix matcher.
- Measured (`moon bench benchmarks`, wasm): `is_valid` on a NANP number 48.5 µs →
  15.9 µs, `number_type` 52.6 µs → 20.2 µs, `region_of_number` 45.1 µs →
  12.8 µs, `format_national` 32.9 µs → 3.9 µs, `format_international` 70.4 µs →
  18.7 µs — against 2.45 ms / 2.34 ms / 2.35 ms before 0.5.0.

## [0.5.0] - 2026-10-20

Speed, a dialling form, and property tests.

### Added

- `format_dialling(pn, from_region)`: the number as a caller in that region dials
  it — `011 442079460958` from the NANP, `00 442079460958` from Europe, the
  national form when the number is at home. A plan whose dial-out prefix is
  published as an expression rather than digits falls back to the `+` form.
- A benchmark suite in `benchmarks/` (`moon bench benchmarks`) for parsing,
  validation, region resolution and rendering, so a performance regression shows
  up as a number.
- Property tests over a deterministic generator: E.164 round-trip, valid implies
  possible, a reported type implies validity, and arbitrary text through every
  entry point. 339 tests in total.

### Changed

- Type rules, the plan's overall rule and the trunk-prefix pattern are compiled
  once and memoised in the table instead of being re-parsed on every call.
- The pattern matcher now simulates only the live states of the NFA instead of
  sweeping the whole program for each character.
- Together these take `is_valid` on a single-plan number from ~489 µs to ~4.8 µs,
  and on a NANP number (25 territories to disambiguate) from ~2.45 ms to
  ~48 µs; `parse` of a national number drops from ~117 µs to ~16 µs.

## [0.4.0] - 2026-10-20

Formatting from the plans' own rules, so a number is rendered the way its country
writes it.

### Added

- The numbering-format table: 740 formatting rules extracted from the upstream
  metadata, carried in `data/numbering-plans.json` and generated into
  `plan_data.mbt`. A rule is a pattern of digit groups, the text between them,
  the leading digits that select it, the international variant and the plan's
  national-prefix rule.
- Grouped renderings: `format_national` returns `(201) 555-0123`,
  `020 7946 0958`, `090-1234-5678`, `8 (495) 123-45-67`; `format_international`
  returns `+44 20 7946 0958`, `+55 11 98765-4321`, and so on. A plan with no
  rule for the shape still falls back to the ungrouped form.
- `nationalPrefixForParsing` is used when a plan publishes it, so a number that
  can be dialled with more than one trunk spelling parses the same way.
- `PhoneNumber` implements `Debug`, so a test failure prints the number rather
  than only its fields.
- Generated round-trip tests: for every fixed-line and mobile example, the
  national rendering must parse back to the same number in the same region.
- Unit tests for the grouping of a dozen plans, the fallback path and the
  round-trip invariant.

### Changed

- `format_international` now groups the national part by the plan's rules
  instead of printing the bare digits.
- `format_national` now returns the plan's grouped form with its national-prefix
  rule applied, instead of trunk prefix plus ungrouped digits.
- The demo, README, reproducible-demo record and retrospective cover the
  formatting rules; the test count is now 332.

### Known limitations

- National dialling is not always the inverse of formatting (Argentina writes
  `011 15-…` nationally and `9 11 …` internationally, Belarus drops a digit).
  The rewrite machinery (`nationalPrefixForParsing` with a transform rule) is not
  implemented; the plans that publish one are skipped by the round-trip tests.

## [0.3.0] - 2026-10-20

A real rule engine, a data pipeline that generates the plan table, and full
North American coverage. The table grows from 51 plans to all 245 territories in
the upstream metadata.

### Added

- `pattern.mbt`: a pattern engine for the numbering-plan grammar — a
  recursive-descent parser, a Thompson NFA compiler, and a state-set simulation
  that is linear in pattern size times input length and cannot backtrack.
  `matches_pattern` and `pattern_well_formed` expose it.
- `is_valid`, `is_valid_in_region` and `is_valid_number`: the rule-level verdict
  (libphonenumber's "valid"), alongside the existing length-level "possible".
- `number_type` and `number_type_in_region`: the type the rules report, in
  libphonenumber's precedence order, including the shared `FixedLineOrMobile`.
  `NumberType` gains that variant.
- `plan_pattern` and `type_pattern`: the published rule behind a verdict.
- `local_only_lengths`: the lengths a plan accepts only for a local dial.
- `data/numbering-plans.json`: 245 regions, 1 132 per-type rules and 1 132
  published example numbers, with the source URL, license, retrieval date and
  SHA-256 of the upstream XML recorded in the file.
- `scripts/update-metadata.mjs`: fetch and extract the upstream metadata, with the
  grammar of every rule checked during extraction.
- `scripts/gen-metadata.mjs`: generate `plan_data.mbt`, `plan_examples_test.mbt`
  and `plan_data_wbtest.mbt`, with a `--check` mode for CI.
- `scripts/gen-corpus.mjs`: generate a differential corpus of 2 264 cases, with
  the expected answers computed by an independent regular-expression engine.
- `scripts/sync-readme.mjs`: render `README.md` from `README.mbt.md`, with a
  `--check` mode.
- A CI step that fails when a generated file is out of date with its source.
- `docs/data-maintenance.md`: how the table is refreshed and verified.
- `valid`, `match` and a richer `types` subcommand in `cmd/main`.

### Changed

- The plan table is now generated rather than hand-written, and covers every
  geographic territory in the metadata (245 regions instead of 51).
- `region_of_number` resolves a shared calling code by the plans' own rules, with
  the primary region winning a tie and the published length as a fallback.
- The NANP is data-driven: all 25 `+1` territories resolve from their own
  area-code allocation, instead of a US/Canada split with a hard-coded Canadian
  area-code list. `nanp_canadian_area_codes` is removed; `nanp_region_codes`,
  `nanp_area_code` and a pattern-based `nanp_region_of` replace it.
- `possible_types` remains the length-level candidate set; `number_type` is the
  pattern-level verdict. Both are documented against each other.
- An `isub` value in a `tel:` URI is now validated as a run of URI characters:
  a `%` must start a complete `%HH` escape, and hex digits are canonicalised to
  upper case. The apostrophe, a sub-delimiter of RFC 3986, is now accepted.
- The README, the reproducible-demo record, the retrospective and the demo itself
  are rewritten around the rule engine, the data pipeline and the two validation
  levels. The test count is now 326.

### Removed

- `nanp_canadian_area_codes` and the hand-maintained Canadian NPA list: the
  allocation it encoded is now part of the generated table, and the same facts
  are covered by the example-number tests for every `+1` territory.

## [0.2.0] - 2026-10-16

Structural validation for the North American Numbering Plan, and a faithful
RFC 3966 parser.

### Added

- `nanp.mbt`: the NANP shape rules (`nanp_possible`), area-code resolution
  between the United States and Canada (`nanp_region_of`), and the Canadian NPA
  set as data (`nanp_canadian_area_codes`, 59 codes including the non-geographic
  600, 622 and 633).
- `TelUri`, a parsed `tel:` URI that keeps the global number, local number,
  `phone-context`, extension and `isub` in separate fields.
- `parse_tel_uri_full` and `to_tel_uri_full`, which are inverses, and
  `resolve_tel_uri`, which resolves only what the context supports.
- A `tel` subcommand report that shows every parsed part and whether the URI
  resolves.

### Changed

- `region_of_number` splits `+1` by area code: `+1 204…` resolves to `CA`,
  `+1 201…` to `US`.
- `is_possible`, `is_possible_in_region`, `possible_types` and
  `possible_types_in_region` apply the NANP structure rules to `+1`. A
  seven-digit `+1` number, previously accepted as a Canadian local-only length,
  is now impossible.
- `is_possible_in_region` for `+1` now means "the area code belongs to this
  region", not "the length fits".
- `parse_tel_uri` rejects unknown, duplicate and empty parameters, empty values,
  `ext` together with `isub`, a context on a global number, and interior spaces.
- The demo, README, reproducible-demo record and retrospective cover both new
  mechanisms; the test count is now 60.

## [0.1.0] - 2026-10-08

First release.

### Added

- `PhoneNumber` and `NumberType`, with `PhoneNumber` holding the calling code,
  the national number as a string, and an extension.
- Parsing of E.164 numbers, internationally dialled numbers (through a region's
  dial-out prefix), and nationally dialled numbers with a region hint, plus
  extension recognition in the `x`, `#`, `ext.` and `;ext=` spellings.
- Structural validation: `is_possible`, `is_possible_in_region`,
  `is_possible_number`, and the candidate type set from `possible_types` and
  `possible_types_in_region`.
- Region resolution: `region_of_number`, `region_by_calling_code`,
  `regions_by_calling_code`.
- Formatting: `format_e164`, `format_international`, `format_national` and
  `format_rfc3966`.
- RFC 3966 `tel:` URI support through `parse_tel_uri` and `to_tel_uri`, including
  the `;ext=` and `;phone-context=` forms.
- A numbering-plan table covering 51 regions, with lookups for
  `region_codes`, `region_exists`, `canonical_region_code`, `region_name`,
  `calling_code`, `idd_prefix`, `national_prefix` and `possible_lengths`.
- A `cmd/main` command-line front end with nine subcommands.
- A `cmd/demo` runnable tour, recorded in `docs/reproducible-demo.md`.
- 50 tests across a blackbox suite, a whitebox suite and a robustness suite.
- `scripts/check-docs.mjs`, which fails CI when the recorded documentation drifts
  from real output.

[0.6.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.6.0
[0.5.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.5.0
[0.4.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.4.0
[0.3.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.3.0
[0.2.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.2.0
[0.1.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.1.0
