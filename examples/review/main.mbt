///|
fn main {
  let mobile = @dialnumber.parse("011 15-2345-6789", "AR").unwrap()
  println("argentina_e164: " + @dialnumber.format_e164(mobile))
  println("argentina_valid: " + @dialnumber.is_valid(mobile).to_string())
  let national = @dialnumber.format_national(mobile, "AR").unwrap()
  println("argentina_national: " + national)
  println(
    "national_roundtrip: " +
    (@dialnumber.parse(national, "AR") == Some(mobile)).to_string(),
  )
  println(
    "overflow_well_formed: " +
    @dialnumber.pattern_well_formed("a{4294967296}").to_string(),
  )
  println(
    "overflow_matches_empty: " +
    @dialnumber.matches_pattern("a{4294967296}", "").to_string(),
  )
  println(
    "uppercase_mandatory_rejected: " +
    (@dialnumber.parse_tel_uri("tel:+12015550123;M-FOO=bar") is None).to_string(),
  )
  println(
    "duplicate_parameter_rejected: " +
    (@dialnumber.parse_tel_uri_full("tel:+12015550123;Foo=a;foo=b") is None).to_string(),
  )
  let gb = @dialnumber.parse("00 21 44 20 7946 0958", "BR")
    .unwrap()
    .with_extension("0042")
  println("carrier_idd_e164: " + @dialnumber.format_e164(gb))
  println("extension_display: " + @dialnumber.format_international(gb))
  println(
    "unassigned_length_possible: " +
    @dialnumber.is_possible(@dialnumber.PhoneNumber::new(1, "1111234567")).to_string(),
  )
  println(
    "canada_local_uan_valid: " +
    @dialnumber.is_valid(@dialnumber.PhoneNumber::new(1, "3101234")).to_string(),
  )
}
