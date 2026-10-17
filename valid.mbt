// Structural validation.
//
// Two checks are available from published plan data:
//
//   * a length test: a calling code the table knows, and a national number whose
//     length the plan uses. That is the same test libphonenumber calls
//     "possible", and it is all that is applied to the 49 plans known only by
//     their lengths.
//   * for +1, a structural test: the NANP's NPA-NXX-XXXX shape, which is
//     published, plus the area-code split between the United States and Canada.
//     This resolves the one shared calling code in the table and rejects numbers
//     no NANP plan could contain.
//
// Neither check proves a line is assigned: that needs the per-plan leading-digit
// patterns, which this library does not carry. See the README for the boundary.

///|
/// The region a parsed number belongs to.
///
/// For +1 the area code decides: a Canadian NPA gives `"CA"`, any other
/// structurally valid NPA gives `"US"` (see `nanp.mbt`). For every other calling
/// code the region must use that code and admit the number's length; if several
/// do, the primary region wins. None when no region matches.
pub fn region_of_number(pn : PhoneNumber) -> String? {
  if pn.country_code == 1 {
    return nanp_region_of(pn.national_number)
  }
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
/// True when the number could exist in some plan the table knows. For +1 this
/// checks the NANP structure; for everything else it checks the length. Streams
/// are not consulted: this says the number *could* exist, not that it is
/// assigned.
pub fn is_possible(pn : PhoneNumber) -> Bool {
  if pn.country_code == 1 {
    return nanp_possible(pn.national_number)
  }
  region_of_number(pn) is Some(_)
}

///|
/// The same check against one named region.
///
/// For +1 this is stronger than a length test: the number must have NANP
/// structure and its area code must belong to `region`, so a Manitoba number is
/// not possible in the United States. For other calling codes it remains the
/// length test, because no better published rule is carried here.
pub fn is_possible_in_region(pn : PhoneNumber, region : String) -> Bool {
  match find_region(region) {
    None => false
    Some(r) =>
      if pn.country_code == 1 {
        nanp_region_of(pn.national_number) == Some(r.code)
      } else {
        r.calling_code == pn.country_code &&
        lengths_of(r).contains(chars_of(pn.national_number).length())
      }
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
/// For +1 the number must also have NANP structure and its area code must
/// belong to the region.
pub fn possible_types_in_region(
  pn : PhoneNumber,
  region : String,
) -> Array[NumberType] {
  match find_region(region) {
    None => []
    Some(r) =>
      if r.calling_code != pn.country_code {
        []
      } else if pn.country_code == 1 {
        if nanp_region_of(pn.national_number) == Some(r.code) {
          types_for_length(r, chars_of(pn.national_number).length())
        } else {
          []
        }
      } else {
        types_for_length(r, chars_of(pn.national_number).length())
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
