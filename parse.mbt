// Parsing: turn the many ways a number is written into a PhoneNumber.
//
// Three shapes are accepted, in this order of certainty:
//   * E.164 / international — a leading `+` and the calling code, e.g. `+81 90-1234-5678`
//   * international prefix — a region's dial-out prefix then the calling code,
//     e.g. `011 44 20 7946 0958` from inside the NANP
//   * national — a number as dialled inside one region, e.g. `090-1234-5678` in Japan
//
// The last two need a region hint; only the first is self-describing.

///|
/// Split a trailing extension off a written number.
///
/// Recognises the RFC 3966 `;ext=` form and the common `x123`, `X123`, `#123`
/// and `ext. 123` suffixes. Returns the number part and the extension's digits
/// (empty when there was none). The marker must be followed by digits, so an
/// `x` inside ordinary text is not mistaken for an extension.
fn split_extension(input : String) -> (String, String) {
  let s = trim(input)
  match index_of_sub(s, ";ext=") {
    Some(i) => {
      let digits = match drop(s, i + 5) {
        Some(rest) => digits_of(rest)
        None => ""
      }
      return (trim(slice(chars_of(s), 0, i)), digits)
    }
    None => ()
  }
  let cs = chars_of(s)
  let n = cs.length()
  let mut e = n
  while e > 0 && is_digit(cs[e - 1]) {
    e = e - 1
  }
  // No trailing digits, or the whole string is digits: no extension.
  if e == n || e == 0 {
    return (trim(s), "")
  }
  if cs[e - 1] == 'x' || cs[e - 1] == 'X' || cs[e - 1] == '#' {
    return (trim(slice(cs, 0, e - 1)), slice(cs, e, n - e))
  }
  // "ext", optionally followed by "." or ":" and/or a space.
  let mut m = e
  while m > 0 && (cs[m - 1] == '.' || cs[m - 1] == ':' || cs[m - 1] == ' ') {
    m = m - 1
  }
  if m >= 3 {
    let a = upper_ascii(cs[m - 3])
    let b = upper_ascii(cs[m - 2])
    let c = upper_ascii(cs[m - 1])
    if a == 'E' && b == 'X' && c == 'T' {
      return (trim(slice(cs, 0, m - 3)), slice(cs, e, n - e))
    }
  }
  (trim(s), "")
}

///|
/// The longest calling code (1..3 digits) that names a known region at the head
/// of `digits`, or None. Calling codes are assigned so that none is a prefix of
/// another, but the table holds only 51 of them, so the longest match against
/// the table is what decides.
fn country_code_prefix(digits : String) -> Int? {
  let mut n = 3
  while n >= 1 {
    match take(digits, n) {
      Some(head) =>
        match int_of_digits(head) {
          Some(cc) =>
            if region_exists_at_code(cc) {
              return Some(cc)
            }
          None => ()
        }
      None => ()
    }
    n = n - 1
  }
  None
}

///|
/// True when some region uses this calling code.
fn region_exists_at_code(cc : Int) -> Bool {
  region_by_calling_code(cc) is Some(_)
}

///|
/// Parse a number written in any of the accepted shapes.
///
/// `default_region` is the ISO 3166-1 alpha-2 code the number should be read in
/// when it does not carry a `+` or an international prefix. Pass `""` to accept
/// only self-describing numbers. Returns None when the input cannot be read.
pub fn parse(input : String, default_region : String) -> PhoneNumber? {
  let (main, ext) = split_extension(input)
  let cs = chars_of(trim(main))
  if cs.length() == 0 {
    return None
  }
  let mut start = 0
  let mut international = false
  if cs[0] == '+' {
    international = true
    start = 1
  }
  let body_text = slice(cs, start, cs.length() - start)
  if !digits_and_separators(body_text) {
    return None
  }
  let mut body = digits_of(body_text)
  if body == "" {
    return None
  }
  // A `+`-less number may still be international: strip the region's dial-out
  // prefix when what follows begins a known calling code.
  if !international && default_region != "" {
    match find_region(default_region) {
      Some(r) =>
        if r.idd != "" && starts_with(body, r.idd) {
          match drop(body, r.idd.length()) {
            Some(after) =>
              if after != "" && country_code_prefix(after) is Some(_) {
                international = true
                body = after
              }
            None => ()
          }
        }
      None => ()
    }
  }
  if international {
    match country_code_prefix(body) {
      Some(cc) => {
        let cc_len = cc.to_string().length()
        let nsn = match drop(body, cc_len) {
          Some(x) => x
          None => ""
        }
        if nsn == "" {
          return None
        }
        return Some({ country_code: cc, national_number: nsn, extension: ext })
      }
      None => return None
    }
  }
  match find_region(default_region) {
    None => None
    Some(r) => {
      let mut nsn = body
      if r.national_prefix != "" && starts_with(nsn, r.national_prefix) {
        match drop(nsn, r.national_prefix.length()) {
          Some(stripped) =>
            if stripped != "" {
              nsn = stripped
            }
          None => ()
        }
      }
      Some({ country_code: r.calling_code, national_number: nsn, extension: ext })
    }
  }
}

///|
/// Parse a self-describing number: one that starts with `+`. The region hint is
/// empty, so anything else returns None.
pub fn parse_e164(input : String) -> PhoneNumber? {
  parse(input, "")
}

///|
/// Parse a number that is written the way it is dialled inside `region`.
pub fn parse_national(input : String, region : String) -> PhoneNumber? {
  parse(input, region)
}
