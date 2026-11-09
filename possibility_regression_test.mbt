///|
test "public phone values cannot turn nondigits into possible numbers" {
  for
    (code, region, number) in [
      (44, "GB", "abcdefghij"),
      (49, "DE", "12345x7890"),
      (33, "FR", "１２３４５６７８９"),
      (800, "001", "12abc678"),
      (1, "US", ""),
      (44, "GB", "          "),
    ] {
    let pn = @dialnumber.PhoneNumber::new(code, number)
    assert_false(@dialnumber.is_possible(pn))
    assert_false(@dialnumber.is_possible_in_region(pn, region))
    assert_false(@dialnumber.is_valid(pn))
    assert_true(@dialnumber.region_of_number(pn) is None)
    assert_eq(@dialnumber.possible_types(pn).length(), 0)
    assert_eq(@dialnumber.possible_types_in_region(pn, region).length(), 0)
  }
}

///|
test "possibility never pretends to establish allocation" {
  for digits in ["1111234567", "0000000000", "5550123"] {
    let pn = @dialnumber.PhoneNumber::new(1, digits)
    assert_true(@dialnumber.is_possible(pn))
    assert_false(@dialnumber.is_valid(pn))
  }
  let local_service = @dialnumber.PhoneNumber::new(1, "3101234")
  assert_true(@dialnumber.is_possible(local_service))
  assert_true(@dialnumber.is_valid(local_service))
  assert_eq(@dialnumber.region_of_number(local_service), Some("CA"))
  assert_eq(@dialnumber.number_type(local_service), Some(@dialnumber.Uan))
}
