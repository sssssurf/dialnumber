///|
test "Argentina domestic mobile parsing and national output preserve destination" {
  for
    (input, expected, national) in [
      ("011 15-2345-6789", "+5491123456789", "011 15-2345-6789"),
      ("11 15-2345-6789", "+5491123456789", "011 15-2345-6789"),
      ("0343 15-555-1212", "+5493435551212", "03435 15-55-1212"),
      ("03437 15-55-1212", "+5493437551212", "03437 15-55-1212"),
    ] {
    let p = @dialnumber.parse_national(input, "AR").unwrap()
    assert_true(@dialnumber.is_valid(p))
    assert_eq(@dialnumber.format_e164(p), expected)
    assert_eq(@dialnumber.number_type(p), Some(@dialnumber.Mobile))
    assert_eq(@dialnumber.format_national(p, "AR"), Some(national))
    assert_eq(@dialnumber.parse(national, "AR"), Some(p))
  }
}

///|
test "Argentina fixed and already normalized mobile numbers are not rewritten" {
  for
    (input, expected) in [
      ("011 2345-6789", "+541123456789"),
      ("1123456789", "+541123456789"),
      ("91123456789", "+5491123456789"),
      ("+54 9 11 2345-6789", "+5491123456789"),
    ] {
    let p = @dialnumber.parse(input, "AR").unwrap()
    assert_eq(@dialnumber.format_e164(p), expected)
    assert_true(@dialnumber.is_valid(p))
  }
}

///|
test "capture rewrites support carrier removal and local area expansion" {
  for
    (region, input, expected) in [
      ("BR", "0 21 11 96123-4567", "+5511961234567"),
      ("AG", "4601234", "+12684601234"),
      ("AI", "4612345", "+12644612345"),
    ] {
    let p = @dialnumber.parse(input, region).unwrap()
    assert_eq(@dialnumber.format_e164(p), expected)
    assert_true(@dialnumber.is_valid(p))
  }
  // A significant leading zero belongs to the Italian NSN.
  assert_eq(
    @dialnumber.parse("02 36618 300", "IT").unwrap().national_number,
    "0236618300",
  )
}

///|
test "repeat counts cannot wrap into empty or unbounded matches" {
  for
    pattern in [
      "a{2147483648}", "a{4294967296}", "a{4294967297}", "a{4294967295,}", "a{1,4294967295}",
      "a{1,4294967296}", "a{999999999999999999999999999999999999999}", "a{3,2}",
      "(?:a{10000}){10000}",
    ] {
    assert_false(@dialnumber.pattern_well_formed(pattern))
    for text in ["", "a", "aa"] {
      assert_false(@dialnumber.matches_pattern(pattern, text))
    }
  }
  assert_true(@dialnumber.matches_pattern("a{0}", ""))
  assert_true(@dialnumber.matches_pattern("a{0,2}", "aa"))
  assert_false(@dialnumber.matches_pattern("a{0,2}", "aaa"))
}

///|
test "nested pattern parsing and compilation have explicit resource bounds" {
  let deep = "(".repeat(65) + "a" + ")".repeat(65)
  assert_false(@dialnumber.pattern_well_formed(deep))
  assert_false(@dialnumber.matches_pattern(deep, "a"))
  assert_false(@dialnumber.pattern_well_formed("a".repeat(8193)))
  assert_true(@dialnumber.matches_pattern("a{4000}", "a".repeat(4000)))
}

///|
test "RFC parameter names are normalized before duplicate detection and sorting" {
  for
    uri in [
      "tel:+12015550123;Foo=a;foo=b", "tel:+12015550123;FOO=a;fOo=b", "tel:+12015550123;foo=a;%66oo=b",
    ] {
    assert_true(@dialnumber.parse_tel_uri_full(uri) is None)
  }
  let t = @dialnumber.parse_tel_uri_full("tel:+12015550123;Zebra=x;Alpha=y").unwrap()
  assert_eq(t.parameters, [("alpha", "y"), ("zebra", "x")])
  assert_eq(
    @dialnumber.to_tel_uri_full(t),
    Some("tel:+12015550123;alpha=y;zebra=x"),
  )
}

///|
test "unknown mandatory RFC parameters cannot bypass resolution with uppercase or escapes" {
  for name in ["m-foo", "M-foo", "M-FOO", "%4D-%66oo"] {
    let text = "tel:+12015550123;" + name + "=bar"
    let t = @dialnumber.parse_tel_uri_full(text).unwrap()
    assert_true(@dialnumber.resolve_tel_uri(t) is None)
    assert_true(@dialnumber.parse_tel_uri(text) is None)
  }
  assert_true(@dialnumber.parse_tel_uri("tel:+12015550123;Foo=bar") is Some(_))
}

///|
test "RFC domain contexts accept a trailing root dot and reject numeric top labels" {
  for context in ["Example.COM.", "example", "a-b.example"] {
    assert_true(
      @dialnumber.parse_tel_uri_full("tel:7042;phone-context=" + context)
      is Some(_),
    )
  }
  for context in ["123", "example.123", "example..", ".", "-example.com"] {
    assert_true(
      @dialnumber.parse_tel_uri_full("tel:7042;phone-context=" + context)
      is None,
    )
  }
}

///|
test "RFC unreserved escapes normalize without turning reserved escapes into delimiters" {
  let t = @dialnumber.parse_tel_uri_full(
    "tel:+12015550123;%65xt=%34%32;%66oo=%61%3b%3d%3f",
  ).unwrap()
  assert_eq(t.extension, "42")
  assert_eq(t.parameters, [("foo", "a%3B%3D%3F")])
  assert_eq(
    @dialnumber.parse_tel_uri_full(@dialnumber.to_tel_uri_full(t).unwrap()),
    Some(t),
  )
  assert_eq(@dialnumber.resolve_tel_uri(t).unwrap().extension, "42")
  for value in ["%", "%2", "%GG", "", "x"] {
    assert_true(
      @dialnumber.parse_tel_uri_full("tel:+12015550123;ext=" + value) is None,
    )
  }
}

///|
test "publicly constructed RFC fields cannot inject or duplicate parameters" {
  let good = @dialnumber.parse_tel_uri_full("tel:+12015550123").unwrap()
  for
    bad in [
      { ..good, global_number: "+12015550123;ext=42", },
      { ..good, global_number: "12015550123", },
      { ..good, extension: "42;m-foo=x", },
      { ..good, parameters: [("foo", "a"), ("FOO", "b")], },
      { ..good, parameters: [("ext", "42")], },
      { ..good, parameters: [("phone-context", "+1")], },
      { ..good, parameters: [("foo", "a;b")], },
    ] {
    assert_true(@dialnumber.to_tel_uri_full(bad) is None)
    assert_true(@dialnumber.resolve_tel_uri(bad) is None)
  }
  assert_true(
    @dialnumber.resolve_tel_uri({ ..good, parameters: [("M-FOO", "bar")], })
    is None,
  )
}

///|
test "plain number extension syntax does not swallow additional RFC parameters" {
  for
    bad in [
      "+12015550123;ext=42;ext=43", "+12015550123;ext=42;m-foo=7", "+12015550123;ext=4x2",
      "+12015550123;ext=",
    ] {
    assert_true(@dialnumber.parse(bad, "") is None)
  }
  assert_eq(
    @dialnumber.parse("+12015550123;EXT=%34%32", "").unwrap().extension,
    "42",
  )
}
