///|
fn main {
  let phone = @dialnumber.parse("020 7946 0958", "GB").unwrap()
  println("e164: " + @dialnumber.format_e164(phone))
  println("valid: " + @dialnumber.is_valid(phone).to_string())
  let network = @dialnumber.parse_e164("+80012345678").unwrap()
  println("network_region: " + @dialnumber.region_of_number(network).unwrap())
  println("network_valid: " + @dialnumber.is_valid(network).to_string())
  let a = @dialnumber.PhoneNumber::new(1, "2015550123")
  let b = @dialnumber.PhoneNumber::new(44, "2015550123")
  println(
    "different_country_match: " + @dialnumber.is_number_match(a, b).to_string(),
  )
  let formatter = @dialnumber.AsYouTypeFormatter::new("GB")
  for c in "02079460958" {
    let _ = formatter.input_digit(c)
  }
  println("as_you_type: " + formatter.current_output())
  let uri = @dialnumber.parse_tel_uri_full("tel:030123456;phone-context=+49").unwrap()
  println(
    "numeric_context: " +
    @dialnumber.format_e164(@dialnumber.resolve_tel_uri(uri).unwrap()),
  )
  let private_uri = @dialnumber.parse_tel_uri_full(
    "tel:7042;phone-context=example.com",
  ).unwrap()
  let mapped = @dialnumber.resolve_tel_uri(private_uri, context_resolver=fn(
    context,
    subscriber,
  ) {
    if context == "example.com" && subscriber == "7042" {
      @dialnumber.parse_e164("+12015550123")
    } else {
      None
    }
  }).unwrap()
  println("explicit_authority: " + @dialnumber.format_e164(mapped))
}
