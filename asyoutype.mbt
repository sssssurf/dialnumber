// As-you-type formatting: render the digits as they arrive.
//
// A number is not typed in one go, and the grouping changes as it grows: "0"
// becomes "02", "020", "020 7", "020 79", ... The formatter keeps the national
// digits (without the trunk prefix) and re-renders them through the plan's own
// formatting rules after every keystroke, so the intermediate forms come from the
// same table the full renderings use.

///|
/// A formatter that grows one digit at a time.
pub(all) struct AsYouTypeFormatter {
  priv region : String
  priv mut digits : String
}

///|
/// Start a formatter for a region. An unknown region still consumes digits; it
/// simply has no rules to group them with.
pub fn AsYouTypeFormatter::new(region : String) -> AsYouTypeFormatter {
  { region, digits: "" }
}

///|
/// Forget what has been typed.
pub fn AsYouTypeFormatter::clear(self : AsYouTypeFormatter) -> Unit {
  self.digits = ""
}

///|
/// The rendering of the digits typed so far.
pub fn AsYouTypeFormatter::current_output(self : AsYouTypeFormatter) -> String {
  let text = self.digits
  match find_region(self.region) {
    None => text
    Some(r) =>
      if text == "" {
        ""
      } else {
        render_partial(r, text)
      }
  }
}

///|
/// Add one digit and return the new rendering. Non-digits are ignored, which is
/// what a key handler wants: the caller does not have to filter.
pub fn AsYouTypeFormatter::input_digit(
  self : AsYouTypeFormatter,
  digit : Char,
) -> String {
  if is_digit(digit) {
    self.digits = self.digits + digit.to_string()
  }
  self.current_output()
}

///|
/// Split the digits available so far over the rule's groups: complete groups take
/// their full width, the last one takes what is left.
fn distribute_prefix(groups : Array[FormatGroup], total : Int) -> Array[Int]? {
  let lens : Array[Int] = []
  let mut remaining = total
  let mut i = 0
  while i < groups.length() && remaining > 0 {
    let g = groups[i]
    let take = if remaining < g.max || g.max < 0 { remaining } else { g.max }
    if take == 0 {
      break
    }
    lens.push(take)
    remaining = remaining - take
    i = i + 1
  }
  if lens.length() == 0 {
    None
  } else {
    Some(lens)
  }
}

///|
/// Render a prefix of a national number through the first rule that fits it.
fn render_partial(r : Region, digits : String) -> String {
  let cs = chars_of(digits)
  for f in formats_of(r) {
    if !format_leading_matches(f, digits) {
      continue
    }
    let groups = match parse_format_groups(f.pattern) {
      None => continue
      Some(g) => g
    }
    let lens = match distribute_prefix(groups, cs.length()) {
      None => continue
      Some(l) => l
    }
    // A rule whose first group is wider than what has been typed has nothing to
    // group yet; leave the digits alone until it does.
    if lens.length() == 0 || lens[0] < groups[0].min {
      continue
    }
    let rule = if f.prefix_rule != "" {
      expand_prefix_rule(f.prefix_rule, r.national_prefix) + format_tail(f.format)
    } else {
      f.format
    }
    return apply_format_rule(rule, cs, lens)
  }
  if r.national_prefix == "" {
    digits
  } else {
    r.national_prefix + digits
  }
}

///|
test "as-you-type grows through the plan's rules" {
  let f = AsYouTypeFormatter::new("GB")
  let mut last = ""
  for c in "2079460958" {
    last = f.input_digit(c)
  }
  assert_eq(last, "020 7946 0958")
  f.clear()
  assert_eq(f.current_output(), "")
  // An unknown region keeps the digits without inventing a grouping.
  let g = AsYouTypeFormatter::new("ZZ")
  let mut out = ""
  for c in "12345" {
    out = g.input_digit(c)
  }
  assert_eq(out, "12345")
}
