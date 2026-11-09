// Validation, in the two levels the published plans support.
//
//   * `is_possible` is the cheap test: the calling code is known and the national
//     number has a length the plan uses somewhere. It is the same "possible" that
//     libphonenumber defines, and it can say yes to a number that is not
//     assigned.
//   * `is_valid` is the rule test: the national number must match one of the
//     plan's published patterns. Every region in the table now carries those
//     patterns, so this is a real decision procedure rather than a length check,
//     and `number_type` is the same walk reporting which rule matched.
//
// The extra level matters because a plan's rules are what tell a fixed line from
// a mobile line and one territory from another inside a shared calling code:
// `nanp.mbt` and `region_of_number` both use them.

///|
/// The regions that share a calling code, in table order.
fn regions_with_code(cc : Int32) -> Array[Region] {
  let out : Array[Region] = []
  for r in regions {
    if r.calling_code == cc {
      out.push(r)
    }
  }
  out
}

///|
/// The region a parsed number belongs to.
///
/// A calling code used by one region resolves to it. A shared code (the NANP is
/// the big one: 25 territories on `+1`) is resolved by the plans' own rules: the
/// first region whose patterns accept the national number wins, primary region
/// first, and a number no rule accepts falls back to the region whose length
/// rule admits it — it is then possible without being valid. None when the
/// calling code is unknown or no region can claim the number at all.
pub fn region_of_number(pn : PhoneNumber) -> String? {
  if !is_all_digits(pn.national_number) {
    return None
  }
  if pn.country_code == 1 {
    return nanp_region_of(pn.national_number)
  }
  let candidates = regions_with_code(pn.country_code)
  if candidates.length() == 0 {
    return if find_non_geo(pn.country_code) is Some(_) {
      Some("001")
    } else {
      None
    }
  }
  // A territory that publishes leading digits and matches them is more specific
  // than the primary territory of a shared calling code, so it wins first.
  for r in candidates {
    if r.leading_digits != "" &&
      region_leading_matches(r, pn.national_number) &&
      region_admits(r, pn.national_number) {
      return Some(r.code)
    }
  }
  for r in candidates {
    if r.primary && region_admits(r, pn.national_number) {
      return Some(r.code)
    }
  }
  for r in candidates {
    if region_leading_matches(r, pn.national_number) &&
      region_admits(r, pn.national_number) {
      return Some(r.code)
    }
  }
  let n = chars_of(pn.national_number).length()
  for r in candidates {
    if r.primary &&
      region_leading_matches(r, pn.national_number) &&
      lengths_of(r).contains(n) {
      return Some(r.code)
    }
  }
  for r in candidates {
    if region_leading_matches(r, pn.national_number) &&
      lengths_of(r).contains(n) {
      return Some(r.code)
    }
  }
  None
}

///|
/// True when the number could exist in some plan the table knows: a known
/// calling code and a national or local-only length the plan uses. Assignment
/// and NANP structural restrictions belong to validity, not possibility.
/// Possible is not the same as assigned; use `is_valid` for that.
pub fn is_possible(pn : PhoneNumber) -> Bool {
  if !is_all_digits(pn.national_number) {
    return false
  }
  if find_non_geo(pn.country_code) is Some(_) {
    return non_geo_possible(pn)
  }
  for r in regions_with_code(pn.country_code) {
    if is_possible_in_region(pn, r.code) {
      return true
    }
  }
  false
}

///|
/// True when the national number matches a rule the plan publishes for the
/// region it resolves to. This is libphonenumber's "valid": the number fits a
/// type pattern of the plan, so it is in an assigned range.
pub fn is_valid(pn : PhoneNumber) -> Bool {
  match region_of_number(pn) {
    Some(code) => is_valid_in_region(pn, code)
    None => false
  }
}

///|
/// True when the number matches a rule of this named region. Also false when the
/// region is unknown or its calling code differs from the number's.
pub fn is_valid_in_region(pn : PhoneNumber, region : String) -> Bool {
  if region == "001" {
    return non_geo_admits(pn)
  }
  match find_region(region) {
    Some(r) =>
      r.calling_code == pn.country_code && region_admits(r, pn.national_number)
    None => false
  }
}

