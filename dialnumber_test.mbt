// Blackbox tests: the public API, driven through the `@dialnumber` package the
// way a consumer would use it. Vectors are real numbers from the numbering
// plans' own published examples.

///|
test "parse an E.164 number" {
  match @dialnumber.parse("+81 90-1234-5678", "") {
    Some(pn) => {
      assert_eq(pn.country_code, 81)
      assert_eq(pn.national_number, "9012345678")
      assert_eq(pn.extension, "")
      assert_eq(@dialnumber.format_e164(pn), "+819012345678")
    }
    None => assert_true(false)
  }
}

///|
test "parse a national number, stripping the trunk prefix" {
  match @dialnumber.parse("090-1234-5678", "JP") {
    Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+819012345678")
    None => assert_true(false)
  }
}

///|
test "parse a national number given without its trunk prefix" {
  match @dialnumber.parse("9012345678", "JP") {
    Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+819012345678")
    None => assert_true(false)
  }
}

///|
test "parse through an international dial-out prefix" {
  // 011 is the NANP dial-out prefix; what follows is the calling code 44.
  match @dialnumber.parse("011 44 20 7946 0958", "US") {
    Some(pn) => {
      assert_eq(pn.country_code, 44)
      assert_eq(pn.national_number, "2079460958")
    }
    None => assert_true(false)
  }
}

///|
test "the dial-out prefix is not stripped when no calling code follows" {
  // "0110..." is not an international number; it stays a national one.
  match @dialnumber.parse("0110123456", "US") {
    Some(pn) => assert_eq(pn.country_code, 1)
    None => assert_true(false)
  }
}

///|
test "a leading zero is preserved where the plan needs it" {
  // Italy has no trunk prefix and Milan numbers start with a significant 0.
  match @dialnumber.parse("02 12345678", "IT") {
    Some(pn) => {
      assert_eq(pn.national_number, "0212345678")
      assert_eq(@dialnumber.format_e164(pn), "+390212345678")
    }
    None => assert_true(false)
  }
}

///|
test "digits are recovered from punctuation" {
  for written in [
    "+86 (131) 2345-6789",
    "+86.131.2345.6789",
    "+86/131/2345/6789",
  ] {
    match @dialnumber.parse(written, "") {
      Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+8613123456789")
      None => assert_true(false)
    }
  }
}

///|
test "extensions are recognised in their common spellings" {
  let expectations : Array[(String, String)] = [
    ("+14155550123x42", "42"),
    ("+14155550123#42", "42"),
    ("+14155550123 ext. 42", "42"),
    ("+14155550123 ext 42", "42"),
  ]
  for pair in expectations {
    match @dialnumber.parse(pair.0, "") {
      Some(pn) => assert_eq(pn.extension, pair.1)
      None => assert_true(false)
    }
  }
}

///|
test "an extension marker with no digits is not stripped" {
  // Nothing says "extension" about a trailing `x` on its own, so it is left in
  // place and the input is consequently unreadable rather than silently fixed.
  assert_true(@dialnumber.parse("+14155550123x", "") is None)
}

///|
test "unreadable input returns none" {
  for bad in [
    "",
    "   ",
    "+",
    "hello",
    "+1 800 FLOWERS",
    "++15551234",
    "(())",
  ] {
    assert_true(@dialnumber.parse(bad, "US") is None)
  }
}

///|
test "a calling code the table does not know is rejected" {
  assert_true(@dialnumber.parse("+999 555 0000", "") is None)
}

///|
test "parsing with no region and no plus fails" {
  assert_true(@dialnumber.parse("2015550123", "") is None)
}

///|
test "parse_e164 accepts only self-describing numbers" {
  assert_true(@dialnumber.parse_e164("+12015550123") is Some(_))
  assert_true(@dialnumber.parse_e164("2015550123") is None)
}

///|
test "format_national groups the number as the plan does" {
  match @dialnumber.parse("+819012345678", "") {
    Some(pn) => {
      assert_eq(@dialnumber.format_national(pn, "JP"), Some("090-1234-5678"))
      // Italy has no trunk prefix, so the national form starts at the area code.
      match @dialnumber.parse("+390212345678", "") {
        Some(num) => assert_eq(@dialnumber.format_national(num, "IT"), Some("02 1234 5678"))
        None => assert_true(false)
      }
    }
    None => assert_true(false)
  }
}

