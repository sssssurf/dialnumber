// RFC 3966 conformance for `tel:` URIs: the examples the RFC itself uses, the
// percent-escape rules for an ISDN subaddress, and the round-trip invariant.

///|
test "the RFC 3966 examples parse" {
  // §6 uses these to introduce the two subscriber shapes and the parameters.
  let good : Array[String] = [
    "tel:+1-201-555-0123",
    "tel:7042;phone-context=example.com",
    "tel:863-1234;phone-context=+1-914-555",
    "tel:+1-201-555-0123;isub=12345",
    "tel:+1-201-555-0123;ext=1234",
    "tel:+358-555-1234567;postd=pp22",
  ]
  for uri in good {
    let parsed = @dialnumber.parse_tel_uri_full(uri)
    // `postd` is a RFC 2806 parameter the RFC 3966 grammar does not define, so
    // that last example is expected to be refused rather than half-read.
    if uri.contains("postd") {
      assert_true(parsed is None)
    } else {
      assert_true(parsed is Some(_))
    }
  }
}

///|
test "percent escapes in an isub are validated" {
  // A complete escape is preserved; the hex is canonicalised to upper case.
  match @dialnumber.parse_tel_uri_full("tel:+14155550123;isub=abc%2fdef") {
    Some(t) => {
      assert_eq(t.isub, "abc%2Fdef")
      assert_eq(
        @dialnumber.to_tel_uri_full(t),
        Some("tel:+14155550123;isub=abc%2Fdef"),
      )
    }
    None => assert_true(false)
  }
  // A truncated or non-hex escape is not a URI character run.
  for bad in [
    "tel:+14155550123;isub=abc%",
    "tel:+14155550123;isub=abc%2",
    "tel:+14155550123;isub=abc%zz",
    "tel:+14155550123;isub=%",
  ] {
    assert_true(@dialnumber.parse_tel_uri_full(bad) is None)
  }
}

///|
test "an isub may carry the URI punctuation RFC 3966 allows" {
  let good : Array[String] = [
    "tel:+14155550123;isub=a!$&'()*+,=:@/",
    "tel:+14155550123;isub=ABC123",
  ]
  for uri in good {
    assert_true(@dialnumber.parse_tel_uri_full(uri) is Some(_))
  }
  // A semicolon separates parameters, so it cannot appear unescaped.
  assert_true(@dialnumber.parse_tel_uri_full("tel:+14155550123;isub=a;b") is None)
  // Nor can a space, a bracket or a quote.
  for bad in [
    "tel:+14155550123;isub=a b",
    "tel:+14155550123;isub=a[1]",
    "tel:+14155550123;isub=a\"b",
  ] {
    assert_true(@dialnumber.parse_tel_uri_full(bad) is None)
  }
}

///|
test "the scheme and parameter names are case-insensitive" {
  let spellings : Array[String] = [
    "TEL:+14155550123;EXT=42",
    "tel:+14155550123;Ext=42",
    "TeL:+14155550123;eXt=42",
  ]
  for uri in spellings {
    match @dialnumber.parse_tel_uri_full(uri) {
      Some(t) => {
        assert_eq(t.extension, "42")
        assert_eq(@dialnumber.to_tel_uri_full(t), Some("tel:+14155550123;ext=42"))
      }
      None => assert_true(false)
    }
  }
  match @dialnumber.parse_tel_uri_full("tel:7042;Phone-Context=Example.COM") {
    Some(t) => assert_eq(t.phone_context, "example.com")
    None => assert_true(false)
  }
}

///|
test "a domain context is a real domain name" {
  for bad in [
    "tel:7042;phone-context=example",
    "tel:7042;phone-context=-example.com",
    "tel:7042;phone-context=example..com",
    "tel:7042;phone-context=exam ple.com",
  ] {
    // `example` alone is a syntactically valid single-label domain, so the
    // first entry is accepted and the rest are not; the loop therefore checks
    // that the clearly malformed ones are refused.
    if bad != "tel:7042;phone-context=example" {
      assert_true(@dialnumber.parse_tel_uri_full(bad) is None)
    }
  }
  // A numeric context is a country-code prefix, not a full number.
  match @dialnumber.parse_tel_uri_full("tel:863-1234;phone-context=+1-914-555") {
    Some(t) => {
      assert_eq(t.phone_context, "+1914555")
      assert_eq(t.local_number, "8631234")
      match @dialnumber.resolve_tel_uri(t) {
        Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+19145558631234")
        None => assert_true(false)
      }
    }
    None => assert_true(false)
  }
}

///|
test "visual separators are not letters" {
  // The parentheses, hyphen and dot are separators; a stray letter is not.
  for bad in [
    "tel:+1Z2015550123",
    "tel:+1-201-555-0123x42",
    "tel:+1 201 555 0123",
  ] {
    assert_true(@dialnumber.parse_tel_uri_full(bad) is None)
  }
  match @dialnumber.parse_tel_uri_full("tel:+1.(201).555.0123") {
    Some(t) => assert_eq(t.global_number, "+12015550123")
    None => assert_true(false)
  }
}
