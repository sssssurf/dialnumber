// Comparing two numbers: is this the same line as that one?
//
// libphonenumber answers this with `isNumberMatch`, and the distinction matters
// in address books: two entries can be the same line written with and without a
// country code, or one can be a fragment of the other because it was stored
// without its area code.

///|
/// How two numbers relate.
pub(all) enum NumberMatch {
  /// Calling code, national number and extension all agree.
  ExactMatch
  /// The national numbers and extensions agree; the calling codes do not.
  NsnMatch
  /// One national number is a suffix of the other: the classic "stored without
  /// the area code" case.
  ShortNsnMatch
  NoMatch
} derive(Eq, Debug)

///|
/// `Eq` promotes both methods; name them so the promotion is stated.
pub extend NumberMatch with Eq::{not_equal, equal}

///|
/// `Debug` promotes `to_repr` the same way.
pub extend NumberMatch with @moonbitlang/core/debug.Debug::{to_repr}

///|
pub impl Show for NumberMatch with fn to_string(self : NumberMatch) -> String {
  match self {
    ExactMatch => "exact"
    NsnMatch => "nsn"
    ShortNsnMatch => "short-nsn"
    NoMatch => "none"
  }
}

///|
pub extend NumberMatch with Show::{output, to_string}

///|
/// True when `short` is a proper suffix of `long`.
fn is_suffix(short : String, long : String) -> Bool {
  let s = chars_of(short)
  let l = chars_of(long)
  if s.length() == 0 || s.length() >= l.length() {
    return false
  }
  let offset = l.length() - s.length()
  let mut i = 0
  while i < s.length() {
    if s[i] != l[offset + i] {
      return false
    }
    i = i + 1
  }
  true
}

///|
/// Compare two parsed numbers, in libphonenumber's four levels.
///
/// An extension has to agree before any match is reported: two entries for the
/// same line but different extensions are different destinations.
pub fn is_number_match(a : PhoneNumber, b : PhoneNumber) -> NumberMatch {
  if a.extension != b.extension {
    return NoMatch
  }
  if a.national_number == b.national_number {
    return if a.country_code == b.country_code { ExactMatch } else { NsnMatch }
  }
  if is_suffix(a.national_number, b.national_number) ||
    is_suffix(b.national_number, a.national_number) {
    ShortNsnMatch
  } else {
    NoMatch
  }
}

///|
test "number matching" {
  let a = PhoneNumber::new(1, "2015550123")
  assert_eq(is_number_match(a, PhoneNumber::new(1, "2015550123")), ExactMatch)
  assert_eq(is_number_match(a, PhoneNumber::new(44, "2015550123")), NsnMatch)
  assert_eq(is_number_match(a, PhoneNumber::new(1, "5550123")), ShortNsnMatch)
  assert_eq(is_number_match(a, PhoneNumber::new(1, "2015550124")), NoMatch)
  // Different extensions are different destinations.
  assert_eq(is_number_match(a.with_extension("42"), a), NoMatch)
  assert_eq(
    is_number_match(a.with_extension("42"), PhoneNumber::new(1, "2015550123").with_extension("42")),
    ExactMatch,
  )
}
