// Property tests: instead of one example per rule, generate numbers and check
// the invariants the library promises for every input.
//
// The generator is a small deterministic LCG, so a failure is reproducible: the
// same seed produces the same sequence, and the failing number is printed by the
// assertion that rejects it.

///|
/// 16-bit linear congruential generator: small enough that the multiplication
/// cannot overflow a 32-bit Int, and good enough to walk a number space.
fn fuzz_next(state : Int) -> Int {
  // Normalise first: the caller's seed may be any int, and the multiplication
  // below has to stay inside 32 bits.
  let base = state % 65536
  ((if base < 0 { base + 65536 } else { base }) * 25173 + 13849) % 65536
}

///|
/// A run of `n` digits, and the generator state to continue from.
fn fuzz_digits(state : Int, n : Int) -> (String, Int) {
  let digits : Array[Char] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  let buf = StringBuilder()
  let mut s = state
  let mut i = 0
  while i < n {
    s = fuzz_next(s)
    buf.write_char(digits[s % 10])
    i = i + 1
  }
  (buf.to_string(), s)
}

///|
test "property: every E.164 rendering parses back to itself" {
  let codes = @dialnumber.region_codes()
  let mut s = 7919
  let mut i = 0
  while i < 300 {
    s = fuzz_next(s)
    let code = codes[s % codes.length()]
    let cc = match @dialnumber.calling_code(code) {
      Some(v) => v
      None => 0
    }
    s = fuzz_next(s)
    let n = 4 + s % 14
    let (digits, next) = fuzz_digits(s, n)
    s = next
    let pn = @dialnumber.PhoneNumber::new(cc, digits)
    assert_eq(@dialnumber.parse(@dialnumber.format_e164(pn), ""), Some(pn))
    i = i + 1
  }
}

///|
test "property: a valid number is always possible" {
  let codes = @dialnumber.region_codes()
  let mut s = 104729
  let mut i = 0
  let mut valid_seen = 0
  while i < 600 {
    s = fuzz_next(s)
    let code = codes[s % codes.length()]
    let cc = match @dialnumber.calling_code(code) {
      Some(v) => v
      None => 0
    }
    s = fuzz_next(s)
    let n = 4 + s % 14
    let (digits, next) = fuzz_digits(s, n)
    s = next
    let pn = @dialnumber.PhoneNumber::new(cc, digits)
    if @dialnumber.is_valid(pn) {
      valid_seen = valid_seen + 1
      assert_true(@dialnumber.is_possible(pn))
    }
    i = i + 1
  }
  // The generator has to actually reach valid numbers, or the test proves
  // nothing.
  assert_true(valid_seen > 0)
}

///|
test "property: a number type is only reported for a valid number" {
  let codes = @dialnumber.region_codes()
  let mut s = 15485863
  let mut i = 0
  while i < 600 {
    s = fuzz_next(s)
    let code = codes[s % codes.length()]
    let cc = match @dialnumber.calling_code(code) {
      Some(v) => v
      None => 0
    }
    s = fuzz_next(s)
    let n = 4 + s % 14
    let (digits, next) = fuzz_digits(s, n)
    s = next
    let pn = @dialnumber.PhoneNumber::new(cc, digits)
    if @dialnumber.number_type(pn) is Some(_) {
      assert_true(@dialnumber.is_valid(pn))
    }
    i = i + 1
  }
}

///|
test "property: formatting and parsing survive arbitrary junk" {
  let pieces : Array[String] = [
    "+", "0", "1", "9", "-", " ", "(", ")", ".", "/", "x", "ext", ";", "=", "tel:",
    "é", "１", "#", "*", "a", "Z",
  ]
  let mut s = 31337
  let mut i = 0
  while i < 400 {
    s = fuzz_next(s)
    let n = 1 + s % 12
    let buf = StringBuilder()
    let mut j = 0
    while j < n {
      s = fuzz_next(s)
      buf.write_string(pieces[s % pieces.length()])
      j = j + 1
    }
    let text = buf.to_string()
    // Every entry point has to come back with a value, whatever the text is.
    let _ = @dialnumber.parse(text, "US")
    let _ = @dialnumber.parse(text, "")
    let _ = @dialnumber.parse_tel_uri_full(text)
    let _ = @dialnumber.matches_pattern(text, text)
    let _ = @dialnumber.pattern_well_formed(text)
    i = i + 1
  }
}

///|
test "property: a national rendering keeps the number it came from" {
  // Real numbers from the plans' own examples, rendered and read back.
  let samples : Array[(Int, String, String)] = [
    (1, "US", "2015550123"),
    (44, "GB", "2079460958"),
    (49, "DE", "30123456"),
    (81, "JP", "9012345678"),
    (86, "CN", "13123456789"),
    (55, "BR", "11987654321"),
  ]
  for sample in samples {
    let pn = @dialnumber.PhoneNumber::new(sample.0, sample.2)
    match @dialnumber.format_national(pn, sample.1) {
      Some(written) =>
        assert_eq(@dialnumber.parse(written, sample.1), Some(pn))
      None => assert_true(false)
    }
  }
}
