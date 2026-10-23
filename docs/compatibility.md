# Compatibility with libphonenumber

The library is a re-implementation, not a port, so "does it agree" is a question
worth answering with numbers rather than an assertion.

## Method

For every published example number in `data/numbering-plans.json` (1 132 of
them), `libphonenumber-js` 1.11.20 was asked two questions: is the number valid,
and which country does it belong to. The same two questions were asked of this
library through `is_valid` and `region_of_number`. The comparison is a
generation-time step: the answers are recorded, the repository does not depend on
JavaScript at test time.

## Result

| | Count |
| --- | --- |
| Examples compared | 1 132 |
| Agree on validity and country | 1 128 |
| Differ | 4 |

The four disagreements fall into two classes, both understood:

- **Metadata vintage.** The +590 territories (Guadeloupe, Saint Barthélemy,
  Saint Martin) publish different rules in the two metadata revisions, so the
  same published example is valid in one and not the other. This is a data
  difference, not a logic difference.
- **Scope of "a number".** `CA 3101234` is a seven-digit local-only number. This
  library does not treat a seven-digit national number as a complete E.164
  number, so it reports no region; libphonenumber-js accepts it.

## What the comparison changed

It found a real defect rather than only confirming agreement. For a shared
calling code, resolution used to prefer the primary territory and fall back to
the others, so every `+212` number resolved to Morocco. It now prefers a
territory that publishes leading digits and matches them — the same order
libphonenumber uses — which is what puts Western Sahara's `528…` numbers in `EH`.

That fix is covered by the region tests; the comparison itself is a report rather
than a committed corpus because the four differences above would need an
allowlist whose entries are metadata-version dependent.