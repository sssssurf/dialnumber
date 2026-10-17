# Reproducible demonstration

This page records a run that a reviewer can repeat, and `scripts/check-docs.mjs`
compares the text below against a real run on every CI job, so it cannot go
stale silently.

## Running the tour

```bash
moon run cmd/demo
```

The tour exercises the public API end to end: it parses numbers written six
different ways, checks two of them against the plan's length rules, renders a
national form, splits `+1` numbers between the two countries by area code,
rejects numbers that violate the NANP's shape, reads a `tel:` URI with an
extension, keeps a local number's `phone-context` intact (both the resolvable
numeric form and the unresolvable domain form), lists the number types a length
admits, and prints a few rows of region metadata. Every value printed comes from
the library, so if the library regresses this output changes and the
documentation check fails.

## Recorded output

```text

== parse across the ways people write a number ==
input: +1 201-555-0123
e164: +12015550123
international: +1 2015550123
region: US
possible: yes
input: 011 44 20 7946 0958  [region US]
e164: +442079460958
international: +44 2079460958
region: GB
possible: yes
input: 090-1234-5678  [region JP]
e164: +819012345678
international: +81 9012345678
region: JP
possible: yes
input: +86 (131) 2345-6789
e164: +8613123456789
international: +86 13123456789
region: CN
possible: yes
input: 02 12345678  [region IT]
e164: +390212345678
international: +39 0212345678
region: IT
possible: yes
input: +999 555 0000
result: unreadable

== length is what separates possible from impossible ==
input: +1 201-555-012
e164: +1201555012
international: +1 201555012
region: unresolved
possible: no
input: +1 201-555-01234
e164: +120155501234
international: +1 20155501234
region: unresolved
possible: no

== national rendering needs a region ==
national: 09012345678

== +1 is two countries, and the NANP has a shape ==
input: +1 201-555-0123
e164: +12015550123
international: +1 2015550123
region: US
possible: yes
input: +1 204-254-5000
e164: +12042545000
international: +1 2042545000
region: CA
possible: yes
input: +1 905-555-0123
e164: +19055550123
international: +1 9055550123
region: CA
possible: yes
input: +1 111-555-0123
e164: +11115550123
international: +1 1115550123
region: unresolved
possible: no
input: +1 201-155-0123
e164: +12011550123
international: +1 2011550123
region: unresolved
possible: no

== a parsed number keeps its extension ==
e164: +12015550123
extension: 42
rfc3966: tel:+12015550123;ext=42

== a tel: URI keeps its local context ==
local_number: 5550123
phone_context: +1919
canonical: tel:5550123;phone-context=+1919;ext=42
resolved: +19195550123
phone_context: example.com
canonical: tel:7042;phone-context=example.com
resolved: no (domain context)

== the number types a length admits ==
+86 131 2345 6789: fixed-line,mobile,shared-cost
+44 7400 123456: fixed-line,mobile,toll-free,premium-rate,voip,uan,personal-number,pager

== region facts come from the table ==
US: United States +1  lengths {10}
JP: Japan +81  lengths {8,9,10,11,12,13,14,15,16,17}
DE: Germany +49  lengths {4,5,6,7,8,9,10,11,12,13,14,15}
IT: Italy +39  lengths {6,7,8,9,10,11,12}
```

Several things are worth pointing at in that output. The Italian number
`02 12345678` keeps its leading zero, because Italy has no trunk prefix and the
zero is part of the number — which is why the national number is a string. The
two `+1` numbers of the wrong length resolve to no region and check as
impossible, which is the length rule doing its job. And `+999 555 0000` is
unreadable, because no plan in the table uses calling code 999.

In the `+1` section, `204` is Manitoba and `905` is Ontario, so both resolve to
`CA` while `201` (New Jersey) resolves to `US` — the same calling code and the
same length, separated only by area code. `111` is not an assignable NPA and
`201-155-…` has an NXX starting with 1, so the NANP shape rejects both.

In the `tel:` section, the numeric context `+1919` is kept as a field and used
to resolve the local number to `+19195550123`; the domain context `example.com`
is equally valid RFC 3966, so it parses and serialises canonically, but
resolution answers `no` instead of inventing a country code.

## Test summary

```text
Total tests: 60, passed: 60, failed: 0.
```

## Verifying the documentation itself

```bash
node scripts/check-docs.mjs
```

This re-runs the demo, re-runs every command recorded in the README, and reads
the test count out of a real `moon test`, failing if any of them disagrees with
the text in this repository.
