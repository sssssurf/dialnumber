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
test "the Canadian area-code set is exposed for tooling" {
  let ca = @dialnumber.nanp_canadian_area_codes()
  assert_eq(ca.length(), 59)
  assert_true(ca.contains("204"))
  assert_true(ca.contains("905"))
  assert_true(ca.contains("600"))
  assert_true(ca.contains("622"))
  assert_true(ca.contains("633"))
  assert_false(ca.contains("201"))
  assert_false(ca.contains("800"))
}
