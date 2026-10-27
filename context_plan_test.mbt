// The numeric context supplies a numbering plan, not a prefix. These pin the two
// ends of the behaviour: the case where the plan and plain concatenation differ,
// and the case where nothing can be proven.

///|
test "a numeric context is read through its plan" {
  // Germany: the national form carries a trunk 0. Concatenating it would give
  // +49 030 123456, which passes the plan's shape rules but is a different
  // subscriber; the plan says the trunk prefix is dropped.
  match @dialnumber.parse_tel_uri_full("tel:030123456;phone-context=+49") {
    Some(t) =>
      match @dialnumber.resolve_tel_uri(t) {
        Some(pn) => assert_eq(@dialnumber.format_e164(pn), "+4930123456")
        None => assert_true(false)
      }
    None => assert_true(false)
  }
}

///|
test "a context that cannot fix the number declines" {
  // Exchange in the context, exchange in the subscriber part: no plan can place it.
  match
    @dialnumber.parse_tel_uri_full("tel:863-1234;phone-context=+1-914-555") {
    Some(t) => assert_true(@dialnumber.resolve_tel_uri(t) is None)
    None => assert_true(false)
  }
}

///|
test "an arbitrary numeric context cannot be ignored or concatenated" {
  for
    uri in [
      "tel:2015550123;phone-context=+1-914-555", "tel:30123456;phone-context=+49-999",
      "tel:911;phone-context=+1", "tel:8631234;phone-context=+1", "tel:AB12;phone-context=+49",
      "tel:+12015550123;m-routing=private",
    ] {
    assert_true(@dialnumber.parse_tel_uri(uri) is None)
  }
  let uri = @dialnumber.parse_tel_uri_full("tel:5550123;phone-context=+1-914").unwrap()
  assert_eq(
    @dialnumber.format_e164(@dialnumber.resolve_tel_uri(uri).unwrap()),
    "+19145550123",
  )
}

///|
test "a supplied authority resolves a domain or PBX context explicitly" {
  let uri = @dialnumber.parse_tel_uri_full(
    "tel:7042;phone-context=example.com;ext=42",
  ).unwrap()
  assert_true(@dialnumber.resolve_tel_uri(uri) is None)
  let resolved = @dialnumber.resolve_tel_uri(uri, context_resolver=fn(
    context,
    subscriber,
  ) {
    if context == "example.com" && subscriber == "7042" {
      @dialnumber.parse_e164("+12015550123")
    } else {
      None
    }
  }).unwrap()
  assert_eq(@dialnumber.format_e164(resolved), "+12015550123")
  assert_eq(resolved.extension, "42")
}
