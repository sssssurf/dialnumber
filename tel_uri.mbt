// RFC 3966 `tel:` URIs — the form a phone number takes in a web page, a vCard
// or an SMS link.
//
// The grammar has two subscriber shapes and a small set of parameters:
//
//   tel:+1-201-555-0123;ext=42
//     global number, optionally with an extension or an ISDN subaddress
//
//   tel:7042;phone-context=+1-919
//     local number, which is *required* to carry a phone-context
//
// Parsing is separated from resolution on purpose. A local number with a domain
// context (`example.com`) is a perfectly valid URI, but it cannot be turned into
// an E.164 number without asking that domain what it means. The old code merged
// the context into the digits and thereby lost both facts; here the parse keeps
// the URI intact and only resolution decides whether it is answerable.
//
// The parse and the serialisation are inverses: for any TelUri produced by
// `parse_tel_uri_full`, `parse_tel_uri_full(to_tel_uri_full(t))` is `t`.

///|
/// The parts of a `tel:` URI, kept apart.
///
/// Exactly one of `global_number` and `local_number` is non-empty. A local
/// number always has a non-empty `phone_context`; a global number never does.
/// `extension` and `isub` are mutually exclusive, as RFC 3966 requires.
/// `global_number` is canonical (`+` and digits). `local_number` keeps digits,
/// `A`–`F`, `*` and `#`, with the visual separators removed.
pub(all) struct TelUri {
  global_number : String
  local_number : String
  phone_context : String
  extension : String
  isub : String
  /// Generic parameters (`;pname` or `;pname=pvalue`) that this library does not
  /// interpret. RFC 3966 lets other documents define them, so they are kept
  /// and written back in lexicographical order rather than refused.
  parameters : Array[(String, String)]
} derive(Eq, Debug)

///|
/// `Eq` promotes both methods; name them so the promotion is stated rather than
/// implied.
pub extend TelUri with Eq::{not_equal, equal}

///|
/// `Debug` promotes `to_repr` the same way; name it too.
pub extend TelUri with @moonbitlang/core/debug.Debug::{to_repr}

///|
/// Render as the canonical URI; an impossible combination of fields renders as
/// `tel:invalid` rather than panicking.
pub impl Show for TelUri with fn to_string(self : TelUri) -> String {
  match to_tel_uri_full(self) {
    Some(v) => v
    None => "tel:invalid"
  }
}

///|
/// `Show` promotes both `output` and `to_string`; name them so the promotion is
/// stated rather than implied (the compiler flags the alternative, E0079).
pub extend TelUri with Show::{output, to_string}

///|
/// The visual separators RFC 3966 allows inside a telephone-subscriber: hyphen,
/// dot and the two parentheses. Notably not the space.
fn is_tel_visual_separator(c : Char) -> Bool {
  match c {
    '-' | '.' | '(' | ')' => true
    _ => false
  }
}

///|
/// True when `c` is a hexadecimal digit letter (the A–F of local numbers).
fn is_hex_letter(c : Char) -> Bool {
  (c >= 'A' && c <= 'F') || (c >= 'a' && c <= 'f')
}

