///|
test "formatting retains all typed digits through prefixes and overflow" {
  for
    pair in [
      ("GB", "02079460958"),
      ("GB", "2079460958"),
      ("US", "201555012345678"),
      ("US", "12015550123"),
      ("US", "+442079460958"),
      ("DE", "030123456"),
      ("JP", "09012345678"),
    ] {
    let f = @dialnumber.AsYouTypeFormatter::new(pair.0)
    let mut expected = ""
    for c in pair.1 {
      if c >= '0' && c <= '9' {
        expected = expected + c.to_string()
      }
      let rendered = f.input_digit(c)
      let mut actual = ""
      for d in rendered {
        if d >= '0' && d <= '9' {
          actual = actual + d.to_string()
        }
      }
      assert_eq(actual, expected)
    }
    let before = f.current_output()
    assert_eq(f.input_digit('x'), before)
    f.clear()
    assert_eq(f.current_output(), "")
  }
}
