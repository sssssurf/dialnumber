# Implemented scope and remaining limitations

## Implemented

- Nine non-geographic networks: +800, +808, +870, +878, +881, +882, +883, +888, +979.
  Validation, types and possible lengths use a calling-code keyed table; region is 001.
  The table is generated from data/non-geographic.json and checked by CI.
- is_number_match: exact / NSN / short NSN / none; different explicit calling
  codes do not match, conflicting explicit extensions do not match, and a
  missing extension can produce only a short match. Country code 0 means unknown.
- AsYouTypeFormatter: national trunk input and leading + international input,
  grouping through the plan table, clear/current_output, digit preservation on
  overflow, and six independently recorded per-keystroke oracle traces.
- RFC 3966 parsing/serialization preserves numeric or domain contexts and
  generic parameters. Resolution is separate, with an optional context authority.

## Context resolution is a policy, not a prefix operation

[RFC 3966 §5.1.5](https://www.rfc-editor.org/rfc/rfc3966.html#section-5.1.5)
does not define phone-context as digits to prepend. The default resolver supports
documented public-plan conventions: a context exactly equal to a calling code
reads the local part as a national number, and +1 plus a three-digit area code
can complete a seven-digit NANP local number. Both require final validity.
These conventions are not a universal interpretation of every numeric context.

Arbitrary longer numeric contexts and domains return None by default, even if
ignoring the context could produce a valid number. Pass context_resolver to
resolve_tel_uri when an authority supplies the mapping. The callback is not
called by parsing, so an unresolved URI still round-trips intact. Unknown m-
mandatory parameters prevent resolution. ISDN subaddresses remain in TelUri;
PhoneNumber has no isub field, so callers that need it must retain TelUri.

## Remaining boundaries

1. National-prefix transform rules (for example Argentina mobile rewrites) are
   not implemented; the metadata and generated round-trip tests mark that scope.
2. Incremental formatting is intentionally smaller than libphonenumber's full
   interactive editor. It ignores non-digit keystrokes except an initial +; it
   does not provide deletion/cursor editing, vanity-letter conversion or all
   operator-specific dialling prefixes. Six traces are coverage, not universal parity.
3. Published international grouping separators are preserved. The JavaScript
   oracle normalizes some separators to spaces; E.164 digits agree.
4. Validation tests range rules, not existence, reachability or ownership of a line.
5. The broad independent corpus uses libphonenumber-js 1.11.20/max. A separate
   29-scenario recording executes the original Java 9.0.17 runtime directly;
   All known metadata, local-only scope and formatting differences remain in the
   committed corpus, explicitly explained in compatibility.md.

The direct Java check has 13 explicitly recorded intermediate spacing/parenthesis
differences across four typing traces; completed outputs and all digits agree.
See google-compatibility.md. Neither suite is a claim of universal parity.