///|
/// One DNS label: non-empty, alphanumeric or hyphen, and not starting or ending
/// with a hyphen.
fn is_domain_label(s : String) -> Bool {
  let cs = chars_of(s)
  if cs.length() == 0 {
    return false
  }
  if cs[0] == '-' || cs[cs.length() - 1] == '-' {
    return false
  }
  for c in cs {
    let letter = (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')
    if !letter && !is_digit(c) && c != '-' {
      return false
    }
  }
  true
}

///|
/// True when `s` is a domain name: one or more non-empty labels joined by dots.
fn is_domain_name(s : String) -> Bool {
  for label in split_on(s, '.') {
    if !is_domain_label(label) {
      return false
    }
  }
  true
}

///|
/// Canonicalise a global number (which starts with `+`): digits and visual
/// separators, with at least one digit. Returns `+` followed by the digits.
fn canonical_global_number(s : String) -> String? {
  let cs = chars_of(s)
  let buf = StringBuilder()
  let mut any = false
  for i = 1; i < cs.length(); i = i + 1 {
    let c = cs[i]
    if is_digit(c) {
      buf.write_char(c)
      any = true
    } else if is_tel_visual_separator(c) {
      ()
    } else {
      return None
    }
  }
  if any {
    Some("+" + buf.to_string())
  } else {
    None
  }
}

///|
/// Canonicalise a local number: digits, `A`–`F` (uppercased), `*`, `#` and
/// visual separators, with at least one of the former. Separators are dropped.
fn canonical_local_number(s : String) -> String? {
  let buf = StringBuilder()
  let mut any = false
  for c in s {
    if is_digit(c) || c == '*' || c == '#' {
      buf.write_char(c)
      any = true
    } else if is_hex_letter(c) {
      buf.write_char(upper_ascii(c))
      any = true
    } else if is_tel_visual_separator(c) {
      ()
    } else {
      return None
    }
  }
  if any {
    Some(buf.to_string())
  } else {
    None
  }
}

///|
/// Canonicalise an extension: digits and visual separators, at least one digit.
fn canonical_extension(s : String) -> String? {
  let buf = StringBuilder()
  let mut any = false
  for c in s {
    if is_digit(c) {
      buf.write_char(c)
      any = true
    } else if is_tel_visual_separator(c) {
      ()
    } else {
      return None
    }
  }
  if any {
    Some(buf.to_string())
  } else {
    None
  }
}

///|
/// Canonicalise a phone-context descriptor: either `+` and at least one digit
/// (visual separators allowed and dropped), or a domain name in lower case.
fn canonical_phone_context(value : String) -> String? {
  if starts_with(value, "+") {
    let cs = chars_of(value)
    let buf = StringBuilder()
    let mut any = false
    for i = 1; i < cs.length(); i = i + 1 {
      let c = cs[i]
      if is_digit(c) {
        buf.write_char(c)
        any = true
      } else if is_tel_visual_separator(c) {
        ()
      } else {
        return None
      }
    }
    if any {
      Some("+" + buf.to_string())
    } else {
      None
    }
  } else if is_domain_name(value) {
    let buf = StringBuilder()
    for c in value {
      buf.write_char(lower_ascii(c))
    }
    Some(buf.to_string())
  } else {
    None
  }
}

///|
/// True for the characters an `isub` value may contain on its own. RFC 3966
/// makes it a run of URI characters (`uric`: unreserved, reserved and escapes),
/// not a number, so it is preserved rather than parsed.
fn is_isub_char(c : Char) -> Bool {
  // `uric` is the reserved set plus the unreserved one; the two members a
  // parameter grammar would otherwise swallow are the semicolon and the
  // question mark, which are legal inside an isdn-subaddress.
  if c == ';' || c == '?' {
    return true
  }
  if (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || is_digit(c) {
    return true
  }
  // U+0027, the apostrophe: a sub-delimiter of RFC 3986, and one this grammar
  // cannot spell as a character literal.
  if c.to_int() == 39 {
    return true
  }
  match c {
    '-' | '.' | '_' | '~' | '!' | '$' | '&' | '(' | ')' | '*' | '+' | ',' | '=' | ':' | '@' | '/' =>
      true
    _ => false
  }
}

///|
/// True for a hexadecimal digit, in either case.
fn is_hex_digit(c : Char) -> Bool {
  is_digit(c) || (c >= 'A' && c <= 'F') || (c >= 'a' && c <= 'f')
}

///|
/// Canonicalise an `isub` value: non-empty, every character a URI character, and
/// every `%` the start of a complete `%HH` escape. Hex digits inside an escape
/// are uppercased so the value round-trips to one spelling.
fn canonical_isub(s : String) -> String? {
  let cs = chars_of(s)
  if cs.length() == 0 {
    return None
  }
  let buf = StringBuilder()
  let mut i = 0
  while i < cs.length() {
    let c = cs[i]
    if c == '%' {
      if i + 2 >= cs.length() || !is_hex_digit(cs[i + 1]) || !is_hex_digit(cs[i + 2]) {
        return None
      }
      buf.write_char('%')
      buf.write_char(upper_ascii(cs[i + 1]))
      buf.write_char(upper_ascii(cs[i + 2]))
      i = i + 3
    } else if is_isub_char(c) {
      buf.write_char(c)
      i = i + 1
    } else {
      return None
    }
  }
  Some(buf.to_string())
}
///|
/// True for a parameter name: alphanumerics and hyphens, at least one.
fn is_pname(s : String) -> Bool {
  if s == "" {
    return false
  }
  for c in s {
    let letter = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
    if !letter && !is_digit(c) && c != '-' {
      return false
    }
  }
  true
}

///|
/// True for a generic parameter value: a run of paramchar, where a percent
/// sign must start a complete escape.
fn is_param_value(s : String) -> Bool {
  let cs = chars_of(s)
  if cs.length() == 0 {
    return false
  }
  let mut i = 0
  while i < cs.length() {
    let c = cs[i]
    if c == '%' {
      if i + 2 >= cs.length() || !is_hex_digit(cs[i + 1]) || !is_hex_digit(cs[i + 2]) {
        return false
      }
      i = i + 3
    } else if is_param_char(c) {
      i = i + 1
    } else {
      return false
    }
  }
  true
}

///|
/// The characters RFC 3966 allows in a generic parameter value.
fn is_param_char(c : Char) -> Bool {
  let letter = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
  if letter || is_digit(c) {
    return true
  }
  // U+0027, a mark character this grammar cannot write as a literal.
  if c.to_int() == 39 {
    return true
  }
  match c {
    '-' | '_' | '.' | '!' | '~' | '*' | '(' | ')' | '[' | ']' | '/' | ':' | '&' | '+' | '$' => true
    _ => false
  }
}

///|
/// The parameters in lexicographical order, the order RFC 3966 asks for.
fn sort_parameters(input : Array[(String, String)]) -> Array[(String, String)] {
  let out : Array[(String, String)] = []
  for p in input {
    out.push(p)
  }
  let mut i = 1
  while i < out.length() {
    let cur = out[i]
    let mut j = i
    while j > 0 && out[j - 1].0 > cur.0 {
      out[j] = out[j - 1]
      j = j - 1
    }
    out[j] = cur
    i = i + 1
  }
  out
}



///|
/// Parse a `tel:` URI into its parts, without resolving anything.
///
/// The scheme and parameter names are case-insensitive. Unknown parameters,
/// empty parameters, duplicate parameters, empty values and an `ext`/`isub`
/// conflict are rejected rather than dropped: a URI this parser cannot fully
/// represent is better refused than quietly changed. Spaces are not visual
/// separators (RFC 3966 §5.1.1), so only the outside of the URI is trimmed.
pub fn parse_tel_uri_full(uri : String) -> TelUri? {
  let s = trim(uri)
  if !starts_with_ci(s, "tel:") {
    return None
  }
  let rest = match drop(s, 4) {
    Some(r) => r
    None => return None
  }
  let parts = split_on(rest, ';')
  let subscriber = parts[0]
  if subscriber == "" {
    return None
  }
  let params : Array[(String, String)] = []
  let mut context : String? = None
  let mut ext : String? = None
  let mut isub : String? = None
  for i = 1; i < parts.length(); i = i + 1 {
    let part = parts[i]
    if part == "" {
      return None
    }
    let (name, value) = match split_first(part, '=') {
      Some(pair) => pair
      None => (part, "")
    }
    let lower = {
      let buf = StringBuilder()
      for c in name {
        buf.write_char(lower_ascii(c))
      }
      buf.to_string()
    }
    if lower == "ext" {
      if ext is Some(_) || isub is Some(_) {
        return None
      }
      ext = canonical_extension(value)
      if ext is None {
        return None
      }
    } else if lower == "isub" {
      if isub is Some(_) || ext is Some(_) {
        return None
      }
      isub = canonical_isub(value)
      if isub is None {
        return None
      }
    } else if lower == "phone-context" {
      if context is Some(_) {
        return None
      }
      context = canonical_phone_context(value)
      if context is None {
        return None
      }
    } else {
      // A parameter this library does not define: `;pname` or `;pname=pvalue`.
      // RFC 3966 lets other documents define parameters, so they are preserved
      // instead of being refused; a name or value outside the grammar still is.
      if !is_pname(name) {
        return None
      }
      if index_of_sub(part, "=") is Some(_) {
        if value == "" || !is_param_value(value) {
          return None
        }
      }
      let mut seen = false
      for q in params {
        if q.0 == name {
          seen = true
        }
      }
      if seen {
        return None
      }
      params.push((name, value))
    }
  }
  let mut global_number = ""
  let mut local_number = ""
  let mut phone_context = ""
  if starts_with(subscriber, "+") {
    if context is Some(_) {
      return None
    }
    match canonical_global_number(subscriber) {
      Some(v) => global_number = v
      None => return None
    }
  } else {
    match context {
      Some(v) => phone_context = v
      None => return None
    }
    match canonical_local_number(subscriber) {
      Some(v) => local_number = v
      None => return None
    }
  }
  Some({
    global_number,
    local_number,
    phone_context,
    parameters: sort_parameters(params),
    extension: match ext {
      Some(v) => v
      None => ""
    },
    isub: match isub {
      Some(v) => v
      None => ""
    },
  })
}

///|
/// Serialise the parts back to a canonical `tel:` URI. Parameters are written in
/// RFC 3966's order: `phone-context` (local numbers only), then `ext` or `isub`.
/// None for a combination the grammar cannot represent, such as a local number
/// without a context or both numbers set.
pub fn to_tel_uri_full(t : TelUri) -> String? {
  let is_global = t.global_number != ""
  let is_local = t.local_number != ""
  if is_global == is_local {
    return None
  }
  if is_global && t.phone_context != "" {
    return None
  }
  if is_local && t.phone_context == "" {
    return None
  }
  if t.extension != "" && t.isub != "" {
    return None
  }
  let mut out = if is_global {
    "tel:" + t.global_number
  } else {
    "tel:" + t.local_number
  }
  if t.extension != "" {
    out = out + ";ext=" + t.extension
  }
  if t.isub != "" {
    out = out + ";isub=" + t.isub
  }
  if is_local {
    out = out + ";phone-context=" + t.phone_context
  }
  for prm in sort_parameters(t.parameters) {
    out = out + ";" + prm.0
    if prm.1 != "" {
      out = out + "=" + prm.1
    }
  }
  Some(out)
}

///|
/// Turn parsed parts into an E.164 number when that is possible without asking
/// an external authority.
///
/// A global number resolves directly. A local number resolves only when its
/// context is a `+` prefix and its own digits are decimal; a domain context, or
/// a local number containing `*`, `#` or hex digits, has no E.164 reading.
/// `isub` is preserved in the TelUri but has no PhoneNumber field, so it does
/// not survive resolution.
pub fn resolve_tel_uri(t : TelUri) -> PhoneNumber? {
  let pn = if t.global_number != "" {
    parse(t.global_number, "")
  } else if t.local_number != "" && starts_with(t.phone_context, "+") {
    if digits_of(t.local_number) == t.local_number {
      parse(t.phone_context + t.local_number, "")
    } else {
      None
    }
  } else {
    None
  }
  match pn {
    Some(v) =>
      if is_valid(v) {
        Some(v.with_extension(t.extension))
      } else {
        None
      }
    None => None
  }
}

///|
/// Parse and resolve a `tel:` URI into a PhoneNumber.
///
/// This is the convenience form of `resolve_tel_uri(parse_tel_uri_full(uri))`.
/// Returns None for anything that is not a resolvable tel URI.
pub fn parse_tel_uri(uri : String) -> PhoneNumber? {
  match parse_tel_uri_full(uri) {
    Some(t) => resolve_tel_uri(t)
    None => None
  }
}

///|
/// The RFC 3966 URI for a number. Same rendering as `format_rfc3966`, offered
/// here so the two halves of URI handling sit together.
pub fn to_tel_uri(pn : PhoneNumber) -> String {
  format_rfc3966(pn)
}