///|
test "format_national refuses a region with a different calling code" {
  match @dialnumber.parse("+819012345678", "") {
    Some(pn) => assert_true(@dialnumber.format_national(pn, "US") is None)
    None => assert_true(false)
  }
}

///|
test "format_rfc3966 carries the extension" {
  match @dialnumber.parse("+14155550123x42", "") {
    Some(pn) => assert_eq(@dialnumber.format_rfc3966(pn), "tel:+14155550123;ext=42")
    None => assert_true(false)
  }
}

///|
test "is_possible checks the structure and the length" {
  assert_true(@dialnumber.is_possible_number("+12015550123", ""))
  assert_false(@dialnumber.is_possible_number("+1201555012", ""))
  assert_false(@dialnumber.is_possible_number("+120155501234", ""))
  assert_false(@dialnumber.is_possible_number("+9995550000", ""))
  assert_false(@dialnumber.is_possible_number("garbage", ""))
}

///|
test "region_of_number resolves ordinary numbers" {
  let cases : Array[(String, String)] = [
    ("+8613123456789", "CN"),
    ("+442079460958", "GB"),
    ("+493012345678", "DE"),
    ("+819012345678", "JP"),
    ("+5511987654321", "BR"),
  ]
  for pair in cases {
    match @dialnumber.parse(pair.0, "") {
      Some(pn) => assert_eq(@dialnumber.region_of_number(pn), Some(pair.1))
      None => assert_true(false)
    }
  }
}

///|
test "possible_types returns the candidate set" {
  match @dialnumber.parse("+8613123456789", "") {
    Some(pn) => {
      let ts = @dialnumber.possible_types(pn)
      assert_true(ts.contains(@dialnumber.Mobile))
      assert_true(ts.contains(@dialnumber.FixedLine))
    }
    None => assert_true(false)
  }
}

///|
test "possible_types is empty for an impossible length" {
  match @dialnumber.parse("+81901234567", "") {
    // 11 digits is possible in Japan, so pick something no type admits by
    // using a country whose length set is narrow.
    Some(pn) => assert_true(@dialnumber.possible_types_in_region(pn, "DK").length() == 0)
    None => assert_true(false)
  }
}

///|
test "region table basics" {
  assert_eq(@dialnumber.region_codes().length(), 245)
  assert_true(@dialnumber.region_exists("jp"))
  assert_true(@dialnumber.region_exists("JP"))
  assert_false(@dialnumber.region_exists("ZZ"))
  assert_eq(@dialnumber.canonical_region_code("de"), Some("DE"))
}

///|
test "region lookups" {
  assert_eq(@dialnumber.calling_code("JP"), Some(81))
  assert_eq(@dialnumber.region_name("DE"), Some("Germany"))
  assert_eq(@dialnumber.idd_prefix("US"), Some("011"))
  assert_eq(@dialnumber.national_prefix("JP"), Some("0"))
  assert_eq(@dialnumber.national_prefix("IT"), None)
  assert_eq(@dialnumber.possible_lengths("DK"), Some([8]))
  assert_eq(@dialnumber.calling_code("ZZ"), None)
  assert_eq(@dialnumber.possible_lengths("ZZ"), None)
}

///|
test "calling codes map back to regions" {
  assert_eq(@dialnumber.region_by_calling_code(81), Some("JP"))
  assert_eq(@dialnumber.region_by_calling_code(1), Some("US"))
  let nanp = @dialnumber.regions_by_calling_code(1)
  assert_eq(nanp.length(), 25)
  assert_true(nanp.contains("CA"))
  assert_true(nanp.contains("US"))
  assert_eq(@dialnumber.region_by_calling_code(999), None)
}

///|
test "tel uri parsing" {
  match @dialnumber.parse_tel_uri("tel:+1-201-555-0123") {
    Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+12015550123")
    None => assert_true(false)
  }
  // Case-insensitive scheme.
  match @dialnumber.parse_tel_uri("TEL:+12015550123") {
    Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+12015550123")
    None => assert_true(false)
  }
  // Local number resolved by a +phone-context.
  match @dialnumber.parse_tel_uri("tel:555-0123;phone-context=+1-914") {
    Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+19145550123")
    None => assert_true(false)
  }
}

///|
test "tel uri rejections" {
  assert_true(@dialnumber.parse_tel_uri("http://example.com") is None)
  assert_true(@dialnumber.parse_tel_uri("tel:") is None)
  // A domain phone-context cannot be resolved to a country code here.
  assert_true(@dialnumber.parse_tel_uri("tel:5550123;phone-context=example.com") is None)
}

