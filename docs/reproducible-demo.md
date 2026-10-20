# Reproducible demonstration

This page records a run that a reviewer can repeat, and `scripts/check-docs.mjs`
compares the text below against a real run on every CI job, so it cannot go
stale silently.

## Running the tour

```bash
moon run cmd/demo
```

The tour exercises the public API end to end: it parses numbers written several
different ways, reports both validation levels and the number type for each,
shows the NANP's structural rejections, resolves +1 numbers across five
territories, shows a number that is possible but not valid, prints a plan's
published rule and runs the pattern engine on it, renders a dozen countries in
their own grouping, reads a `tel:` URI with an extension, keeps a local number's
`phone-context` intact (both the resolvable numeric form and the unresolvable
domain form), lists the number types a length admits, and prints a few rows of
region metadata. Every value printed comes from the library, so if the library
regresses this output changes and the documentation check fails.

## Recorded output

```text

== parse across the ways people write a number ==
input: +1 201-555-0123
e164: +12015550123
international: +1 201-555-0123
region: US
possible: yes
valid: yes
type: fixed-line-or-mobile
input: 011 44 20 7946 0958  [region US]
e164: +442079460958
international: +44 20 7946 0958
region: GB
possible: yes
valid: yes
type: fixed-line
input: 090-1234-5678  [region JP]
e164: +819012345678
international: +81 90-1234-5678
region: JP
possible: yes
valid: yes
type: mobile
input: +86 (131) 2345-6789
e164: +8613123456789
international: +86 131 2345 6789
region: CN
possible: yes
valid: yes
type: mobile
input: 02 12345678  [region IT]
e164: +390212345678
international: +39 02 1234 5678
region: IT
possible: yes
valid: yes
type: fixed-line
input: +999 555 0000
result: unreadable

== length is what separates possible from impossible ==
input: +1 201-555-012
e164: +1201555012
international: +1 201555012
region: unresolved
possible: no
valid: no
type: (none)
input: +1 201-555-01234
e164: +120155501234
international: +1 20155501234
region: unresolved
possible: no
valid: no
type: (none)

== national rendering needs a region ==
national: 090-1234-5678

== each plan groups the number its own way ==
US: national: (201) 555-0123   international: +1 201-555-0123
GB: national: 020 7946 0958   international: +44 20 7946 0958
DE: national: 030 123456   international: +49 30 123456
FR: national: 01 23 45 67 89   international: +33 1 23 45 67 89
JP: national: 090-1234-5678   international: +81 90-1234-5678
BR: national: (11) 98765-4321   international: +55 11 98765-4321
AU: national: (02) 1234 5678   international: +61 2 1234 5678

== +1 is 25 territories, and each allocation decides ==
input: +1 201-555-0123
e164: +12015550123
international: +1 201-555-0123
region: US
possible: yes
valid: yes
type: fixed-line-or-mobile
input: +1 204-254-5000
e164: +12042545000
international: +1 204-254-5000
region: CA
possible: yes
valid: yes
type: fixed-line-or-mobile
input: +1 787-234-5678
e164: +17872345678
international: +1 787-234-5678
region: PR
possible: yes
valid: yes
type: fixed-line-or-mobile
input: +1 876-523-0123
e164: +18765230123
international: +1 876-523-0123
region: JM
possible: yes
valid: yes
type: fixed-line-or-mobile
input: +1 242-345-6789
e164: +12423456789
international: +1 242-345-6789
region: BS
possible: yes
valid: yes
type: fixed-line
input: +1 868-221-1234
e164: +18682211234
international: +1 868-221-1234
region: TT
possible: yes
valid: yes
type: fixed-line
input: +1 111-555-0123
e164: +11115550123
international: +1 1115550123
region: unresolved
possible: no
valid: no
type: (none)
input: +1 201-155-0123
e164: +12011550123
international: +1 2011550123
region: unresolved
possible: no
valid: no
type: (none)

== possible is a length question, valid is a rule question ==
input: +1 555-555-0123
e164: +15555550123
international: +1 5555550123
region: unresolved
possible: yes
valid: no
type: (none)
input: +1 201-555-0123
e164: +12015550123
international: +1 201-555-0123
region: US
possible: yes
valid: yes
type: fixed-line-or-mobile
input: +81 90-1234-567
e164: +81901234567
international: +81 901234567
region: JP
possible: yes
valid: no
type: (none)

== the rules are data the engine interprets ==
DK plan pattern: [2-9]\d{7}
pattern matches 12345678: yes
pattern matches 1234567: no

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
+44 7400 123456: fixed-line,mobile,toll-free,premium-rate,voip,personal-number,uan,pager

== region facts come from the table ==
US: United States +1  lengths {10}
JP: Japan +81  lengths {8,9,10,11,12,13,14,15,16,17}
DE: Germany +49  lengths {4,5,6,7,8,9,10,11,12,13,14,15}
IT: Italy +39  lengths {6,7,8,9,10,11,12}
```

Several things are worth pointing at in that output.

The first block is the ordinary case: each number is parsed, resolved to a
region, run through both checks, and rendered internationally in the grouping the
plan publishes — `+81 90-1234-5678` rather than a bare run of digits. The Italian
number `02 12345678` keeps its leading zero, because Italy has no trunk prefix and
the zero is part of the number — which is why the national number is a string.

The two `+1` numbers of the wrong length resolve to no region and check as
impossible, which is the length rule doing its job. `+999 555 0000` is
unreadable, because no plan in the table uses calling code 999.

In the `+1` section, `201` is New Jersey (United States), `204` is Manitoba
(Canada), `787` is Puerto Rico, `876` is Jamaica, `242` is the Bahamas and `868`
is Trinidad and Tobago. The same calling code and the same length, separated only
by the published area-code allocation — the engine reads that allocation out of
the table. `111` is not an assignable NPA and `201-155-…` has an exchange starting
with 1, so the NANP shape rejects both before any rule is consulted.

The `possible` / `valid` section is the distinction the two levels exist for:
`+1 555-555-0123` has the right shape, so it is possible, but 555 is not an
assigned area code, so no rule claims it and it is not valid. `+81 90-1234-567`
is the same story one digit short: Japan uses nine-digit mobiles, so the number is
possible, but its rule does not match.

The grouping block is the plans' own formatting data at work: parentheses around
the area code in the NANP, `020` for London, `8 (495)` for Moscow, `(02)` for
Sydney, `090-` for a Japanese mobile. Each of those strings is what the plan's
rules produce, and each one parses back to the number it came from.

In the `tel:` section, the numeric context `+1919` is kept as a field and used to
resolve the local number to `+19195550123`; the domain context `example.com` is
equally valid RFC 3966, so it parses and serialises canonically, but resolution
answers `no` instead of inventing a country code.

## Regenerating this page

```bash
moon run cmd/demo > demo-output.txt
node scripts/check-docs.mjs
```

## Test summary

```text
Total tests: 332, passed: 332, failed: 0.
```

## Verifying the documentation itself

```bash
node scripts/check-docs.mjs
```

This re-runs the demo, re-runs every command recorded in the README, and reads the
test count out of a real `moon test`, failing if any of them disagrees with the
text in this repository.
