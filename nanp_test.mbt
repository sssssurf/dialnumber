// Blackbox tests for the North American Numbering Plan: the structural rules
// and the area-code split between the United States and Canada.

///|
test "is_possible_in_region splits +1 by area code" {
  match @dialnumber.parse("+12015550123", "") {
    Some(pn) => {
      assert_true(@dialnumber.is_possible_in_region(pn, "US"))
      // 201 is a US area code, so the number is not possible in Canada even
      // though both regions share +1 and the length.
      assert_false(@dialnumber.is_possible_in_region(pn, "CA"))
      assert_false(@dialnumber.is_possible_in_region(pn, "JP"))
    }
    None => assert_true(false)
  }
  match @dialnumber.parse("+12042545000", "") {
    Some(pn) => {
      assert_true(@dialnumber.is_possible_in_region(pn, "CA"))
      assert_false(@dialnumber.is_possible_in_region(pn, "US"))
    }
    None => assert_true(false)
  }
}

///|
test "region_of_number splits +1 by area code" {
  // 201 is New Jersey; 204 is Manitoba. Same calling code, different country.
  match @dialnumber.parse("+12015550123", "") {
    Some(pn) => assert_eq(@dialnumber.region_of_number(pn), Some("US"))
    None => assert_true(false)
  }
  match @dialnumber.parse("+12042545000", "") {
    Some(pn) => assert_eq(@dialnumber.region_of_number(pn), Some("CA"))
    None => assert_true(false)
  }
  // 600 is a non-geographic Canadian code (satellite services).
  match @dialnumber.parse("+16002012345", "") {
    Some(pn) => assert_eq(@dialnumber.region_of_number(pn), Some("CA"))
    None => assert_true(false)
  }
}

///|
test "the NANP structural rule rejects impossible +1 numbers" {
  for bad in [
    "+11235550123", // NPA starts with 1
    "+10115550123", // NPA starts with 0
    "+12115550123", // 211 is an N11 service code
    "+12011550123", // NXX starts with 1
    "+1201555012",  // nine-digit national number
    "+13101234",    // seven-digit number: Canada's local-only length is not E.164
  ] {
    match @dialnumber.parse(bad, "") {
      Some(pn) => {
        assert_false(@dialnumber.is_possible(pn))
        assert_true(@dialnumber.region_of_number(pn) is None)
        assert_eq(@dialnumber.possible_types(pn).length(), 0)
      }
      None => assert_true(false)
    }
  }
  assert_true(@dialnumber.nanp_possible("2015550123"))
  assert_true(@dialnumber.nanp_possible("2042545000"))
  // 555 is structurally valid; only 555-0100..0199 are reserved for fiction.
  assert_true(@dialnumber.nanp_possible("2015550199"))
  assert_false(@dialnumber.nanp_possible("2011550123"))
  assert_false(@dialnumber.nanp_possible("201555012"))
  assert_false(@dialnumber.nanp_possible("20155501234"))
  assert_false(@dialnumber.nanp_possible("201-555-0123"))
}

///|
test "nanp_region_of classifies by area code" {
  assert_eq(@dialnumber.nanp_region_of("2042545000"), Some("CA"))
  assert_eq(@dialnumber.nanp_region_of("2015550123"), Some("US"))
  assert_eq(@dialnumber.nanp_region_of("1115550123"), None)
}

///|
test "the NANP territories are enumerated from the plans" {
  let nanp = @dialnumber.nanp_region_codes()
  assert_eq(nanp.length(), 25)
  for code in ["US", "CA", "PR", "JM", "AG", "AI", "AS", "BB", "BM", "BS", "DM",
    "DO", "GD", "GU", "KN", "KY", "LC", "MP", "MS", "SX", "TC", "TT", "VC",
    "VG", "VI"] {
    assert_true(nanp.contains(code))
  }
}

///|
test "an area code is the first three digits of a NANP number" {
  assert_eq(@dialnumber.nanp_area_code("2042545000"), Some("204"))
  assert_eq(@dialnumber.nanp_area_code("2015550123"), Some("201"))
  assert_eq(@dialnumber.nanp_area_code("201555012"), None)
  assert_eq(@dialnumber.nanp_area_code("201-555-0123"), None)
}

///|
test "every NANP territory is resolved by its own allocation" {
  // One real example per territory, taken from the plans' published examples.
  let cases : Array[(String, String)] = [
    ("2015550123", "US"),
    ("2042545000", "CA"),
    ("7872345678", "PR"),
    ("8765230123", "JM"),
    ("2423456789", "BS"),
    ("2684601234", "AG"),
    ("2642350123", "AI"),
    ("6846221234", "AS"),
    ("2464123456", "BB"),
    ("4412345678", "BM"),
    ("7672451234", "DM"),
    ("8092345678", "DO"),
    ("4734031234", "GD"),
    ("6713001234", "GU"),
    ("8692361234", "KN"),
    ("3452221234", "KY"),
    ("7582841234", "LC"),
    ("6702341234", "MP"),
    ("6644911234", "MS"),
    ("7215421234", "SX"),
    ("6492311234", "TC"),
    ("8682211234", "TT"),
    ("7844301234", "VC"),
    ("2844421234", "VG"),
    ("3406421234", "VI"),
  ]
  for pair in cases {
    assert_eq(@dialnumber.nanp_region_of(pair.0), Some(pair.1))
  }
}
