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
  knows, and the national number's length is one the plan uses. For `+1` the
  check is stronger — the NANP's NPA-NXX-XXXX shape is enforced.
- **Disambiguate `+1`** between the United States and Canada by area code, so
  `+1 204…` (Manitoba) resolves to `CA` and `+1 201…` (New Jersey) to `US`.
- **List** the number types a length admits — fixed-line, mobile, toll-free,
  premium-rate, shared-cost, voip, uan, personal, pager, voicemail.
- **Format** to E.164, international, national, or an RFC 3966 `tel:` URI.
- **Look up** regions by code or by calling code, with the plan's international
  and national prefixes and its national-number lengths.
- **Read and write** RFC 3966 `tel:` URIs with the full grammar: global and
  local numbers, numeric or domain `;phone-context=`, `;ext=` and `;isub=`.
  Parsing keeps each part separate, and the parser and serialiser are inverses.

The table covers **51 numbering plans** and every public function is total: bad
input comes back as `None` or `false`, never as an exception or a panic.

## What it deliberately does not do

This is the boundary that matters, so it is stated up front rather than buried.

`dialnumber` validates **structure**, not **assignment**. It can tell you that
`+81 90-1234-5678` is a well-formed Japanese mobile but not that the line exists,
is reachable, or belongs to anyone. Deciding that needs each plan's leading-digit
ranges and its allocation records, which this library does not carry.

Two levels of structural check are available from published data:

- For the 49 plans known only by their lengths, the check is the length test.
- For `+1`, the NANP shape is published and is enforced: NPA and NXX start with
  2–9, and N11 service codes are not area codes. This also fixes the
  worst length-test failure, where a Canadian local-only seven-digit number
  resolved to a country; it now resolves to nothing.

So there is no `is_valid` that claims more than the data supports. The check is
named `is_possible`, the same word libphonenumber uses for the length test, and
`possible_types` returns a *candidate set* rather than a verdict, because several
types can share one length. The `+1` resolver is US/Canada only: Caribbean NPAs,
Puerto Rico, Guam and the shared 8YY/900 codes resolve to `US`.

For the same reason there is no locale-aware digit grouping. Rendering
`201 555 0123` correctly needs the leading-digit patterns that are out of scope;
a generic grouper would be wrong exactly where it looked most confident, which is
worse than leaving the caller to group for display.

## The `+1` disambiguation

The United States and Canada share calling code 1, and a length test cannot tell
them apart. The area code can. `nanp.mbt` holds the Canadian NPAs in service
(56 geographic plus the non-geographic 600, 622 and 633), and applies three
structural rules that every NANP number obeys:

- the national number is exactly ten digits;
- the area code (NPA) and central-office code (NXX) start with 2–9;
- the area code is not an N11 service code.

`region_of_number` then answers `CA` for a Canadian NPA and `US` otherwise;
`is_possible_in_region` uses the same rule, so a Manitoba number is not possible
in the United States. Reserved-but-not-yet-active NPAs are left out on purpose,
which is why `nanp.mbt` dates its data.

```moonbit
@dialnumber.nanp_region_of("2042545000")  // Some("CA")
@dialnumber.nanp_region_of("2015550123")  // Some("US")
@dialnumber.nanp_possible("2011550123")   // false: NXX starts with 1
```

## RFC 3966 without losing the context

A `tel:` URI can carry a *local* number whose meaning depends on a
`phone-context` — either a numeric prefix (`+1-919`) or a domain
(`example.com`). The two forms are handled differently:

- **numeric context** resolves: the context prefix and the local digits form an
  E.164 number;
- **domain context** parses, serialises and round-trips, but does **not**
  resolve, because answering it requires asking that domain.

The parsed `TelUri` keeps `global_number`, `local_number`, `phone_context`,
`extension` and `isub` in separate fields; nothing is merged into the digits.
`parse_tel_uri_full` and `to_tel_uri_full` are inverses, and resolution is a
separate step (`resolve_tel_uri`). Extensions and ISDN subaddresses are mutually
exclusive, as the RFC requires; unknown, duplicate and empty parameters are
rejected rather than dropped, and spaces are not accepted as visual separators.

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
moon add sssssurf/dialnumber
```

## Quick start

```moonbit
let pn = @dialnumber.parse("011 44 20 7946 0958", "US")

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
| `is_possible(pn)` | length test, or NANP structure for `+1` |
| `is_possible_in_region(pn, region)` | the same, against one named region |
| `is_possible_number(input, region)` | parse then check, in one call |
| `possible_types(pn)` | number types the length admits |
| `possible_types_in_region(pn, region)` | the same, within one region |
| `region_of_number(pn)` | the region a number resolves to (area code for `+1`) |
| `nanp_possible(nsn)` | ten-digit NANP structure |
| `nanp_region_of(nsn)` | `Some("CA")` / `Some("US")` by area code |
| `nanp_canadian_area_codes()` | the Canadian NPAs the resolver knows |
| `format_e164(pn)` | `+8613123456789` |
| `format_international(pn)` | `+86 13123456789` |
| `format_national(pn, region)` | trunk prefix plus national number |
| `format_rfc3966(pn)` | `tel:+8613123456789;ext=42` |
| `parse_tel_uri(uri)` | parse and resolve a `tel:` URI |
| `parse_tel_uri_full(uri)` | parse into a `TelUri?` without resolving |
| `to_tel_uri_full(t)` | serialise a `TelUri` canonically |
| `resolve_tel_uri(t)` | resolve parsed parts, when the context allows |
| `to_tel_uri(pn)` | write a `tel:` URI for a number |
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
survives), and `extension`. `TelUri` holds the five parts of a `tel:` URI.

## Where the data comes from

The numbering-plan table is derived from Google's
[libphonenumber](https://github.com/google/libphonenumber) metadata
(`PhoneNumberMetadata.xml`, Apache-2.0), which tracks the plans themselves. Only
the length rules are reproduced here; the per-type leading-digit patterns are
the part left out, which is what keeps `is_possible` a length test for the 49
plans that have no structural rule of their own.

The Canadian area-code set in `nanp.mbt` comes from the same metadata (the CA
territory, all number types) and is cross-checked with the Canadian Numbering
Administrator's published area-code map. It is dated in the source because area
codes are allocated over time.

## Tests

60 tests cover the public API, the package-private helpers, and robustness
against malformed input. The vectors are real numbers from the plans' published
examples, and the robustness suite feeds the parser junk, 500-digit numbers and
lone separators to show that nothing panics.

```bash
moon test
```

## License

Apache-2.0. See `LICENSE`.
