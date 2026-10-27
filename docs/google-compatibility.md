# Direct verification against Google Java libphonenumber

This recording executes the **original Google Java libphonenumber 9.0.17**
from its official Maven Central artifact, through scripts/ReferenceOracle.java.
This is separate from the broader libphonenumber-js corpus.

Artifact SHA-256: c280b2493de61a070edbc9a83e27023dfd0453cc1295601a48802af907926bcd.

- 17 complete phone scenarios: eight national-input parse/format round trips
  and all nine non-geographic networks. E.164, possibility, validity, region
  and number type agree; regional national/international formatting agrees.
- Six number comparisons use PhoneNumberUtil.isNumberMatch directly and agree,
  including different explicit calling codes, unknown code, short suffix,
  missing extension and conflicting extensions.
- Six original AsYouTypeFormatter traces record every keystroke. Completed
  outputs and digits agree. The following intermediate presentation differences
  remain explicit, with both values retained and tested:

| Trace / zero-based step | Java reference | Library |
| --- | --- | --- |
| typing-1/2 | "201" | "(201)" |
| typing-1/3 | "201-5" | "(201) 5" |
| typing-1/4 | "201-55" | "(201) 55" |
| typing-1/5 | "201-555" | "(201) 555" |
| typing-1/6 | "201-5550" | "(201) 555-0" |
| typing-2/1 | "12" | "1 2" |
| typing-2/3 | "1 (201" | "1 (201)" |
| typing-3/2 | "+44 " | "+44" |
| typing-5/2 | "201" | "(201)" |
| typing-5/3 | "201-5" | "(201) 5" |
| typing-5/4 | "201-55" | "(201) 55" |
| typing-5/5 | "201-555" | "(201) 555" |
| typing-5/6 | "201-5550" | "(201) 555-0" |

The library uses the national formatting template earlier in a few NANP
prefixes; Java delays parentheses. Java adds a space after a complete calling
code before the next digit. These are presentation differences, not discarded
digits or a change of telephone destination. This suite does not claim full
global Java parity or network grouping parity for non-geographic formatting.

## Reproduce offline

```bash
node scripts/gen-google-compat.mjs --check
moon test --target wasm-gc
```

## Recreate the reference recording

Obtain the [pinned official jar](https://repo.maven.apache.org/maven2/com/googlecode/libphonenumber/libphonenumber/9.0.17/libphonenumber-9.0.17.jar) and use JDK 11 or newer:

```bash
node scripts/gen-google-compat.mjs --jar /path/to/libphonenumber-9.0.17.jar
git diff -- data/google-compatibility-corpus.json google_compatibility_test.mbt
```

The generator verifies the jar checksum before running Java. CI consumes the
committed data and generated MoonBit assertions without installing Java.
