// Rendering a parsed number back to text.
//
// Four renderings, all built from the parsed value rather than the original
// input so they are stable no matter how the number was written:
//
//   * E.164            +8613123456789
//   * international    +86 131 2345 6789
//   * national         (020) 7946 0958 / 090-1234-5678
//   * RFC 3966         tel:+8613123456789;ext=42
//
// The two grouped renderings use the plans' own formatting rules
// (`plan_data.mbt` carries them, `data/numbering-plans.json` is where they come
// from). A rule is a sequence of capture groups over digit runs plus the text
// between them, for example `(\d{3})(\d{4})` with `$1-$2`; a number is rendered
// by the first rule whose published leading digits match and whose shape fits.
// When no rule applies the number falls back to its ungrouped form, so a plan
// without formatting data still renders.

///|
/// One capture group of a formatting rule: a digit run of at least `min` and at
/// most `max` digits, where a negative `max` means unbounded.
priv struct FormatGroup {
  min : Int
  max : Int
}

///|
/// Parse a formatting rule's pattern. The data pipeline has already restricted
/// these to a sequence of `(\d...)` groups, so a pattern outside that shape is a
/// hand-written rule and simply yields no grouping.
fn parse_format_groups(pattern : String) -> Array[FormatGroup]? {
  let cs = chars_of(pattern)
  let out : Array[FormatGroup] = []
  let mut i = 0
  while i < cs.length() {
    if cs[i] != '(' {
      return None
    }
    i = i + 1
    if i + 1 >= cs.length() || cs[i] != '\\' || cs[i + 1] != 'd' {
      return None
    }
    i = i + 2
    let mut min = 1
    let mut max = 1
    if i < cs.length() && cs[i] == '{' {
      let (lo, p) = match parse_int(cs, i + 1) {
        None => return None
        Some(v) => v
      }
      min = lo
      max = lo
      i = p
      if i < cs.length() && cs[i] == ',' {
        i = i + 1
        if i < cs.length() && cs[i] == '}' {
          max = -1
        } else {
          let (hi, p2) = match parse_int(cs, i) {
            None => return None
            Some(v) => v
          }
          max = hi
          i = p2
        }
      }
      if i >= cs.length() || cs[i] != '}' {
        return None
      }
      i = i + 1
    }
    if i >= cs.length() || cs[i] != ')' {
      return None
    }
    i = i + 1
    out.push({ min, max })
  }
  if out.length() == 0 {
    None
  } else {
    Some(out)
  }
}

///|
/// Split `total` digits over the groups, left to right and greedily, the way a
/// regex engine's greedy quantifiers would. None when the shapes cannot cover
/// the number.
fn distribute_digits(groups : Array[FormatGroup], total : Int) -> Array[Int]? {
  let mut need = 0
  for g in groups {
    need = need + g.min
  }
  if total < need {
    return None
  }
  let lens : Array[Int] = []
  let mut remaining = total
  let mut i = 0
  while i < groups.length() {
    let g = groups[i]
    let mut rest_min = 0
    let mut j = i + 1
    while j < groups.length() {
      rest_min = rest_min + groups[j].min
      j = j + 1
    }
    let avail = remaining - rest_min
    let take = if g.max < 0 {
      avail
    } else if avail > g.max {
      g.max
    } else {
      avail
    }
    if take < g.min {
      return None
    }
    lens.push(take)
    remaining = remaining - take
    i = i + 1
  }
  if remaining != 0 {
    return None
  }
  Some(lens)
}

///|
/// Replace `$1`..`$9` in `rule` with the corresponding digit groups.
fn apply_format_rule(rule : String, digits : Array[Char], lens : Array[Int]) -> String {
  let starts : Array[Int] = []
  let mut acc = 0
  for n in lens {
    starts.push(acc)
    acc = acc + n
  }
  let buf = StringBuilder()
  let cs = chars_of(rule)
  let mut i = 0
  while i < cs.length() {
    let c = cs[i]
    if c == '$' && i + 1 < cs.length() && cs[i + 1] >= '1' && cs[i + 1] <= '9' {
      let idx = cs[i + 1].to_int() - '1'.to_int()
      if idx < lens.length() && starts[idx] + lens[idx] <= digits.length() {
        let mut k = starts[idx]
        let end = starts[idx] + lens[idx]
        while k < end {
          buf.write_char(digits[k])
          k = k + 1
        }
      }
      i = i + 2
    } else {
      buf.write_char(c)
      i = i + 1
    }
  }
  buf.to_string()
}

