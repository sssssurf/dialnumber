// Whitebox tests: the package-private helpers, exercised directly. These pin
// down the pieces the public API is built from, so a regression shows up here
// rather than as a confusing error one layer up.

///|
test "is_digit" {
  assert_true(is_digit('0'))
  assert_true(is_digit('9'))
  assert_false(is_digit('a'))
  assert_false(is_digit(' '))
  assert_false(is_digit('+'))
}

///|
test "upper_ascii leaves non-letters alone" {
  assert_eq(upper_ascii('a'), 'A')
  assert_eq(upper_ascii('z'), 'Z')
  assert_eq(upper_ascii('A'), 'A')
  assert_eq(upper_ascii('5'), '5')
  assert_eq(upper_ascii('-'), '-')
}

///|
test "digits_of drops everything but digits" {
  assert_eq(digits_of("+86 (131) 2345-6789"), "8613123456789")
  assert_eq(digits_of("----"), "")
  assert_eq(digits_of(""), "")
}

///|
test "starts_with is exact, starts_with_ci ignores case" {
  assert_true(starts_with("hello", "he"))
  assert_true(starts_with("hello", ""))
  assert_false(starts_with("he", "hello"))
  assert_true(starts_with_ci("TEL:+1", "tel:"))
  assert_true(starts_with_ci("Ext=5", "ext="))
  assert_false(starts_with_ci("xyz", "tel:"))
}

///|
test "drop and take return none past the end" {
  assert_eq(drop("hello", 2).unwrap(), "llo")
  assert_eq(drop("hello", 5).unwrap(), "")
  assert_true(drop("hello", 6) is None)
  assert_true(drop("hello", -1) is None)
  assert_eq(take("hello", 2).unwrap(), "he")
  assert_eq(take("hello", 0).unwrap(), "")
  assert_true(take("hello", 6) is None)
}

///|
test "int_of_digits" {
  assert_eq(int_of_digits("0").unwrap(), 0)
  assert_eq(int_of_digits("44").unwrap(), 44)
  assert_eq(int_of_digits("380").unwrap(), 380)
  assert_true(int_of_digits("") is None)
  assert_true(int_of_digits("4a") is None)
}

///|
test "trim" {
  assert_eq(trim("  hi  "), "hi")
  assert_eq(trim("\t\nhi\r\n"), "hi")
  assert_eq(trim(""), "")
  assert_eq(trim("   "), "")
  assert_eq(trim("a b"), "a b")
}

///|
test "split_on keeps empty fields" {
  let parts = split_on("a,b,c", ',')
  assert_eq(parts.length(), 3)
  assert_eq(parts[0], "a")
  assert_eq(parts[2], "c")
  let empty = split_on("a,,c", ',')
  assert_eq(empty.length(), 3)
  assert_eq(empty[1], "")
  assert_eq(split_on("", ',').length(), 1)
}

///|
test "index_of_sub" {
  assert_eq(index_of_sub("tel:+1;ext=42", ";ext=").unwrap(), 6)
  assert_true(index_of_sub("abc", "z") is None)
  assert_true(index_of_sub("abc", "") is None)
  assert_eq(index_of_sub("abc", "abc").unwrap(), 0)
}

///|
test "slice clamps to the string" {
  let cs = chars_of("hello")
  assert_eq(slice(cs, 1, 3), "ell")
  assert_eq(slice(cs, 4, 10), "o")
  assert_eq(slice(cs, 0, 0), "")
  assert_eq(slice(cs, 5, 2), "")
}

///|
test "parse_type_spec expands the compact spec" {
  let pairs = parse_type_spec("f=8 m=9|10")
  assert_eq(pairs.length(), 2)
  let first = pairs[0]
  let first_lens = first.1
  assert_eq(first.0, FixedLine)
  assert_eq(first_lens.length(), 1)
  assert_eq(first_lens[0], 8)
  let second = pairs[1]
  assert_eq(second.0, Mobile)
  assert_eq(second.1.length(), 2)
  // Malformed tokens are skipped, not fatal.
  assert_eq(parse_type_spec("").length(), 0)
  assert_eq(parse_type_spec("z=1 f=8").length(), 1)
  assert_eq(parse_type_spec("bad f=8").length(), 1)
}

///|
test "lengths_of unions the per-type lengths" {
  match find_region("BE") {
    Some(r) => assert_eq(lengths_of(r), [8, 9])
    None => assert_true(false)
  }
}

///|
test "types_for_length narrows by length" {
  match find_region("BE") {
    Some(r) => {
      assert_eq(types_for_length(r, 8).length(), 5)
      assert_eq(types_for_length(r, 9), [Mobile])
      assert_eq(types_for_length(r, 7).length(), 0)
    }
    None => assert_true(false)
  }
}

///|
test "country_code_prefix prefers the longest matching code" {
  assert_eq(country_code_prefix("819012345678").unwrap(), 81)
  assert_eq(country_code_prefix("380441234567").unwrap(), 380)
  assert_eq(country_code_prefix("12015550123").unwrap(), 1)
  assert_true(country_code_prefix("9990") is None)
}

///|
test "split_extension separates the number from its extension" {
  let cases : Array[(String, String, String)] = [
    ("+14155550123;ext=42", "+14155550123", "42"),
    ("+14155550123x42", "+14155550123", "42"),
    ("+14155550123#7", "+14155550123", "7"),
    ("+14155550123 ext. 9", "+14155550123", "9"),
    ("+14155550123", "+14155550123", ""),
    ("+14155550123x", "+14155550123x", ""),
  ]
  for c in cases {
    let parts = split_extension(c.0)
    assert_eq(parts.0, c.1)
    assert_eq(parts.1, c.2)
  }
}

///|
test "find_region is case-insensitive and rejects unknown codes" {
  assert_eq(find_region("jp").unwrap().calling_code, 81)
  assert_eq(find_region("JP").unwrap().name, "Japan")
  assert_true(find_region("ZZ") is None)
  assert_true(find_region("") is None)
}

///|
test "normalize_code uppercases" {
  assert_eq(normalize_code("de"), "DE")
  assert_eq(normalize_code("De"), "DE")
  assert_eq(normalize_code(""), "")
}
