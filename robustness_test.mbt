// Robustness: every public function is total. No input, however malformed, may
// panic — it returns None, false, or an empty collection instead. These tests
// exist to prove that claim rather than assert it in prose.

///|
test "arbitrary junk never panics" {
  let junk : Array[String] = [
    "",
    " ",
    "+",
    "+++",
    "0000",
    "----",
    "()()()",
    "／／／",
    "＋１２３４５",
    "🦀🦀",
    "0123456789",
    "ext",
    "x",
    "#",
    ";ext=",
    "tel:",
    "tel:;ext=",
    "tel:;phone-context=",
    "+1",
    "+99999999999999999999999999",
    "1234567890123456789012345678901234567890",
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
  ]
  for w in junk {
    let _ = @dialnumber.parse(w, "US")
    let _ = @dialnumber.parse(w, "")
    let _ = @dialnumber.parse(w, "JP")
    let _ = @dialnumber.parse_tel_uri(w)
    let _ = @dialnumber.is_possible_number(w, "US")
  }
}

///|
test "a very long national number is handled" {
  let buf = StringBuilder()
  for i = 0; i < 500; i = i + 1 {
    buf.write_char('9')
  }
  let long = "+1" + buf.to_string()
  match @dialnumber.parse(long, "") {
    Some(pn) => {
      assert_eq(pn.country_code, 1)
      assert_false(@dialnumber.is_possible(pn))
      assert_eq(@dialnumber.possible_types(pn).length(), 0)
      assert_true(@dialnumber.region_of_number(pn) is None)
    }
    None => assert_true(false)
  }
}

///|
test "a long run of separators between digits is fine" {
  let buf = StringBuilder()
  buf.write_string("+86")
  for i = 0; i < 200; i = i + 1 {
    buf.write_string(" - . ")
  }
  buf.write_string("13123456789")
  match @dialnumber.parse(buf.to_string(), "") {
    Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+8613123456789")
    None => assert_true(false)
  }
}

///|
test "region lookups tolerate junk" {
  for bad in ["", " ", "ZZZ", "12", "🇺🇸", "jp jp", "DEE"] {
    assert_true(@dialnumber.region_name(bad) is None)
    assert_true(@dialnumber.calling_code(bad) is None)
    assert_true(@dialnumber.idd_prefix(bad) is None)
    assert_true(@dialnumber.national_prefix(bad) is None)
    assert_true(@dialnumber.possible_lengths(bad) is None)
    assert_true(@dialnumber.canonical_region_code(bad) is None)
    assert_false(@dialnumber.region_exists(bad))
  }
  assert_eq(@dialnumber.regions_by_calling_code(-5).length(), 0)
  assert_true(@dialnumber.region_by_calling_code(-5) is None)
}

///|
test "formatting a parsed number never panics" {
  match @dialnumber.parse("+12015550123", "") {
    Some(pn) => {
      let _ = @dialnumber.format_e164(pn)
      let _ = @dialnumber.format_international(pn)
      let _ = @dialnumber.format_rfc3966(pn)
      let _ = @dialnumber.format_national(pn, "")
      let _ = @dialnumber.format_national(pn, "ZZ")
      let _ = @dialnumber.format_national(pn, "JP")
    }
    None => assert_true(false)
  }
}
