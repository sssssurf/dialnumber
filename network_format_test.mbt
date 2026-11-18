///|
test "non-geographic displays retain extension and need a calling code to parse" {
  let number = @dialnumber.PhoneNumber::new(800, "12345678").with_extension(
    "0042",
  )
  assert_eq(
    @dialnumber.format_international(number),
    "+800 1234 5678 ext. 0042",
  )
  assert_eq(
    @dialnumber.format_national(number, "001"),
    Some("1234 5678 ext. 0042"),
  )
  assert_eq(@dialnumber.parse("+800 1234 5678 x 0042", ""), Some(number))
  assert_true(@dialnumber.parse("1234 5678 ext. 0042", "001") is None)
  assert_eq(@dialnumber.format_national(number, "GB"), None)
}

///|
test "network incremental grouping preserves digits and completed display" {
  for
    (input, expected) in [
      ("+80012345678", "+800 1234 5678"),
      ("+80812345678", "+808 1234 5678"),
      ("+979123456789", "+979 1 2345 6789"),
    ] {
    let formatter = @dialnumber.AsYouTypeFormatter::new("US")
    let mut typed = ""
    let mut output = ""
    for char in input {
      typed = typed + char.to_string()
      output = formatter.input_digit(char)
      let digits = StringBuilder()
      for c in output {
        if c == '+' || (c >= '0' && c <= '9') {
          digits.write_char(c)
        }
      }
      assert_eq(digits.to_string(), typed)
    }
    assert_eq(output, expected)
  }
}

///|
test "network local-only possibility stays separate from validity" {
  let number = @dialnumber.PhoneNumber::new(979, "12345678")
  assert_true(@dialnumber.is_possible(number))
  assert_true(@dialnumber.is_possible_in_region(number, "001"))
  assert_eq(@dialnumber.possible_types(number), [PremiumRate])
  assert_false(@dialnumber.is_valid(number))
  assert_false(
    @dialnumber.is_possible(@dialnumber.PhoneNumber::new(979, "1234567")),
  )
}
