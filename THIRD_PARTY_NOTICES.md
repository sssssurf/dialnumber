# Third-party sources and notices

The MoonBit runtime library is an independent implementation distributed under
the [Apache-2.0 license](LICENSE). The repository additionally contains derived
numbering-plan data and recorded compatibility expectations as described below.

| Source | Use in this repository | License and provenance |
| --- | --- | --- |
| [Google libphonenumber](https://github.com/google/libphonenumber) | Numbering rules, lengths, formats and published example numbers in data/numbering-plans.json and generated plan tables/tests | [Apache-2.0](https://github.com/google/libphonenumber/blob/v9.0.17/LICENSE); source URL, retrieval date and source SHA-256 are in the data metadata |
| Existing non-geographic table | data/non-geographic.json and non_geo_data.mbt | Apache-2.0; extracted losslessly from the previously committed table; extraction provenance and normalized table hash are retained |
| Google Java libphonenumber 9.0.17 | Independent reference executable used to record data/google-compatibility-corpus.json | Apache-2.0; official Maven artifact URL and JAR SHA-256 are recorded; JAR and Java implementation are not vendored |
| [libphonenumber-js 1.11.20](https://github.com/catamphetamine/libphonenumber-js) | Independent reference executable used to record data/compatibility-corpus.json | MIT; package version and max metadata SHA-256 are recorded; package implementation is not vendored |
| Node.js Intl.DisplayNames / CLDR | Generated English region display names | Provided by the generator's Node/ICU environment; no separate CLDR source files are copied into this repository |
| MoonBit core | Runtime math-free utilities, debug and reference cells | Toolchain dependency only; not copied into the module |

Google/libphonenumber attribution: Copyright The Libphonenumber Authors.
The numbering data has been transformed into region/network JSON and MoonBit
tables, with whitespace removed and length ranges expanded. It is not an
unmodified copy of the upstream XML. The data headers and this notice record
that transformation; the Apache-2.0 license is distributed in LICENSE.

libphonenumber-js attribution: Copyright (c) 2016 @catamphetamine.
The MIT license text from the pinned reference package is retained at
[licenses/libphonenumber-js-MIT.txt](licenses/libphonenumber-js-MIT.txt).

The Python/Node/Java scripts are development and verification tools. The shipped
MoonBit library has no Java, JavaScript reference-package, network or I/O runtime
dependency. Neither reference library's implementation is incorporated into the
MoonBit algorithms. Standards references (E.164, RFC 3966, RFC 3986) describe
behavior; they are not represented as project-owned specifications.

Reproducibility and known differences are documented in
[data maintenance](docs/data-maintenance.md),
[JavaScript comparison](docs/compatibility.md) and
[original Java comparison](docs/google-compatibility.md).
