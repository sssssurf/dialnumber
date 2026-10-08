# dialnumber

Phone number parsing, validation and formatting for MoonBit, built on the
national numbering plans behind ITU-T E.164.

A phone number written by a person is a mess of spaces, dashes, parentheses,
trunk prefixes and country codes, and the same number can be written a dozen
ways. `dialnumber` turns any of them into one value, checks it against the plan,
and renders it back in whichever of the standard shapes you need.

## What it does

- **Parse** an E.164 number (`+81 90-1234-5678`), a number dialled
  internationally (`011 44 20 7946 0958` from the NANP), or a number dialled
  nationally with a region hint (`090-1234-5678` in Japan) into a `PhoneNumber`.
- **Check** the structure against the plan: the calling code is one the table
  knows, and the national number's length is one the plan uses.
- **List** the number types a length admits — fixed-line, mobile, toll-free,
  premium-rate, shared-cost, voip, uan, personal, pager, voicemail.
- **Format** to E.164, international, national, or an RFC 3966 `tel:` URI.
- **Look up** regions by code or by calling code, with the plan's international
  and national prefixes and its national-number lengths.
- **Read and write** RFC 3966 `tel:` URIs, including `;ext=` and the
  `;phone-context=` local-number form.

The table covers **51 numbering plans** and every public function is total: bad
input comes back as `None` or `false`, never as an exception or a panic.

## What it deliberately does not do

This is the boundary that matters, so it is stated up front rather than buried.

`dialnumber` validates **structure**, not **assignment**. It can tell you that
`+81 90-1234-5678` is a well-formed Japanese mobile but not that the line exists,
is reachable, or belongs to anyone. Deciding that needs each plan's leading-digit
ranges and its allocation records, which this library does not carry.

So there is no `is_valid` that claims more than the data supports. The check is
named `is_possible`, the same word libphonenumber uses for the length test, and
`possible_types` returns a *candidate set* rather than a verdict, because several
types can share one length.

For the same reason there is no locale-aware digit grouping. Rendering
`201 555 0123` correctly needs the leading-digit patterns that are out of scope;
a generic grouper would be wrong exactly where it looked most confident, which is
worse than leaving the caller to group for display.

## Relationship to other MoonBit libraries

The ecosystem has plenty of validators, and none of them do this. `moon_zod`,
`moonschema` and `jsonschema` validate JSON against a schema, including `email`
and `uuid` string formats; they do not know about telephone numbering.
`moovalid` and `maru` are validator-combinator frameworks. `mooncontract`
validates OpenAPI contracts, and `moonmrz` reads the ICAO 9303 machine-readable
zone of a passport. `dialnumber` sits alongside them: it takes a phone number in
and gives you its parts, its plan, and its canonical renderings, with no I/O and
no dependencies.

## Install

```bash
moon add ssssurf/dialnumber
```

## Quick start

```moonbit nocheck
///|
let pn = @dialnumber.parse("011 44 20 7946 0958", "US")

///|
match pn {
  Some(n) => {
    @dialnumber.format_e164(n)          // "+442079460958"
    @dialnumber.format_national(n, "GB") // Some("02079460958")
    @dialnumber.is_possible(n)           // true
    @dialnumber.region_of_number(n)      // Some("GB")
  }
  None => ()
}
```

## Command line

The `cmd/main` package is a small front end. Every subcommand prints a plain
report, and the text below is recorded from a real run.

```bash
moon run cmd/main -- parse "+81 90-1234-5678"
moon run cmd/main -- possible "090-1234-5678" JP
moon run cmd/main -- format "090-1234-5678" JP
moon run cmd/main -- types "+86 131 2345 6789"
moon run cmd/main -- region "+442079460958"
moon run cmd/main -- info JP
moon run cmd/main -- cc de
moon run cmd/main -- tel "tel:+1-201-555-0123;ext=42"
moon run cmd/main -- list
```

A few of those, with the output they produce:

```text
$ moon run cmd/main -- parse "+81 90-1234-5678"
country_code: 81
national_number: 9012345678
e164: +819012345678
region: JP
```

```text
$ moon run cmd/main -- info JP
region: JP
name: Japan
calling_code: 81
idd: 010
national_prefix: 0
lengths: 8,9,10,11,12,13,14,15,16,17
```

```text
$ moon run cmd/main -- types "+86 131 2345 6789"
types: fixed-line,mobile,shared-cost
```

## API

| Function | Purpose |
| --- | --- |
| `parse(input, region)` | read any written form into a `PhoneNumber?` |
| `parse_e164(input)` | read only a `+`-prefixed number |
| `parse_national(input, region)` | read a number as dialled in a region |
| `is_possible(pn)` | calling code known and length used by the plan |
| `is_possible_in_region(pn, region)` | the same, against one named region |
| `is_possible_number(input, region)` | parse then check, in one call |
| `possible_types(pn)` | number types the length admits |
| `possible_types_in_region(pn, region)` | the same, within one region |
| `region_of_number(pn)` | the region a number resolves to |
| `format_e164(pn)` | `+8613123456789` |
| `format_international(pn)` | `+86 13123456789` |
| `format_national(pn, region)` | trunk prefix plus national number |
| `format_rfc3966(pn)` | `tel:+8613123456789;ext=42` |
| `parse_tel_uri(uri)` | read a `tel:` URI |
| `to_tel_uri(pn)` | write a `tel:` URI |
| `region_codes()` | every region code in the table |
| `region_exists(code)` | is the code in the table |
| `canonical_region_code(code)` | the table's spelling of a code |
| `region_name(code)` | English name |
| `calling_code(code)` | E.164 calling code |
| `idd_prefix(code)` | international dial-out prefix |
| `national_prefix(code)` | trunk prefix, or `None` |
| `possible_lengths(code)` | national-number lengths |
| `region_by_calling_code(cc)` | one region for a calling code |
| `regions_by_calling_code(cc)` | every region for a calling code |

The `NumberType` enum names the ten categories. The `PhoneNumber` struct holds
`country_code`, `national_number` (a string, so a significant leading zero
survives), and `extension`.

## Where the data comes from

The numbering-plan table is derived from Google's
[libphonenumber](https://github.com/google/libphonenumber) metadata
(`PhoneNumberMetadata.xml`, Apache-2.0), which tracks the plans themselves. Only
the length rules are reproduced here; the leading-digit patterns are the part
left out, which is what keeps `is_possible` a length test.

## Tests

50 tests cover the public API, the package-private helpers, and robustness
against malformed input. The vectors are real numbers from the plans' published
examples, and the robustness suite feeds the parser junk, 500-digit numbers and
lone separators to show that nothing panics.

```bash
moon test
```

## License

Apache-2.0. See `LICENSE`.