///|
test "a local number resolves through a numeric context" {
  match @dialnumber.parse_tel_uri_full("tel:555-0123;phone-context=+1-914") {
    Some(t) => {
      // The context is kept separate from the local digits, not merged in.
      assert_eq(t.local_number, "5550123")
      assert_eq(t.phone_context, "+1914")
      match @dialnumber.resolve_tel_uri(t) {
        Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+19145550123")
        None => assert_true(false)
      }
    }
    None => assert_true(false)
  }
}

///|
test "a domain context parses and round-trips but does not resolve" {
  match @dialnumber.parse_tel_uri_full("tel:7042;phone-context=Example.COM") {
    Some(t) => {
      assert_eq(t.local_number, "7042")
      assert_eq(t.phone_context, "example.com")
      assert_eq(
        @dialnumber.to_tel_uri_full(t),
        Some("tel:7042;phone-context=example.com"),
      )
      assert_true(@dialnumber.resolve_tel_uri(t) is None)
    }
    None => assert_true(false)
  }
}

///|
test "a local number with non-decimal digits parses but does not resolve" {
  match @dialnumber.parse_tel_uri_full("tel:*123;phone-context=+1415") {
    Some(t) => {
      assert_eq(t.local_number, "*123")
      assert_true(@dialnumber.resolve_tel_uri(t) is None)
    }
    None => assert_true(false)
  }
}

///|
test "isub is preserved opaquely" {
  match @dialnumber.parse_tel_uri_full("tel:+14155550123;isub=abc%20def") {
    Some(t) => {
      assert_eq(t.isub, "abc%20def")
      assert_eq(t.extension, "")
      match @dialnumber.resolve_tel_uri(t) {
        Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+14155550123")
        None => assert_true(false)
      }
    }
    None => assert_true(false)
  }
}

///|
test "tel uri parameters are validated, not dropped" {
  for bad in [
    "tel:5550123", // local number without a phone-context
    "tel:+12015550123;phone-context=+1", // context on a global number
    "tel:+12015550123;ext=42;isub=abc", // ext and isub are exclusive
    "tel:+12015550123;isub=abc;ext=42",
    "tel:+12015550123;ext=42;ext=43", // duplicate
    "tel:+12015550123;phone-context=+1;phone-context=+2",
    "tel:+12015550123;ext=", // empty value
    "tel:+12015550123;ext", // parameter without a value
    "tel:+1 201 555 0123", // space is not a visual separator
    "tel:+12015550123;;ext=42", // empty parameter
    "tel:;ext=42",
    "tel:+12015550123;phone-context=",
  ] {
    assert_true(@dialnumber.parse_tel_uri_full(bad) is None)
  }
}

///|
test "tel uri parse and serialise are inverses" {
  let written : Array[String] = [
    "tel:+12015550123",
    "tel:+1-201-555-0123;ext=42",
    "TEL:+44-20-7946-0958;ISUB=abc%20def",
    "tel:7042;phone-context=+1-919",
    "tel:7042;phone-context=Example.COM;ext=42",
    "tel:863-1234;phone-context=+1-914-555",
    "tel:+1-(201)-555-0123",
  ]
  for uri in written {
    match @dialnumber.parse_tel_uri_full(uri) {
      None => assert_true(false)
      Some(t) =>
        match @dialnumber.to_tel_uri_full(t) {
          None => assert_true(false)
          Some(canonical) =>
            match @dialnumber.parse_tel_uri_full(canonical) {
              Some(again) => assert_eq(again, t)
              None => assert_true(false)
            }
        }
    }
  }
}

///|
test "to_tel_uri_full refuses an incoherent struct" {
  assert_true(
    @dialnumber.to_tel_uri_full(
      @dialnumber.TelUri::{
        global_number: "",
        local_number: "",
        phone_context: "",
        extension: "",
        isub: "",
        parameters: [],
      },
    ) is None,
  )
  assert_true(
    @dialnumber.to_tel_uri_full(
      @dialnumber.TelUri::{
        global_number: "+12015550123",
        local_number: "",
        phone_context: "+1914",
        extension: "",
        isub: "",
        parameters: [],
      },
    ) is None,
  )
}

///|
test "to_tel_uri round-trips format_rfc3966" {
  match @dialnumber.parse("+12015550123x42", "") {
    Some(pn) => assert_eq(@dialnumber.to_tel_uri(pn), @dialnumber.format_rfc3966(pn))
    None => assert_true(false)
  }
}
