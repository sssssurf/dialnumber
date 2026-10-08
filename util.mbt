// Internal helpers shared by the parsing, validation and formatting code.
// Nothing here is part of the public API.

///|
/// True when `c` is an ASCII digit.
fn is_digit(c : Char) -> Bool {
  c >= '0' && c <= '9'
}

///|
/// Uppercase an ASCII letter. Every other character (digits, punctuation,
/// non-ASCII) is returned unchanged, so this is safe to run over any input.
fn upper_ascii(c : Char) -> Char {
  match c {
    'a' => 'A'
    'b' => 'B'
    'c' => 'C'
    'd' => 'D'
    'e' => 'E'
    'f' => 'F'
    'g' => 'G'
    'h' => 'H'
    'i' => 'I'
    'j' => 'J'
    'k' => 'K'
    'l' => 'L'
    'm' => 'M'
    'n' => 'N'
    'o' => 'O'
    'p' => 'P'
    'q' => 'Q'
    'r' => 'R'
    's' => 'S'
    't' => 'T'
    'u' => 'U'
    'v' => 'V'
    'w' => 'W'
    'x' => 'X'
    'y' => 'Y'
    'z' => 'Z'
    _ => c
  }
}

///|
/// The characters of a string, in order.
fn chars_of(s : String) -> Array[Char] {
  let out : Array[Char] = []
  for ch in s {
    out.push(ch)
  }
  out
}

///|
/// Build a string from a window of characters. Out-of-range windows clamp, so
/// the result is never longer than `len` and never panics.
fn slice(cs : Array[Char], start : Int, len : Int) -> String {
  let out : Array[Char] = []
  let mut i = if start < 0 { 0 } else { start }
  let end = if start + len > cs.length() { cs.length() } else { start + len }
  while i < end {
    out.push(cs[i])
    i = i + 1
  }
  string_of(out)
}

///|
/// Build a string from characters.
fn string_of(cs : Array[Char]) -> String {
  let buf = StringBuilder()
  for c in cs {
    buf.write_char(c)
  }
  buf.to_string()
}

///|
/// The digits of a string, in order, dropping every non-digit character.
/// Used to accept the punctuation that people habitually type in phone numbers.
fn digits_of(s : String) -> String {
  let buf = StringBuilder()
  for ch in s {
    if is_digit(ch) {
      buf.write_char(ch)
    }
  }
  buf.to_string()
}

///|
/// True when `c` is a character people commonly insert into a written number:
/// spaces, hyphens, dots, slashes and parentheses. Tabs are not included.
fn is_separator(c : Char) -> Bool {
  match c {
    ' ' | '-' | '.' | '/' | '(' | ')' => true
    _ => false
  }
}

///|
/// True when every character is a digit or a separator.
fn digits_and_separators(s : String) -> Bool {
  for c in s {
    if !is_digit(c) && !is_separator(c) {
      return false
    }
  }
  true
}

///|
/// True when `s` starts with `p`.
fn starts_with(s : String, p : String) -> Bool {
  let sc = chars_of(s)
  let pc = chars_of(p)
  if pc.length() > sc.length() {
    return false
  }
  for i = 0; i < pc.length(); i = i + 1 {
    if sc[i] != pc[i] {
      return false
    }
  }
  true
}

///|
/// True when `s` starts with `p`, ignoring ASCII case. The scheme of a URI is
/// case-insensitive, and so are the RFC 3966 parameter names.
fn starts_with_ci(s : String, p : String) -> Bool {
  let sc = chars_of(s)
  let pc = chars_of(p)
  if pc.length() > sc.length() {
    return false
  }
  for i = 0; i < pc.length(); i = i + 1 {
    if upper_ascii(sc[i]) != upper_ascii(pc[i]) {
      return false
    }
  }
  true
}

///|
/// Drop the first `n` characters of `s`. Returns None when the string is
/// shorter than that.
fn drop(s : String, n : Int) -> String? {
  let cs = chars_of(s)
  if n < 0 || n > cs.length() {
    return None
  }
  let buf = StringBuilder()
  for i = n; i < cs.length(); i = i + 1 {
    buf.write_char(cs[i])
  }
  Some(buf.to_string())
}

///|
/// The first `n` characters of `s`. Returns None when the string is shorter.
fn take(s : String, n : Int) -> String? {
  let cs = chars_of(s)
  if n < 0 || n > cs.length() {
    return None
  }
  let buf = StringBuilder()
  for i = 0; i < n; i = i + 1 {
    buf.write_char(cs[i])
  }
  Some(buf.to_string())
}

///|
/// Parse a run of ASCII digits into an integer. Returns None for an empty
/// string or any non-digit, so "0" is 0 and "" is None.
fn int_of_digits(s : String) -> Int? {
  let cs = chars_of(s)
  if cs.length() == 0 {
    return None
  }
  let mut v = 0
  for c in cs {
    if !is_digit(c) {
      return None
    }
    v = v * 10 + (c.to_int() - '0'.to_int())
  }
  Some(v)
}

///|
/// Strip leading and trailing spaces, tabs and newlines.
fn trim(s : String) -> String {
  let cs = chars_of(s)
  let mut start = 0
  let mut end = cs.length()
  while start < end && is_space(cs[start]) {
    start = start + 1
  }
  while end > start && is_space(cs[end - 1]) {
    end = end - 1
  }
  let buf = StringBuilder()
  for i = start; i < end; i = i + 1 {
    buf.write_char(cs[i])
  }
  buf.to_string()
}

///|
/// True for the whitespace characters `trim` removes.
fn is_space(c : Char) -> Bool {
  match c {
    ' ' | '\t' | '\n' | '\r' => true
    _ => false
  }
}

///|
/// Index of the first occurrence of `sub` in `s`, or None.
fn index_of_sub(s : String, sub : String) -> Int? {
  let sc = chars_of(s)
  let pc = chars_of(sub)
  if pc.length() == 0 || pc.length() > sc.length() {
    return None
  }
  for i = 0; i + pc.length() <= sc.length(); i = i + 1 {
    let mut ok = true
    for j = 0; j < pc.length(); j = j + 1 {
      if sc[i + j] != pc[j] {
        ok = false
      }
    }
    if ok {
      return Some(i)
    }
  }
  None
}

///|
/// Split a string on a separator character. Empty fields are kept, so
/// `split_on("a,b", ',')` is `["a", "b"]` and `split_on("a,,b", ',')` has an
/// empty middle field.
fn split_on(s : String, sep : Char) -> Array[String] {
  let cs = chars_of(s)
  let out : Array[String] = []
  let mut start = 0
  for i = 0; i <= cs.length(); i = i + 1 {
    if i == cs.length() || cs[i] == sep {
      let buf = StringBuilder()
      for j = start; j < i; j = j + 1 {
        buf.write_char(cs[j])
      }
      out.push(buf.to_string())
      start = i + 1
    }
  }
  out
}

