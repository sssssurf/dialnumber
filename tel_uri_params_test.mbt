// Tests for the generic-parameter grammar of RFC 3966: a parameter this library
// does not define is parsed, kept and written back in the order the RFC asks
// for, rather than refused.

///|
test "a generic parameter is kept and sorted" {
  match @dialnumber.parse_tel_uri_full("tel:+14155550123;foo=bar;baz") {
    Some(t) => {
      assert_eq(t.parameters.length(), 2)
      assert_eq(
        @dialnumber.to_tel_uri_full(t),
        Some("tel:+14155550123;baz;foo=bar"),
      )
    }
    None => assert_true(false)
  }
  // A value that is not a `paramchar` run, or is empty, is still refused.
  for bad in [
    "tel:+14155550123;foo=",
    "tel:+14155550123;foo=ba r",
  ] {
    assert_true(@dialnumber.parse_tel_uri_full(bad) is None)
  }
}

///|
test "a local number serialises ext before the context" {
  match @dialnumber.parse_tel_uri_full("tel:555-0123;phone-context=+1-919;ext=42") {
    Some(t) =>
      assert_eq(
        @dialnumber.to_tel_uri_full(t),
        Some("tel:5550123;ext=42;phone-context=+1919"),
      )
    None => assert_true(false)
  }
}

///|
test "isub accepts the uric characters a parameter grammar swallows" {
  match @dialnumber.parse_tel_uri_full("tel:+14155550123;isub=a;b?c") {
    Some(t) => assert_eq(t.isub, "a;b?c")
    None => assert_true(false)
  }
}
