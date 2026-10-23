// Non-geographic E.164 networks: +800, +808, +870, +878, +881, +882, +883, +888 and +979.
//
// These describe services rather than places, so they are keyed by calling
// code instead of by region. Extracted from the same upstream metadata as the
// region table (see data/numbering-plans.json for the source and its checksum).

///|
/// One non-geographic network: its calling code and the rules it publishes.
priv struct NonGeoPlan {
  calling_code : Int
  general : String
  types : Array[PlanType]
}

///|
fn plan_non_geo(calling_code : Int, general : String, types : Array[PlanType]) -> NonGeoPlan {
  { calling_code, general, types }
}

///|
/// The networks, sorted by calling code.
let non_geo_plans : Array[NonGeoPlan] = [
  plan_non_geo(
    800,
    "(?:00|[1-9]\\d)\\d{6}",
    [
      plan_type(TollFree, "(?:00|[1-9]\\d)\\d{6}", [8], []),
    ],
  ),
  plan_non_geo(
    808,
    "[1-9]\\d{7}",
    [
      plan_type(SharedCost, "[1-9]\\d{7}", [8], []),
    ],
  ),
  plan_non_geo(
    870,
    "7\\d{11}|[235-7]\\d{8}",
    [
      plan_type(Mobile, "(?:[356]|774[45])\\d{8}|7[6-8]\\d{7}", [9, 12], []),
      plan_type(Voip, "2\\d{8}", [9], []),
    ],
  ),
  plan_non_geo(
    878,
    "10\\d{10}",
    [
      plan_type(Voip, "10\\d{10}", [12], []),
    ],
  ),
  plan_non_geo(
    881,
    "6\\d{9}|[0-36-9]\\d{8}",
    [
      plan_type(Mobile, "6\\d{9}|[0-36-9]\\d{8}", [9, 10], []),
    ],
  ),
  plan_non_geo(
    882,
    "[13]\\d{6}(?:\\d{2,5})?|[19]\\d{7}|(?:[25]\\d\\d|4)\\d{7}(?:\\d{2})?",
    [
      plan_type(Mobile, "342\\d{4}|(?:337|49)\\d{6}|(?:3(?:2|47|7\\d{3})|5(?:0\\d{3}|2[0-2]))\\d{7}", [7, 8, 9, 10, 12], []),
      plan_type(Voip, "1(?:3(?:0[0347]|[13][0139]|2[035]|4[013568]|6[0459]|7[06]|8[15-8]|9[0689])\\d{4}|6\\d{5,10})|(?:345\\d|9[89])\\d{6}|(?:10|2(?:3|85\\d)|3(?:[15]|[69]\\d\\d)|4[15-8]|51)\\d{8}", [7, 8, 9, 10, 11, 12], []),
      plan_type(Voicemail, "348[57]\\d{7}", [11], []),
    ],
  ),
  plan_non_geo(
    883,
    "(?:[1-4]\\d|51)\\d{6,10}",
    [
      plan_type(Voip, "(?:2(?:00\\d\\d|10)|(?:370[1-9]|51\\d0)\\d)\\d{7}|51(?:00\\d{5}|[24-9]0\\d{4,7})|(?:1[0-79]|2[24-689]|3[02-689]|4[0-4])0\\d{5,9}", [8, 9, 10, 11, 12], []),
    ],
  ),
  plan_non_geo(
    888,
    "\\d{11}",
    [
      plan_type(Uan, "\\d{11}", [11], []),
    ],
  ),
  plan_non_geo(
    979,
    "[1359]\\d{8}",
    [
      plan_type(PremiumRate, "[1359]\\d{8}", [9], []),
    ],
  ),
]

///|
/// The network that uses a calling code, or None.
fn find_non_geo(cc : Int) -> NonGeoPlan? {
  for p in non_geo_plans {
    if p.calling_code == cc {
      return Some(p)
    }
  }
  None
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
