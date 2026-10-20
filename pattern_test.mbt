// Unit tests for the pattern engine: the grammar it accepts, the meaning of each
// operator, and the cases it must refuse. The engine is the piece every
// validation verdict rests on, so it is tested on its own as well as through the
// generated corpus.

///|
test "a pattern matches the whole number, never a prefix" {
  assert_true(@dialnumber.matches_pattern("[2-9]\\d{9}", "2015550123"))
  assert_false(@dialnumber.matches_pattern("[2-9]\\d{9}", "201555012"))
  assert_false(@dialnumber.matches_pattern("[2-9]\\d{9}", "20155501234"))
  assert_false(@dialnumber.matches_pattern("[2-9]\\d{8}", "2015550123"))
}

///|
test "character classes and ranges" {
  assert_true(@dialnumber.matches_pattern("[2-4679]\\d{6}", "2234567"))
  assert_true(@dialnumber.matches_pattern("[2-4679]\\d{6}", "9234567"))
  assert_false(@dialnumber.matches_pattern("[2-4679]\\d{6}", "5234567"))
  assert_true(@dialnumber.matches_pattern("[0-9]", "7"))
  assert_false(@dialnumber.matches_pattern("[0-9]", "a"))
  assert_true(@dialnumber.matches_pattern("[04]", "4"))
}

///|
test "alternation binds looser than concatenation" {
  assert_true(@dialnumber.matches_pattern("ab|cd", "ab"))
  assert_true(@dialnumber.matches_pattern("ab|cd", "cd"))
  assert_false(@dialnumber.matches_pattern("ab|cd", "abcd"))
  assert_true(@dialnumber.matches_pattern("(?:ab|cd)e", "abe"))
  assert_true(@dialnumber.matches_pattern("(?:ab|cd)e", "cde"))
  assert_false(@dialnumber.matches_pattern("(?:ab|cd)e", "ade"))
}

///|
test "quantifiers" {
  assert_true(@dialnumber.matches_pattern("\\d?", ""))
  assert_true(@dialnumber.matches_pattern("\\d?", "7"))
  assert_false(@dialnumber.matches_pattern("\\d?", "77"))
  assert_true(@dialnumber.matches_pattern("\\d+", "123"))
  assert_false(@dialnumber.matches_pattern("\\d+", ""))
  assert_true(@dialnumber.matches_pattern("\\d*", ""))
  assert_true(@dialnumber.matches_pattern("\\d{3}", "123"))
  assert_false(@dialnumber.matches_pattern("\\d{3}", "12"))
  assert_true(@dialnumber.matches_pattern("\\d{2,4}", "12"))
  assert_true(@dialnumber.matches_pattern("\\d{2,4}", "1234"))
  assert_false(@dialnumber.matches_pattern("\\d{2,4}", "12345"))
  assert_true(@dialnumber.matches_pattern("\\d{2,}", "123456"))
  assert_false(@dialnumber.matches_pattern("\\d{2,}", "1"))
}

///|
test "a quantifier applies to a group, not to its last character" {
  assert_true(@dialnumber.matches_pattern("(?:\\d{1,2}){1,3}", "1"))
  assert_true(@dialnumber.matches_pattern("(?:\\d{1,2}){1,3}", "123456"))
  assert_false(@dialnumber.matches_pattern("(?:\\d{1,2}){1,3}", "1234567"))
  assert_true(@dialnumber.matches_pattern("(?:20|21)+", "2021"))
  assert_false(@dialnumber.matches_pattern("(?:20|21)+", "2022"))
}

///|
test "the empty pattern is a real pattern" {
  assert_true(@dialnumber.matches_pattern("", ""))
  assert_false(@dialnumber.matches_pattern("", "1"))
  assert_true(@dialnumber.pattern_well_formed(""))
}

///|
test "malformed patterns are refused, not guessed at" {
  let bad : Array[String] = [
    "[",
    "[]",
    "[2-",
    "[^0]",
    "(?:",
    "(?",
    ")",
    "a{3,2}",
    "a{",
    "a{3",
    "a{x}",
    "\\",
    "\\w",
    "\\d{1,",
    "*a",
    "a**",
  ]
  for p in bad {
    assert_false(@dialnumber.pattern_well_formed(p))
    // A pattern that does not parse matches nothing, so bad data can never
    // produce a false positive.
    assert_false(@dialnumber.matches_pattern(p, "1"))
  }
  // An empty alternative is legal in this grammar, as in any regex engine: it
  // matches the empty string.
  assert_true(@dialnumber.pattern_well_formed("a|"))
  assert_true(@dialnumber.matches_pattern("a|", ""))
  assert_true(@dialnumber.matches_pattern("a|", "a"))
}

///|
test "matching is linear enough to survive long input" {
  // 4 000 digits against a ten-digit rule: the NFA walks the input once and
  // reports failure at the first character that cannot continue.
  let buf = StringBuilder()
  for i = 0; i < 4000; i = i + 1 {
    buf.write_char('9')
  }
  let long = buf.to_string()
  assert_false(@dialnumber.matches_pattern("\\d{10}", long))
  assert_true(@dialnumber.matches_pattern("\\d{4000}", long))
  // A nested repetition is the shape that makes backtracking engines explode.
  // The state-set simulation has no such failure mode.
  assert_true(@dialnumber.matches_pattern("(?:\\d{1,2}){1,14}", "12345678901234"))
  assert_false(@dialnumber.matches_pattern("(?:\\d{1,2}){1,14}", long))
}

///|
test "the engine handles the plan patterns' real shapes" {
  // A short one from the NANP and a long one with nested alternations.
  assert_true(@dialnumber.matches_pattern("[2-9]\\d{9}", "2042545000"))
  assert_true(
    @dialnumber.matches_pattern(
      "(?:2(?:04|[23]6|[48]9|5[07]|[67]3)|3(?:06|43|54|6[578]|82))\\d{7}",
      "2042545000",
    ),
  )
  assert_false(
    @dialnumber.matches_pattern(
      "(?:2(?:04|[23]6|[48]9|5[07]|[67]3)|3(?:06|43|54|6[578]|82))\\d{7}",
      "2015550123",
    ),
  )
}
