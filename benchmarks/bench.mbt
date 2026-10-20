// Benchmarks for the hot paths.
//
// Run them with:
//   moon bench bench
//
// The numbers are not a promise about any particular machine; they are there to
// catch a regression of the order of magnitude, and to show where the work goes:
// parsing is string work, validation is pattern work, formatting is table work.

///|
let us_number : @dialnumber.PhoneNumber = @dialnumber.PhoneNumber::new(1, "2015550123")

///|
let gb_number : @dialnumber.PhoneNumber = @dialnumber.PhoneNumber::new(44, "2079460958")

///|
let gb_rule : String = "(?:2(?:0[3-9]|1[0-9]|2[0-9]|3[0-9]|4[0-9]|5[0-9])|3(?:0[0-9]|1[0-9]))\\d{7}"

///|
test "bench: parse an E.164 number" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.parse("+12015550123", "")) })
}

///|
test "bench: parse a national number" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.parse("090-1234-5678", "JP")) })
}

///|
test "bench: parse a tel: URI" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.parse_tel_uri("tel:+12015550123;ext=42")) })
}

///|
test "bench: is_possible" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.is_possible(us_number)) })
}

///|
test "bench: is_valid on a NANP number" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.is_valid(us_number)) })
}

///|
test "bench: is_valid on a single-plan number" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.is_valid(gb_number)) })
}

///|
test "bench: number_type" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.number_type(us_number)) })
}

///|
test "bench: region_of_number" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.region_of_number(us_number)) })
}

///|
test "bench: format_e164" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.format_e164(us_number)) })
}

///|
test "bench: format_international" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.format_international(us_number)) })
}

///|
test "bench: format_national" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.format_national(us_number, "US")) })
}

///|
test "bench: matches_pattern on a plan rule" (it : @bench.T) {
  it.bench(fn() { it.keep(@dialnumber.matches_pattern(gb_rule, "2079460958")) })
}
