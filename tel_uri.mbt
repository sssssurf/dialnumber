// RFC 3966 `tel:` URIs — the form a phone number takes in a web page, a vCard
// or an SMS link.
//
// A tel URI carries either a global number (`tel:+1-201-555-0123`) or a local
// one plus a `phone-context` that supplies the missing prefix. Only the global
// forms can be resolved to a PhoneNumber without more information, so a local
// number whose context is a domain (not a `+` prefix) returns None.

///|
/// Parse a `tel:` URI into a PhoneNumber.
///
/// Handles the global form, the local-with-`+`-context form, and the `;ext=`
/// parameter. The scheme and parameter names are matched case-insensitively.
/// Returns None for anything that is not a resolvable tel URI.
pub fn parse_tel_uri(uri : String) -> PhoneNumber? {
  let s = trim(uri)
  if !starts_with_ci(s, "tel:") {
    return None
  }
  let rest = match drop(s, 4) {
    Some(r) => r
    None => return None
  }
  let parts = split_on(rest, ';')
  let number_part = parts[0]
  let mut ext = ""
  let mut context = ""
  for i = 1; i < parts.length(); i = i + 1 {
    let p = parts[i]
    if starts_with_ci(p, "ext=") {
      ext = digits_of(match drop(p, 4) { Some(v) => v; None => "" })
    } else if starts_with_ci(p, "phone-context=") {
      context = match drop(p, 14) { Some(v) => v; None => "" }
    }
  }
  let pn = if starts_with(number_part, "+") {
    parse(number_part, "")
  } else if starts_with(context, "+") {
    // Local number: the context supplies the country code and area prefix.
    parse("+" + digits_of(context) + digits_of(number_part), "")
  } else {
    None
  }
  match pn {
    Some(v) => Some(v.with_extension(ext))
    None => None
  }
}

///|
/// The RFC 3966 URI for a number. Same rendering as `format_rfc3966`, offered
/// here so the two halves of URI handling sit together.
pub fn to_tel_uri(pn : PhoneNumber) -> String {
  format_rfc3966(pn)
}
