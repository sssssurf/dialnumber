# Changelog

All notable changes to this project are recorded here. The format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project aims to
follow [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

[0.1.0]: https://github.com/sssssurf/dialnumber/releases/tag/v0.1.0
