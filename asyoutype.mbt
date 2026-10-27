// As-you-type formatting: render the digits as they arrive.
//
// A number is not typed in one go, and the grouping changes as it grows: "0"
// becomes "02", "020", "020 7", "020 79", ... The formatter keeps exactly the
// digits entered, interprets a supplied trunk prefix and uses the plan's own
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
  { region, digits: "", }
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
  if starts_with(text, "+") {
    let body = digits_of(text)
    let cc = match country_code_prefix(body) {
      None => return text
      Some(cc) => cc
    }
    let nsn = match drop(body, cc.to_string().length()) {
      None => return text
      Some(s) => s
    }
    if nsn == "" {
      return text
    }
    let region = match region_by_calling_code(cc) {
      None => return "+" + cc.to_string() + " " + nsn
      Some(code) => code
    }
    return match find_region(region) {
      None => text
      Some(r) =>
        "+" + cc.to_string() + " " + render_partial(r, nsn, false, true)
    }
  }
  match find_region(self.region) {
    None => text
    Some(r) =>
      if text == "" {
        ""
      } else {
        let prefix = r.national_prefix
        if prefix != "" && starts_with(text, prefix) {
          let rest = match drop(text, prefix.length()) {
            Some(s) => s
            None => ""
          }
          if rest == "" {
            text
          } else if r.calling_code == 1 {
            prefix + " " + render_partial(r, rest, false, false)
          } else {
            render_partial(r, rest, true, false)
          }
        } else if prefix != "" && r.calling_code != 1 {
          // Do not fabricate a trunk prefix the user has not typed.
          text
        } else {
          render_partial(r, text, false, false)
        }
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
  if is_digit(digit) || (digit == '+' && self.digits == "") {
    self.digits = self.digits + digit.to_string()
  }
  self.current_output()
}

///|
/// Split the digits available so far over the rule's groups: complete groups take
/// their full width, the last one takes what is left.
fn distribute_prefix(
  groups : Array[FormatGroup],
  total : Int32,
) -> Array[Int32]? {
  let lens : Array[Int32] = []
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
  if lens.length() == 0 || remaining != 0 {
    None
  } else {
    Some(lens)
  }
}

///|
/// Render a prefix of a national number through the first rule that fits it.
fn render_partial(
  r : Region,
  digits : String,
  trunk : Bool,
  international : Bool,
) -> String {
  let cs = chars_of(digits)
  for f in formats_of(r) {
    // Local-only NANP rules must not compete with the complete-number
    // template, otherwise the layout switches at seven digits.
    if r.calling_code == 1 && f.intl_format == "NA" {
      continue
    }
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
    let rule = if international {
      if f.intl_format == "NA" {
        continue
      }
      if f.intl_format != "" {
        f.intl_format
      } else {
        f.format
      }
    } else if trunk && f.prefix_rule != "" {
      expand_prefix_rule(f.prefix_rule, r.national_prefix) +
      format_tail(f.format)
    } else {
      f.format
    }
    let rendered = apply_partial_format(rule, cs, lens)
    let expected = if trunk { r.national_prefix + digits } else { digits }
    // A partial rule must preserve every typed digit, including on overflow.
    if digits_of(rendered) == expected {
      return rendered
    }
  }
  if trunk {
    r.national_prefix + digits
  } else {
    digits
  }
}

///|
/// Stop before separators belonging to a group that has not been entered yet.
fn apply_partial_format(
  rule : String,
  digits : Array[Char],
  lens : Array[Int32],
) -> String {
  let cs = chars_of(rule)
  let mut end = cs.length()
  let mut i = 0
  while i + 1 < cs.length() {
    if cs[i] == '$' &&
      cs[i + 1] >= '1' &&
      cs[i + 1] <= '9' &&
      cs[i + 1].to_int() - '1'.to_int() >= lens.length() {
      end = i
      break
    }
    i = i + 1
  }
  while end > 0 &&
        (cs[end - 1] == ' ' || cs[end - 1] == '-' || cs[end - 1] == '.') {
    end = end - 1
  }
  apply_format_rule(slice(cs, 0, end), digits, lens)
}

///|
test "as-you-type grows through the plan's rules" {
  let f = AsYouTypeFormatter::new("GB")
  let mut last = ""
  for c in "02079460958" {
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
