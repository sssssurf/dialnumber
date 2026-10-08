// Rendering a parsed number back to text.
//
// Four renderings, all built from the parsed value rather than the original
// input so they are stable no matter how the number was written:
//
//   * E.164            +8613123456789
//   * international    +86 13123456789
//   * national         (region's trunk prefix) + national number
//   * RFC 3966         tel:+8613123456789;ext=42
//
// Deliberately absent: locale-specific digit grouping. Getting "201 555 0123"
// right needs the same leading-digit patterns the validation layer omits, so a
// generic grouper would be wrong exactly where it looked most confident. The
// caller can group for display.

///|
/// The canonical E.164 rendering: `+`, the calling code, then the national
/// number, with no separators. Any extension is dropped — use `format_rfc3966`
/// when the extension must survive.
pub fn format_e164(pn : PhoneNumber) -> String {
  "+" + pn.country_code.to_string() + pn.national_number
}

///|
/// The E.164 rendering with a space between the calling code and the national
/// number, which is how the number is usually printed.
pub fn format_international(pn : PhoneNumber) -> String {
  "+" + pn.country_code.to_string() + " " + pn.national_number
}

///|
/// The number as dialled inside `region`: its trunk prefix followed by the
/// national number. None when the region is unknown or uses a different calling
/// code than the number.
pub fn format_national(pn : PhoneNumber, region : String) -> String? {
  match find_region(region) {
    None => None
    Some(r) =>
      if r.calling_code != pn.country_code {
        None
      } else {
        Some(r.national_prefix + pn.national_number)
      }
  }
}

///|
/// The RFC 3966 `tel:` URI. The extension, when present, becomes `;ext=`.
pub fn format_rfc3966(pn : PhoneNumber) -> String {
  let base = "tel:" + format_e164(pn)
  if pn.extension == "" {
    base
  } else {
    base + ";ext=" + pn.extension
  }
}