///|
/// The number type the plan's rules report for this number, using
/// libphonenumber's precedence: a special-range rule (toll free, premium rate,
/// VoIP, ...) wins over a geographic one, and a number a plan accepts as both
/// fixed line and mobile is reported as `FixedLineOrMobile`. None when the
/// number matches no rule — which is exactly when `is_valid` is false.
pub fn number_type(pn : PhoneNumber) -> NumberType? {
  match region_of_number(pn) {
    Some(code) => number_type_in_region(pn, code)
    None => None
  }
}

///|
/// The number type inside one named region, or None when the region is unknown,
/// uses a different calling code, or does not accept the number.
pub fn number_type_in_region(pn : PhoneNumber, region : String) -> NumberType? {
  if region == "001" {
    return non_geo_type(pn)
  }
  match find_region(region) {
    Some(r) =>
      if r.calling_code == pn.country_code {
        type_of_national_number(r, pn.national_number)
      } else {
        None
      }
    None => None
  }
}

///|
/// The same check as `is_possible` against one named region.
///
/// This tests national or local-only lengths, independently of area code
/// assignment. Use is_valid_in_region for actual regional allocation.
pub fn is_possible_in_region(pn : PhoneNumber, region : String) -> Bool {
  if !is_all_digits(pn.national_number) {
    return false
  }
  if region == "001" {
    return non_geo_possible(pn)
  }
  match find_region(region) {
    None => false
    Some(r) => {
      if r.calling_code != pn.country_code {
        return false
      }
      let length = pn.national_number.length()
      for t in r.types {
        if t.national.contains(length) || t.local_only.contains(length) {
          return true
        }
      }
      false
    }
  }
}

///|
/// The number types whose length rule admits this number, within the region it
/// resolves to. Empty when the length fits no category or no region matches.
/// Several types can share a length, so this is a candidate set, not a verdict;
/// `number_type` is the pattern-based answer.
pub fn possible_types(pn : PhoneNumber) -> Array[NumberType] {
  if !is_all_digits(pn.national_number) {
    return []
  }
  if find_non_geo(pn.country_code) is Some(_) {
    return possible_types_in_region(pn, "001")
  }
  let out : Array[NumberType] = []
  for r in regions_with_code(pn.country_code) {
    for kind in possible_types_in_region(pn, r.code) {
      if !out.contains(kind) {
        out.push(kind)
      }
    }
  }
  out
}

///|
/// The number types in one named region whose length rule admits this number.
/// National and local-only lengths are included independently of assignment.
pub fn possible_types_in_region(
  pn : PhoneNumber,
  region : String,
) -> Array[NumberType] {
  if !is_all_digits(pn.national_number) {
    return []
  }
  let out : Array[NumberType] = []
  if region == "001" {
    match find_non_geo(pn.country_code) {
      None => ()
      Some(plan) =>
        for t in plan.types {
          if t.national.contains(pn.national_number.length()) {
            out.push(t.kind)
          }
        }
    }
    return out
  }
  match find_region(region) {
    None => ()
    Some(r) =>
      if r.calling_code == pn.country_code {
        for kind in types_for_length(r, pn.national_number.length()) {
          out.push(kind)
        }
        for t in r.types {
          if t.local_only.contains(pn.national_number.length()) &&
            !out.contains(t.kind) {
            out.push(t.kind)
          }
        }
      }
  }
  out
}

///|
/// Parse then check possibility, in one call. None becomes false.
pub fn is_possible_number(input : String, region : String) -> Bool {
  match parse(input, region) {
    Some(pn) => is_possible(pn)
    None => false
  }
}

///|
/// Parse then check validity, in one call. None becomes false.
pub fn is_valid_number(input : String, region : String) -> Bool {
  match parse(input, region) {
    Some(pn) => is_valid(pn)
    None => false
  }
}
