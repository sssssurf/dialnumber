# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project aims to
follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

[0.3.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.3.0
[0.2.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.2.0
[0.1.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.1.0
