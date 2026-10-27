// Non-geographic E.164 networks: +800, +808, +870, +878, +881, +882, +883, +888 and +979.
//
// These describe services rather than places, so they are keyed by calling
// code instead of by region. Extracted from the same upstream metadata as the
// region table (see data/numbering-plans.json for the source and its checksum).

///|
/// One non-geographic network: its calling code and the rules it publishes.
priv struct NonGeoPlan {
  calling_code : Int32
  general : String
  types : Array[PlanType]
}

///|
fn plan_non_geo(
  calling_code : Int32,
  general : String,
  types : Array[PlanType],
) -> NonGeoPlan {
  { calling_code, general, types, }
}

///|
/// The network that uses a calling code, or None.
fn find_non_geo(cc : Int32) -> NonGeoPlan? {
  for p in non_geo_plans {
    if p.calling_code == cc {
      return Some(p)
    }
  }
  None
}

///|
fn non_geo_possible(pn : PhoneNumber) -> Bool {
  if pn.national_number == "" ||
    digits_of(pn.national_number) != pn.national_number {
    return false
  }
  match find_non_geo(pn.country_code) {
    None => false
    Some(p) => {
      for t in p.types {
        if t.national.contains(pn.national_number.length()) {
          return true
        }
      }
      false
    }
  }
}

///|
/// True when the number is a valid number of its non-geographic network.
fn non_geo_admits(pn : PhoneNumber) -> Bool {
  match find_non_geo(pn.country_code) {
    None => false
    Some(p) =>
      if !matches_pattern(p.general, pn.national_number) {
        false
      } else {
        let mut hit = false
        for t in p.types {
          if type_rule_matches(t, pn.national_number) {
            hit = true
          }
        }
        hit
      }
  }
}

///|
/// The type the network's rules report, in libphonenumber's precedence.
fn non_geo_type(pn : PhoneNumber) -> NumberType? {
  match find_non_geo(pn.country_code) {
    None => None
    Some(p) => {
      if !matches_pattern(p.general, pn.national_number) {
        return None
      }
      for t in p.types {
        if type_rule_matches(t, pn.national_number) {
          return Some(t.kind)
        }
      }
      None
    }
  }
}
