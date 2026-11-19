///|
test "raw parser input boundary follows the original Java reference" {
  let number = @dialnumber.PhoneNumber::new(1, "2015550123")
  assert_eq(
    @dialnumber.parse(" ".repeat(238) + "+12015550123", "US"),
    Some(number),
  )
  assert_true(@dialnumber.parse(" ".repeat(239) + "+12015550123", "US") is None)
  assert_true(
    @dialnumber.parse(" ".repeat(1000) + "+12015550123", "US") is None,
  )
}

///|
test "editing matches a fresh formatter at every remaining prefix" {
  for
    (region, input) in [
      ("GB", "02079460958"),
      ("US", "+80012345678"),
      ("US", "201555012345678"),
      ("ZZ", "+442079460958"),
    ] {
    let edited = @dialnumber.AsYouTypeFormatter::new(region)
    for c in input {
      let _ = edited.input_digit(c)
    }
    for remaining = input.length(); remaining >= 0; remaining = remaining - 1 {
      let fresh = @dialnumber.AsYouTypeFormatter::new(region)
      for c in input[0:remaining] {
        let _ = fresh.input_digit(c)
      }
      assert_eq(edited.current_output(), fresh.current_output())
      assert_eq(edited.current_output(), fresh.current_output())
      let _ = edited.remove_last_digit()
    }
    assert_eq(edited.remove_last_digit(), "")
  }
}

///|
test "typing output invalidates after editing and clear, not ignored keys" {
  let f = @dialnumber.AsYouTypeFormatter::new("GB")
  for c in "02079460958" {
    let _ = f.input_digit(c)
  }
  assert_eq(f.current_output(), "020 7946 0958")
  assert_eq(f.input_digit('a'), "020 7946 0958")
  assert_eq(f.input_digit('+'), "020 7946 0958")
  assert_eq(f.remove_last_digit(), "020 7946 095")
  assert_eq(f.input_digit('8'), "020 7946 0958")
  f.clear()
  assert_eq(f.current_output(), "")
  assert_eq(f.input_digit('+'), "+")
  assert_eq(f.remove_last_digit(), "")
}
