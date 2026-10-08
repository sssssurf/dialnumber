// Structural validation.
//
// The check available from published plan data alone is a length test: a calling
// code the table knows, and a national number whose length the plan uses. That
// is the same test libphonenumber calls "possible". Deciding whether a line is
// actually assigned needs the leading-digit patterns, which this library does
// not carry, so there is deliberately no function that claims to do more than
// the data supports. See the README for the full boundary.

///|
/// The region a parsed number belongs to: one that uses its calling code and
/// admits its length. For a shared calling code the primary region wins.
/// None when no region matches.
pub fn region_of_number(pn : PhoneNumber) -> String? {
  let n = chars_of(pn.national_number).length()
  let mut fallback : String? = None
  for r in regions {
    if r.calling_code == pn.country_code && lengths_of(r).contains(n) {
      if r.primary {
        return Some(r.code)
      }
      if fallback is None {
        fallback = Some(r.code)
      }
    }
  }
  fallback
}

///|
/// True when a known region uses the number's calling code and admits its
/// length. Streams are not consulted: this says the number *could* exist in the
/// plan, not that it is assigned.
pub fn is_possible(pn : PhoneNumber) -> Bool {
  region_of_number(pn) is Some(_)
}

///|
/// The same check against one named region.
pub fn is_possible_in_region(pn : PhoneNumber, region : String) -> Bool {
  match find_region(region) {
    None => false
    Some(r) =>
      r.calling_code == pn.country_code &&
      lengths_of(r).contains(chars_of(pn.national_number).length())
  }
}

///|
/// The number types whose length rule admits this number, within the region it
/// resolves to. Empty when the length fits no category or no region matches.
/// Several types can share a length, so this is a candidate set, not a verdict.
pub fn possible_types(pn : PhoneNumber) -> Array[NumberType] {
  match region_of_number(pn) {
    Some(code) => possible_types_in_region(pn, code)
    None => []
  }
}

///|
/// The number types in one named region whose length rule admits this number.
pub fn possible_types_in_region(
  pn : PhoneNumber,
  region : String,
) -> Array[NumberType] {
  match find_region(region) {
    None => []
    Some(r) =>
      if r.calling_code == pn.country_code {
        types_for_length(r, chars_of(pn.national_number).length())
      } else {
        []
      }
  }
}

///|
/// Parse then check, in one call. None becomes false.
pub fn is_possible_number(input : String, region : String) -> Bool {
  match parse(input, region) {
    Some(pn) => is_possible(pn)
    None => false
  }
}
