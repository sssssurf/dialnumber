// The public value types.

///|
/// The categories a numbering plan uses to tell one kind of line from another.
/// A number can fit several at once, so `valid.mbt` hands back the set that its
/// length admits rather than a single value.
pub(all) enum NumberType {
  FixedLine
  Mobile
  TollFree
  PremiumRate
  SharedCost
  Voip
  Uan
  PersonalNumber
  Pager
  Voicemail
} derive(Eq, Debug)

///|
/// `Eq` promotes both methods; name them so the promotion is stated rather than
/// implied.
pub extend NumberType with Eq::{not_equal, equal}

///|
/// `Debug` promotes `to_repr` the same way; name it too.
pub extend NumberType with @moonbitlang/core/debug.Debug::{to_repr}

///|
pub impl Show for NumberType with fn to_string(self) -> String {
  match self {
    FixedLine => "fixed-line"
    Mobile => "mobile"
    TollFree => "toll-free"
    PremiumRate => "premium-rate"
    SharedCost => "shared-cost"
    Voip => "voip"
    Uan => "uan"
    PersonalNumber => "personal-number"
    Pager => "pager"
    Voicemail => "voicemail"
  }
}

///|
/// `Show` promotes both `output` and `to_string`; name them so the promotion is
/// stated rather than implied (the compiler flags the alternative, E0079).
pub extend NumberType with Show::{output, to_string}

///|
/// A parsed number, independent of how it was written.
///
/// `country_code` is the E.164 calling code without the leading `+`.
/// `national_number` is the significant part of the number as the plan defines
/// it: a string, not an integer, because some plans (Italy for one) require a
/// leading zero that an integer would drop. `extension` is empty when the input
/// carried none.
pub(all) struct PhoneNumber {
  country_code : Int
  national_number : String
  extension : String
} derive(Eq)

///|
/// `Eq` promotes both methods; name them so the promotion is stated rather than
/// implied (the compiler flags the alternative, E0079).
pub extend PhoneNumber with Eq::{not_equal, equal}

///|
/// Build a number with no extension.
pub fn PhoneNumber::new(country_code : Int, national_number : String) -> PhoneNumber {
  { country_code, national_number, extension: "" }
}

///|
/// A copy with `extension` attached.
pub fn PhoneNumber::with_extension(
  self : PhoneNumber,
  extension : String,
) -> PhoneNumber {
  { country_code: self.country_code, national_number: self.national_number, extension }
}

///|
/// Render as the `Show` string `+<cc> <nnn>` plus ` x<ext>` when present. The
/// dialable rendering lives in `format.mbt`; this is for logs and tests.
pub impl Show for PhoneNumber with fn to_string(self : PhoneNumber) -> String {
  let base = "+" + self.country_code.to_string() + " " + self.national_number
  if self.extension == "" {
    base
  } else {
    base + " x" + self.extension
  }
}

///|
pub extend PhoneNumber with Show::{output, to_string}
