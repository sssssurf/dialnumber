# Data maintenance

The committed JSON is the reviewable input to code generation. Offline
regeneration is reproducible from that JSON; fetching the current upstream
master branch is an explicit update and is not claimed to reproduce an old XML.

## Geographic and non-geographic data

- data/numbering-plans.json contains 245 regions, 1,132 type rules and 740 formats.
  Its metadata records the upstream XML URL, retrieval date and SHA-256.
- data/non-geographic.json contains all nine 001 networks, keyed by calling code.
  The initial JSON was extracted without rule changes from the already committed
  table. It retains that provenance and a normalized table hash. A future XML
  refresh writes the XML source hash for both region and network tables.
- scripts/gen-metadata.mjs generates plan_data.mbt, plan_examples_test.mbt and
  plan_data_wbtest.mbt. scripts/gen-non-geo.mjs generates non_geo_data.mbt.
- scripts/gen-corpus.mjs records 2,264 independent JavaScript-regex verdicts for
  the pattern engine. These test the engine, not end-to-end phone-library parity.

The extractor removes formatting whitespace, expands length ranges, validates
the supported pattern grammar and keeps published examples. Region names come
from Node.js Intl.DisplayNames/CLDR. General rules, leading-digit rules, trunk
prefix patterns, type lengths and formatting groups remain separate fields.

## Explicit refresh

    node scripts/update-metadata.mjs --xml /path/to/PhoneNumberMetadata.xml
    node scripts/gen-metadata.mjs
    node scripts/gen-non-geo.mjs
    node scripts/gen-corpus.mjs

Review both JSON diffs and the generated tests. A metadata update also changes
the source hash expected by the JavaScript phone compatibility corpus; recreate
that recording with its pinned oracle and review every changed known difference.
Do not silently overwrite oracle expectations to match the implementation.

## Two phone reference recordings

The broad corpus records libphonenumber-js 1.11.20/max; its script checks the
metadata version and SHA-256. A second recording invokes the original Google
Java 9.0.17 library after checking the official JAR checksum. Java and the npm
package are needed only to recreate those recordings, not to run the tests.
Known differences stay in separate explicit files and are checked for stale or
unused entries. No differing case is omitted from the corpus.

See [compatibility.md](compatibility.md) and
[google-compatibility.md](google-compatibility.md) for all inputs and differences.

## Offline drift checks

    node scripts/gen-metadata.mjs --check
    node scripts/gen-corpus.mjs --check
    node scripts/gen-non-geo.mjs --check
    node scripts/gen-compat.mjs --check
    node scripts/gen-google-compat.mjs --check
    node scripts/sync-readme.mjs --check

The acceptance runner and CI execute these checks and verify that literal CLI
output still matches the documentation. Generated tables and tests are derived
data, not a substitute for the handwritten parsing, matching and formatting work.
License and attribution details are in [THIRD_PARTY_NOTICES.md](../THIRD_PARTY_NOTICES.md).