///|
/// Expand a national-prefix rule: `$NP` becomes the plan's trunk prefix and
/// `$FG` the formatted number. Only the first group is part of the rule: the
/// published rules wrap the prefix and the leading group (`($NP$FG)` for
/// Australia, `($FG)` for Brazil), and the rest of the format follows outside
/// the wrapper.
fn expand_prefix_rule(rule : String, prefix : String) -> String {
  let cs = chars_of(rule)
  let buf = StringBuilder()
  let mut i = 0
  while i < cs.length() {
    if cs[i] == '$' && i + 2 < cs.length() {
      let a = cs[i + 1]
      let b = cs[i + 2]
      if a == 'N' && b == 'P' {
        buf.write_string(prefix)
        i = i + 3
        continue
      }
      if a == 'F' && b == 'G' {
        buf.write_string("$1")
        i = i + 3
        continue
      }
    }
    buf.write_char(cs[i])
    i = i + 1
  }
  buf.to_string()
}

///|
/// The part of a format string after its first group: `$1 $2-$3` becomes
/// ` $2-$3`. This is what gets appended to a prefix rule, whose `$FG` only
/// stands for the leading group.
fn format_tail(format : String) -> String {
  let cs = chars_of(format)
  let buf = StringBuilder()
  let mut i = 0
  let mut removed = false
  while i < cs.length() {
    if !removed && cs[i] == '$' && i + 1 < cs.length() && cs[i + 1] == '1' {
      removed = true
      i = i + 2
      continue
    }
    buf.write_char(cs[i])
    i = i + 1
  }
  buf.to_string()
}

///|
/// True when the formatting rule's published leading-digit pattern matches a
/// prefix of the number — RFC-style `lookingAt`, since the rule is about where
/// the number starts, not about the whole of it.
fn format_leading_matches(pattern : String, national_number : String) -> Bool {
  let cs = chars_of(national_number)
  let mut k = 1
  while k <= cs.length() {
    if matches_pattern(pattern, slice(cs, 0, k)) {
      return true
    }
    k = k + 1
  }
  false
}

///|
/// Render a national number through a plan's formatting rules. None when no rule
/// fits, which the callers turn into the ungrouped form.
fn render_with_formats(
  r : Region,
  national_number : String,
  international : Bool,
) -> String? {
  let digits = chars_of(national_number)
  for c in digits {
    if !is_digit(c) {
      return None
    }
  }
  for f in formats_of(r) {
    if f.leading.length() > 0 {
      // The metadata lists the same rule once per progressively longer leading
      // pattern; the last one is the most specific and is the one that decides.
      let last = f.leading[f.leading.length() - 1]
      if !format_leading_matches(last, national_number) {
        continue
      }
    }
    let groups = match parse_format_groups(f.pattern) {
      None => continue
      Some(g) => g
    }
    let lens = match distribute_digits(groups, digits.length()) {
      None => continue
      Some(l) => l
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
    } else if f.prefix_rule != "" {
      expand_prefix_rule(f.prefix_rule, r.national_prefix) + format_tail(f.format)
    } else {
      f.format
    }
    return Some(apply_format_rule(rule, digits, lens))
  }
  None
}

///|
/// The canonical E.164 rendering: `+`, the calling code, then the national
/// number, with no separators. Any extension is dropped — use `format_rfc3966`
/// when the extension must survive.
pub fn format_e164(pn : PhoneNumber) -> String {
  "+" + pn.country_code.to_string() + pn.national_number
}

///|
/// The international rendering, grouped by the plan that owns the number:
/// `+44 20 7946 0958`. Falls back to the ungrouped form when the plan publishes
/// no rule for the number's shape.
pub fn format_international(pn : PhoneNumber) -> String {
  let base = "+" + pn.country_code.to_string() + " "
  match region_of_number(pn) {
    None => base + pn.national_number
    Some(code) =>
      match find_region(code) {
        None => base + pn.national_number
        Some(r) =>
          match render_with_formats(r, pn.national_number, true) {
            None => base + pn.national_number
            Some(v) => base + v
          }
      }
  }
}

///|
/// The number as dialled inside `region`: the plan's trunk prefix and the
/// national number, grouped by the plan's own formatting rules —
/// `(201) 555-0123`, `020 7946 0958`, `090-1234-5678`. None when the region is
/// unknown or uses a different calling code than the number. A plan that
/// publishes no rule for the shape falls back to trunk prefix plus ungrouped
/// number.
pub fn format_national(pn : PhoneNumber, region : String) -> String? {
  match find_region(region) {
    None => None
    Some(r) =>
      if r.calling_code != pn.country_code {
        None
      } else {
        match render_with_formats(r, pn.national_number, false) {
          Some(v) => Some(v)
          None => Some(r.national_prefix + pn.national_number)
        }
      }
  }
}

///|
/// The RFC 3966 `tel:` URI. The extension, when present, becomes `;ext=`. The
/// subscriber is the ungrouped E.164 number, as the grammar expects.
pub fn format_rfc3966(pn : PhoneNumber) -> String {
  let base = "tel:" + format_e164(pn)
  if pn.extension == "" {
    base
  } else {
    base + ";ext=" + pn.extension
  }
}
