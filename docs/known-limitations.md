# Known limitations, and where they are tracked

This page lists the gaps the library knowingly has. Each one is a real issue with
a scope, not a wish: the repository keeps them here so a reviewer can see the
boundary without reading the source.

## 1. Argentina-style national dialing is not reversible

Some plans rewrite the number while parsing. Argentina writes a mobile as
`011 15-2345-6789` nationally while its international form carries the `9`
(`9 11 2345 6789`), and Belarus accepts more than one trunk spelling. The
rewrite is published as `nationalPrefixForParsing` plus a
`nationalPrefixTransformRule`; this library implements the prefix *match* (so
`0|80?` is understood) but not the transform.

Consequence: the generated round-trip test skips the plans that publish a
transform rule, instead of asserting something that would not hold. See
`data/numbering-plans.json` — each region carries `dial_transform`.

Scope if picked up: a small capture-group matcher (the formatting code already
has one) plus applying `$1..$9` in the published transform.

## 2. Incremental (`AsYouType`) formatting is out of scope

`format_national` / `format_international` render a complete number. Formatting
digit by digit while the user types needs a different model — the plan's
formatting rules applied to a prefix, with the grouping changing as digits
arrive. It is a natural extension of `PhoneFormat`, but it is a separate user
experience and is not implemented.

## 3. Non-geographic calling codes are not in the table

`+800` (international freephone), `+870` (Inmarsat), `+878`, `+881`, `+882`,
`+883`, `+888` and `+979` describe networks, not places. The table is keyed by
region, so these nine territories are skipped at extraction time (the script
prints how many it skipped). `parse` accepts their digits as a calling code only
when a region uses that code, so they currently resolve to nothing.

Scope if picked up: a second table keyed by calling code, with its own type
patterns, and `region_of_number` returning a synthetic code such as `001`.

## 4. Carrier-code and dial-out prefix expressions

A few plans publish their international dial-out prefix as a set of alternatives
(Australia: `001[14-689]|14(?:…)0011`) rather than one string.
`format_dialling` refuses to guess and falls back to the `+` form; `idd_prefix`
returns the published expression.

## 5. Line-level assignment is out of reach

`is_valid` says the number falls inside a range the plan allocates. It cannot say
the line exists, is reachable, or belongs to anyone; that needs operator-level
records this library does not carry.
