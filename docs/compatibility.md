# End-to-end compatibility with libphonenumber-js

The oracle is **libphonenumber-js 1.11.20 with max metadata**, not its less
strict default/min bundle and not the original Java libphonenumber runtime.
The library has no runtime dependency on the oracle. Expectations and their
provenance are committed in `data/compatibility-corpus.json`.

## Coverage

- 2299 input cases: all 1,132 published regional examples,
  their overlong near-misses, nine non-geographic networks with short and
  overlong negatives, and eight national-input formatting scenarios.
- Parse → E.164 → possible/valid → region/type; formatting scenarios also
  compare the national and international renderings.
- For deliberately invalid inputs, only rejection by possible/valid is
  compared. The structural parser may accept text that the oracle rejects;
  that does not make the input a valid telephone number.
- 6 incremental formatting traces assert every keystroke, including
  trunk prefixes, NANP prefixes, international input and overflow.

Without accounting for known differences, 2284/2299
cases agree on every compared field. There are **15 cases / 30 field
differences**. No differing input is dropped. Tests assert the recorded
library result for each difference and fail if either it or the oracle
expectation changes. This is a bounded comparison, not universal parity.

## All known differences

| Case/field | Oracle | Library | Reason |
| --- | --- | --- | --- |
| `BL:p/valid` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `BL:p/region` | `(none)` | `GP` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `BL:p/type` | `(none)` | `premium-rate` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `CA:u/valid` | `true` | `false` | Scope: CA 3101234 is a seven-digit local-only UAN; this library requires a complete NANP national number. |
| `CA:u/region` | `CA` | `(none)` | Scope: CA 3101234 is a seven-digit local-only UAN; this library requires a complete NANP national number. |
| `CA:u/type` | `uan` | `(none)` | Scope: CA 3101234 is a seven-digit local-only UAN; this library requires a complete NANP national number. |
| `CL:f/valid` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `CL:f/type` | `(none)` | `fixed-line` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `EH:f/region` | `EH` | `MA` | Metadata association: the committed Morocco plan has leading digits [5-8] and accepts 5288; it wins before EH. The older oracle assigns this example to EH. |
| `GF:p/valid` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `GF:p/type` | `(none)` | `premium-rate` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `GP:p/valid` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `GP:p/region` | `(none)` | `GP` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `GP:p/type` | `(none)` | `premium-rate` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `MF:p/valid` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `MF:p/region` | `(none)` | `GP` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `MF:p/type` | `(none)` | `premium-rate` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `MU:g/valid` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `MU:g/type` | `(none)` | `pager` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `SR:t/valid` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `SR:t/type` | `(none)` | `toll-free` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `SR:p/valid` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `SR:p/type` | `(none)` | `premium-rate` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `TA:f/type` | `fixed-line-or-mobile` | `fixed-line` | Metadata type: this plan publishes only a fixed-line rule; the older oracle also classifies it as mobile. |
| `UY:u/valid` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `UY:u/possible` | `false` | `true` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `UY:u/type` | `(none)` | `uan` | Metadata revision: the 2026-10-20 committed plan accepts this published example/type; the pinned 1.11.20 max metadata does not. No case is omitted. |
| `format:US/international` | `+1 201 555 0123` | `+1 201-555-0123` | Formatting convention: libphonenumber-js formatInternational normalizes separators to spaces; dialnumber preserves the published international grouping separator. E.164 digits agree. |
| `format:JP/international` | `+81 90 1234 5678` | `+81 90-1234-5678` | Formatting convention: libphonenumber-js formatInternational normalizes separators to spaces; dialnumber preserves the published international grouping separator. E.164 digits agree. |
| `format:BR/international` | `+55 11 98765 4321` | `+55 11 98765-4321` | Formatting convention: libphonenumber-js formatInternational normalizes separators to spaces; dialnumber preserves the published international grouping separator. E.164 digits agree. |

## Reproduce

With Node.js and the project MoonBit toolchain on PATH:

```bash
node scripts/gen-compat.mjs --check
moon test --target wasm-gc
```

To independently recreate the recorded expectations, obtain the pinned npm
package and pass its extracted package directory:

```bash
npm pack libphonenumber-js@1.11.20
tar -xzf libphonenumber-js-1.11.20.tgz
node scripts/gen-compat.mjs --oracle ./package
git diff -- data/compatibility-corpus.json compatibility_test.mbt docs/compatibility.md
```

The oracle metadata SHA-256 and the numbering-plan source SHA-256 are
recorded. An unused exception or a changed oracle value fails generation.
CI checks the generated tests offline and executes them on every tested target.

The original reference project is [Google libphonenumber](https://github.com/google/libphonenumber).
The executable oracle used here is [libphonenumber-js](https://github.com/catamphetamine/libphonenumber-js).

Additional scenarios execute the original Google Java library directly;
see [google-compatibility.md](google-compatibility.md) for that independent recording.
