# Data maintenance

The numbering-plan table is the largest part of this library, and none of it is
typed by hand. This page describes where it comes from, how it is regenerated,
and what stops it from drifting away from its source.

## The chain

```text
PhoneNumberMetadata.xml                 upstream: google/libphonenumber, Apache-2.0
        |
        |  node scripts/update-metadata.mjs
        |    - fetch the file (or take a local copy with --xml PATH)
        |    - parse the 245 geographic territories
        |    - check every rule against the engine's grammar
        |    - record the SHA-256, the retrieval date and the counts
        v
data/numbering-plans.json               the reviewable data artifact (committed)
        |
        |  node scripts/gen-metadata.mjs
        |    - emit plan_data.mbt            the table the library compiles
        |    - emit plan_examples_test.mbt   1 132 published examples as tests
        |    - emit plan_data_wbtest.mbt     the table's own invariants
        v
MoonBit sources
        |
        |  node scripts/gen-corpus.mjs
        v
pattern_corpus_test.mbt                 2 264 differential cases for the engine
```

Every step is a script in `scripts/`, every output is committed, and every
generator has a `--check` mode that CI runs: a hand edit to a generated file, or
a data refresh whose outputs were not regenerated, fails the build.

## What is extracted

For each territory the upstream metadata describes:

| Field | Where it comes from | Used for |
| --- | --- | --- |
| `code`, `name` | `id` attribute; the name from CLDR via `Intl.DisplayNames` | region lookups |
| `calling_code` | `countryCode` | resolution, parsing |
| `idd`, `national_prefix` | `internationalPrefix`, `nationalPrefix` | `dial_out` / `format_national` |
| `primary` | `mainCountryForCode` | tie-breaking between regions that share a code |
| `general` | `generalDesc/nationalNumberPattern` | the plan's overall rule |
| `types[].pattern` | the per-type `nationalNumberPattern` | validity, number type, territory resolution |
| `types[].national` | `possibleLengths national` | the "possible" length test |
| `types[].local_only` | `possibleLengths localOnly` | `local_only_lengths` |
| `types[].example` | `exampleNumber` | the generated golden tests |

Two details are worth recording because they are easy to get wrong:

- **Whitespace is formatting.** The upstream file wraps patterns over indented
  lines; the extractor strips all whitespace before storing a rule.
- **Length sets have two spellings.** `possibleLengths` is usually a comma list
  (`"10"`, `"7,10"`) but sometimes an interval (`"[5-12]"`), and sometimes both
  (`"[6-8],10,12"`). The extractor expands intervals, and refuses a value it
  cannot read rather than storing a wrong list.

The nine non-geographic territories (the `001` rows: `+800` international
freephone, `+870` Inmarsat, `+878` universal personal telecommunication and their
neighbours) are skipped: they describe networks, not places, so they have no
region to resolve to in a region-keyed table. The extractor prints how many it
skipped so the omission is visible rather than silent.

## Refreshing the table

```bash
node scripts/update-metadata.mjs          # fetch, extract, print the counts
node scripts/gen-metadata.mjs             # regenerate the table and its tests
node scripts/gen-corpus.mjs               # regenerate the differential corpus
moon test                                 # the whole generated suite
```

`scripts/update-metadata.mjs` writes the SHA-256 of the exact upstream file it
read into `data/numbering-plans.json`, together with the retrieval date, so a
reviewer can tell which revision of the plans a given table describes. The
upstream file itself is not committed: it is almost a megabyte, it is Apache-2.0
rather than this project's text, and its checksum plus the extraction script make
it reproducible.

Reading the diff of `data/numbering-plans.json` is the review step: a plan that
changed a range shows up as a changed pattern string, and the example-number
tests that regenerate alongside it say whether the change is self-consistent.

## What the check modes guarantee

`scripts/gen-metadata.mjs --check`, `scripts/gen-corpus.mjs --check` and
`scripts/sync-readme.mjs --check` compare their output with the committed file and
exit non-zero on any difference. CI runs all three, so:

- the table cannot be edited by hand without the generator noticing;
- a data refresh cannot land without its tests being regenerated;
- `README.md` cannot drift from `README.mbt.md`;
- the demo record cannot drift from the demo (that one is `check-docs.mjs`).

The generated table also carries its own invariants as tests: the region and rule
counts must match the metadata, every rule must be inside the engine's grammar,
every region must be named and reachable, and the `+1` space must list all 25
territories.

## Cost

The table is about 145 KB of generated MoonBit, and the generated tests are
larger than the library. That is deliberate: the data is the library's substance,
and a rule that is not exercised by an example is a rule nobody has checked.
`moon check` and `moon test` stay fast because MoonBit compiles the literals once
and the tests are data-driven loops and straight-line assertions.
