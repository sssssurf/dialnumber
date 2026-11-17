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
  let labels = split_on(s, '.')
  let end = if labels[labels.length() - 1] == "" {
    labels.length() - 1
  } else {
    labels.length()
  }
  if end == 0 {
    return false
  }
  for i = 0; i < end; i = i + 1 {
    let label = labels[i]
    if !is_domain_label(label) {
      return false
    }
  }
  let top = chars_of(labels[end - 1])[0]
  if !((top >= 'a' && top <= 'z') || (top >= 'A' && top <= 'Z')) {
    return false
  }
  true
}

///|
/// Canonicalise a global number (which starts with `+`): digits and visual
/// separators, with at least one digit. Returns `+` followed by the digits.
fn canonical_global_number(s : String) -> String? {
  let s = match tel_unescape_unreserved(s) {
    None => return None
    Some(v) => v
  }
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
  let s = match tel_unescape_unreserved(s) {
    None => return None
    Some(v) => v
  }
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
  let s = match tel_unescape_unreserved(s) {
    None => return None
    Some(v) => v
  }
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
  let value = match tel_unescape_unreserved(value) {
    None => return None
    Some(v) => v
  }
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
/// True for a hexadecimal digit, in either case.
fn is_hex_digit(c : Char) -> Bool {
  is_digit(c) || (c >= 'A' && c <= 'F') || (c >= 'a' && c <= 'f')
}

///|
/// RFC 3966 section 3: unreserved characters and their percent encodings are
/// equivalent. Reserved delimiters remain escaped, never split into parameters.
fn tel_unescape_unreserved(s : String) -> String? {
  let cs = chars_of(s)
  let buf = StringBuilder()
  let mut i = 0
  while i < cs.length() {
    if cs[i] == '%' {
      if i + 2 >= cs.length() ||
        !is_hex_digit(cs[i + 1]) ||
        !is_hex_digit(cs[i + 2]) {
        return None
      }
      let hi = tel_hex_value(cs[i + 1])
      let lo = tel_hex_value(cs[i + 2])
      let decoded = (hi * 16 + lo).unsafe_to_char()
      let unreserved = is_digit(decoded) ||
        (decoded >= 'a' && decoded <= 'z') ||
        (decoded >= 'A' && decoded <= 'Z') ||
        "-_.!~*'()".contains(slice([decoded], 0, 1))
      if unreserved {
        buf.write_char(decoded)
      } else {
        buf.write_char('%')
        buf.write_char(upper_ascii(cs[i + 1]))
        buf.write_char(upper_ascii(cs[i + 2]))
      }
      i = i + 3
    } else {
      buf.write_char(cs[i])
      i = i + 1
    }
  }
  Some(buf.to_string())
}

///|
fn tel_hex_value(c : Char) -> Int32 {
  if is_digit(c) {
    c.to_int() - '0'.to_int()
  } else {
    upper_ascii(c).to_int() - 'A'.to_int() + 10
  }
}

///|
/// RFC 3966 §3 and verified erratum 203 use `paramchar` for both isub and
/// generic values. A public isub field may also supply decoded punctuation.
/// Encode those bytes before they are allowed into the URI grammar.
fn canonical_parameter(value : String, decoded_isub~ : Bool = false) -> String? {
  let value = match tel_unescape_unreserved(value) {
    None => return None
    Some(v) => v
  }
  let buf = StringBuilder()
  for c in value {
    match c {
      '+' => buf.write_string("%2B")
      ';' if decoded_isub => buf.write_string("%3B")
      '=' if decoded_isub => buf.write_string("%3D")
      '?' if decoded_isub => buf.write_string("%3F")
      '@' if decoded_isub => buf.write_string("%40")
      ',' if decoded_isub => buf.write_string("%2C")
      _ => buf.write_char(c)
    }
  }
  let canonical = buf.to_string()
  if is_param_value(canonical) { Some(canonical) } else { None }
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
      if i + 2 >= cs.length() ||
        !is_hex_digit(cs[i + 1]) ||
        !is_hex_digit(cs[i + 2]) {
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
    '-'
    | '_'
    | '.'
    | '!'
    | '~'
    | '*'
    | '('
    | ')'
    | '['
    | ']'
    | '/'
    | ':'
    | '&'
    | '+'
    | '$' => true
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
/// The scheme and parameter names are case-insensitive. Unknown parameters are
/// preserved. Empty or duplicate parameters, empty values and an `ext`/`isub`
/// conflict are rejected. Only the outside of the URI is trimmed.
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
    let (raw_name, value) = match split_first(part, '=') {
      Some(pair) => pair
      None => (part, "")
    }
    let name = match tel_unescape_unreserved(raw_name) {
      None => return None
      Some(v) => v
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
      isub = canonical_parameter(value)
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
      let mut seen = false
      for q in params {
        if starts_with_ci(q.0, lower) && q.0.length() == lower.length() {
          seen = true
        }
      }
      if seen {
        return None
      }
      let value = if index_of_sub(part, "=") is Some(_) {
        match canonical_parameter(value) {
          None => return None
          Some(v) => v
        }
      } else {
        ""
      }
      params.push((lower, value))
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
/// RFC 3966's order: `ext` or `isub`, then `phone-context`, then sorted extras.
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
  // TelUri is publicly constructible: validate every field independently so
  // embedded delimiters cannot inject a parameter or bypass mandatory checks.
  let subscriber = if is_global {
    if !starts_with(t.global_number, "+") {
      return None
    }
    match canonical_global_number(t.global_number) {
      None => return None
      Some(v) => v
    }
  } else {
    match canonical_local_number(t.local_number) {
      None => return None
      Some(v) => v
    }
  }
  let mut out = "tel:" + subscriber
  if t.extension != "" {
    let ext = match canonical_extension(t.extension) {
      None => return None
      Some(v) => v
    }
    out = out + ";ext=" + ext
  }
  if t.isub != "" {
    let isub = match canonical_parameter(t.isub, decoded_isub=true) {
      None => return None
      Some(v) => v
    }
    out = out + ";isub=" + isub
  }
  if is_local {
    let context = match canonical_phone_context(t.phone_context) {
      None => return None
      Some(v) => v
    }
    out = out + ";phone-context=" + context
  }
  let parameters : Array[(String, String)] = []
  for (name, value) in t.parameters {
    let buf = StringBuilder()
    for c in name {
      buf.write_char(lower_ascii(c))
    }
    let lower = buf.to_string()
    if !is_pname(lower) ||
      lower == "ext" ||
      lower == "isub" ||
      lower == "phone-context" {
      return None
    }
    let value = if value == "" {
      ""
    } else {
      match canonical_parameter(value) {
        None => return None
        Some(v) => v
      }
    }
    for existing in parameters {
      if existing.0 == lower {
        return None
      }
    }
    parameters.push((lower, value))
  }
  for prm in sort_parameters(parameters) {
    out = out + ";" + prm.0
    if prm.1 != "" {
      out = out + "=" + prm.1
    }
  }
  Some(out)
}

///|
/// Resolve a local number against a numeric context.
///
/// The context supplies the plan, not a prefix: the local digits are read the
/// way that plan reads a national number (its trunk prefix is stripped by
/// `parse`), and only a number that validates is returned. The separate NANP
/// area-code convention accepts exactly an area code and seven local digits.
/// Other numeric descriptors need an explicit authority, even if ignoring the
/// descriptor would produce a valid-looking number.
fn resolve_local_context(
  context : String,
  local_number : String,
) -> PhoneNumber? {
  if !starts_with(context, "+") || digits_of(local_number) != local_number {
    return None
  }
  let code = match country_code_prefix(digits_of(context)) {
    None => return None
    Some(cc) => cc
  }
  // RFC 3966 does not define a numeric context as a prefix. These are
  // public-plan conventions; arbitrary PBX contexts need an authority.
  if context != "+" + code.to_string() {
    if code == 1 && context.length() == 5 && local_number.length() == 7 {
      let area = drop(context, 2).unwrap()
      let pn = PhoneNumber::new(code, area + local_number)
      return if is_valid(pn) { Some(pn) } else { None }
    }
    return None
  }
  let r = match region_by_calling_code(code) {
    Some(region) => match find_region(region) {
      Some(v) => v
      None => return None
    }
    None => return None
  }
  // The context fixes the calling code. The human-input parser also tries
  // international dial-out and omitted-plus forms, which do not apply here.
  let pn = PhoneNumber::new(code, strip_national_prefix(r, local_number))
  if is_valid(pn) { Some(pn) } else { None }
}

///|
/// Turn parsed parts into an E.164 number when that is possible without asking
/// an external authority.
///
/// A global number resolves with the subscriber digits in the URI. The default local resolver uses only
/// the documented public national-plan and NANP area conventions. Supply an
/// explicit `context_resolver` authority for a domain or private PBX context.
/// `isub` stays in TelUri. The resolved number retains an authority-provided
/// extension when the URI omits it. Conflicting extensions fail resolution.
pub fn resolve_tel_uri(
  t : TelUri,
  context_resolver~ : (String, String) -> PhoneNumber? = resolve_local_context,
) -> PhoneNumber? {
  let serialized = match to_tel_uri_full(t) {
    None => return None
    Some(v) => v
  }
  let canonical = match parse_tel_uri_full(serialized) {
    None => return None
    Some(v) => v
  }
  for param in canonical.parameters {
    if starts_with_ci(param.0, "m-") {
      return None
    }
  }
  let pn = if canonical.global_number != "" {
    match split_global_digits(drop(canonical.global_number, 1).unwrap()) {
      Some((cc, nsn)) => Some(PhoneNumber::new(cc, nsn))
      None => None
    }
  } else if canonical.local_number != "" {
    context_resolver(canonical.phone_context, canonical.local_number)
  } else {
    None
  }
  match pn {
    Some(v) => {
      if !is_valid(v) || (v.extension != "" && !is_all_digits(v.extension)) {
        return None
      }
      let ext = canonical.extension
      if ext == "" {
        Some(v)
      } else if v.extension == "" || v.extension == ext {
        Some(v.with_extension(ext))
      } else {
        None
      }
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
