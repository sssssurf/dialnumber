///|
test "matching respects country codes and extension presence symmetrically" {
  let a = @dialnumber.PhoneNumber::new(1, "2015550123")
  let cases = [
    (@dialnumber.PhoneNumber::new(44, "5550123"), @dialnumber.NoMatch),
    (@dialnumber.PhoneNumber::new(0, "2015550123"), @dialnumber.NsnMatch),
    (a.with_extension("42"), @dialnumber.ShortNsnMatch),
    (@dialnumber.PhoneNumber::new(1, ""), @dialnumber.NoMatch),
    (@dialnumber.PhoneNumber::new(1, "x2015550123"), @dialnumber.NoMatch),
  ]
  for pair in cases {
    assert_eq(@dialnumber.is_number_match(a, pair.0), pair.1)
    assert_eq(@dialnumber.is_number_match(pair.0, a), pair.1)
  }
  assert_eq(
    @dialnumber.is_number_match(a.with_extension("42"), a.with_extension("43")),
    @dialnumber.NoMatch,
  )
}
