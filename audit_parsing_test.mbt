///|
test "common international dial-out patterns use the complete published rule" {
  for
    (region, input) in [
      ("BR", "00 21 44 20 7946 0958"),
      ("AU", "0011 44 20 7946 0958"),
      ("NZ", "00 44 20 7946 0958"),
      ("NZ", "0161 44 20 7946 0958"),
      ("UY", "00 44 20 7946 0958"),
      ("UY", "0130 44 20 7946 0958"),
      ("GB", "0044 02079460958"),
    ] {
    let parsed = @dialnumber.parse(input, region).unwrap()
    assert_eq(@dialnumber.format_e164(parsed), "+442079460958")
    assert_true(@dialnumber.is_valid(parsed))
  }
}

///|
test "international and domestic country-code normalization preserve valid NSNs" {
  for text in ["442079460958", "+44 (0)20 7946 0958", "+442079460958"] {
    assert_eq(
      @dialnumber.format_e164(@dialnumber.parse(text, "GB").unwrap()),
      "+442079460958",
    )
  }
  assert_eq(
    @dialnumber.format_e164(@dialnumber.parse("+39 02 36618 300", "").unwrap()),
    "+390236618300",
  )
  assert_eq(
    @dialnumber.format_e164(@dialnumber.parse("02 36618 300", "IT").unwrap()),
    "+390236618300",
  )
  let original = @dialnumber.PhoneNumber::new(44, "2079460958")
  assert_eq(
    @dialnumber.parse(@dialnumber.format_e164(original), ""),
    Some(original),
  )
}

///|
test "national and international displays retain destination preferred extension markers" {
  for
    (region, input, marker) in [
      ("GB", "020 7946 0958", " x"),
      ("US", "2015550123", " ext. "),
      ("DE", "030123456", " ext. "),
      ("PE", "+5111234567", " Anexo "),
      ("RO", "+40211234567", " int "),
      ("TW", "+886212345678", "#"),
      ("UY", "+59821234567", " int. "),
    ] {
    let base = @dialnumber.parse(input, region).unwrap()
    let p = base.with_extension("0042")
    let national = @dialnumber.format_national(p, region).unwrap()
    let international = @dialnumber.format_international(p)
    assert_eq(
      national,
      @dialnumber.format_national(base, region).unwrap() + marker + "0042",
    )
    assert_eq(
      international,
      @dialnumber.format_international(base) + marker + "0042",
    )
    assert_eq(@dialnumber.parse(national, region), Some(p))
    assert_eq(@dialnumber.parse(international, ""), Some(p))
  }
}

///|
test "public isub values cannot inject serialized URI parameters" {
  let base = @dialnumber.parse_tel_uri_full("tel:+12015550123").unwrap()
  let provided = { ..base, isub: "a;foo=b?+c", }
  let rendered = @dialnumber.to_tel_uri_full(provided).unwrap()
  assert_eq(rendered, "tel:+12015550123;isub=a%3Bfoo%3Db%3F%2Bc")
  let parsed = @dialnumber.parse_tel_uri_full(rendered).unwrap()
  assert_eq(parsed.parameters.length(), 0)
  assert_eq(parsed.isub, "a%3Bfoo%3Db%3F%2Bc")
  assert_eq(@dialnumber.to_tel_uri_full(parsed), Some(rendered))
}

///|
test "RFC formatter refuses malformed public phone fields instead of injecting parameters" {
  for
    p in [
      @dialnumber.PhoneNumber::new(1, "2015550123;ext=42"),
      @dialnumber.PhoneNumber::new(1, "2015550123").with_extension("42;m-foo=x"),
      @dialnumber.PhoneNumber::new(0, "2015550123"),
      @dialnumber.PhoneNumber::new(1, ""),
    ] {
    assert_eq(@dialnumber.format_rfc3966(p), "tel:invalid")
    assert_true(@dialnumber.parse_tel_uri(@dialnumber.to_tel_uri(p)) is None)
  }
}

///|
test "carrier-choice dialling fallback preserves the complete extension" {
  let p = @dialnumber.parse("02079460958", "GB").unwrap().with_extension("0042")
  let rendered = @dialnumber.format_dialling(p, "BR").unwrap()
  assert_eq(rendered, "+442079460958 x0042")
  assert_eq(@dialnumber.parse(rendered, ""), Some(p))
}

///|
test "unreserved escapes apply to subscriber and context without decoding delimiters" {
  let escaped = @dialnumber.parse_tel_uri_full(
    "tel:+1%32%30%31%35%35%35%30%31%32%33",
  ).unwrap()
  assert_eq(escaped.global_number, "+12015550123")
  assert_eq(
    @dialnumber.resolve_tel_uri(escaped).unwrap().national_number,
    "2015550123",
  )
  let local_uri = @dialnumber.parse_tel_uri_full(
    "tel:%37%30%34%32;phone-context=Example%2eCOM",
  ).unwrap()
  assert_eq(local_uri.local_number, "7042")
  assert_eq(local_uri.phone_context, "example.com")
  assert_true(@dialnumber.parse_tel_uri_full("tel:%2B12015550123") is None)
  assert_true(
    @dialnumber.parse_tel_uri_full("tel:+12015550123%3Bext%3D42") is None,
  )
}
