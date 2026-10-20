// Numbering-plan metadata: one row per region, describing how to dial into and
// out of it, which number types it defines, and the rule each type follows.
//
// The table itself is generated (`plan_data.mbt`, from
// `data/numbering-plans.json` by `scripts/gen-metadata.mjs`) out of Google's
// libphonenumber metadata (Apache-2.0). Nothing here is hand-maintained data:
// this file is the lookup and expansion layer over the generated table.

///|
/// One number type inside a plan: the rule a national number must match, and the
/// lengths the plan publishes for that type.
///
/// `national` is the set of possible lengths; `local_only` is the set of lengths
/// that are only possible when dialled locally (kept for completeness and for
/// the data-integrity tests, not used for `possible`).
priv struct PlanType {
  kind : NumberType
  pattern : String
  national : Array[Int]
  local_only : Array[Int]
}

///|
/// One formatting rule: how a national number of a given shape is split into
/// groups, and what goes between them.
///
/// `pattern` is a sequence of capture groups over digit runs (`(\d{3})(\d{4})`);
/// `format` refers to them as `$1`..`$9`. `leading` holds the plan's published
/// leading-digit patterns for selecting the rule; the last one is the most
/// specific and is the one that decides. `intl_format` overrides `format` when
/// the number is rendered internationally (`"NA"` means the plan has no
/// international rendering). `prefix_rule` is the plan's national-prefix rule,
/// written with `$NP` (the trunk prefix) and `$FG` (the formatted number), and
/// `prefix_optional` says the prefix may be left out.
priv struct PhoneFormat {
  pattern : String
  leading : Array[String]
  format : String
  intl_format : String
  prefix_rule : String
}

///|
/// One formatting row, used only by the generated table.
fn plan_format(
  pattern : String,
  leading : Array[String],
  format : String,
  intl_format : String,
  prefix_rule : String,
) -> PhoneFormat {
  { pattern, leading, format, intl_format, prefix_rule }
}

///|
/// A numbering plan.
///
/// `idd` is the prefix dialled to reach another country from inside this one.
/// `national_prefix` is the trunk prefix dialled before a national number; it is
/// empty for plans that have none. `general` is the plan's overall rule, and
/// `types` are the per-type rules. `primary` marks the region a bare calling
/// code resolves to when several regions share it.
priv struct Region {
  code : String
  name : String
  calling_code : Int
  idd : String
  national_prefix : String
  /// The published pattern that recognises a trunk prefix while parsing; empty
  /// when the plan only publishes the plain prefix.
  prefix_parsing : String
  primary : Bool
  general : String
  types : Array[PlanType]
  formats : Array[PhoneFormat]
}

///|
/// One type row. Keeping this a function keeps the generated table to one line
/// per type and lets the field order read in the order the data is published.
fn plan_type(
  kind : NumberType,
  pattern : String,
  national : Array[Int],
  local_only : Array[Int],
) -> PlanType {
  { kind, pattern, national, local_only }
}

///|
/// One region row, used only by the generated table.
fn plan_row(
  code : String,
  name : String,
  calling_code : Int,
  idd : String,
  national_prefix : String,
  prefix_parsing : String,
  primary : Bool,
  general : String,
  types : Array[PlanType],
  formats : Array[PhoneFormat],
) -> Region {
  {
    code,
    name,
    calling_code,
    idd,
    national_prefix,
    prefix_parsing,
    primary,
    general,
    types,
    formats,
  }
}

///|
/// Uppercase a region code so lookups are case-insensitive.
fn normalize_code(code : String) -> String {
  let buf = StringBuilder()
  for c in code {
    buf.write_char(upper_ascii(c))
  }
  buf.to_string()
}

///|
/// Look a region up by its ISO 3166-1 alpha-2 code, case-insensitively.
fn find_region(code : String) -> Region? {
  let want = normalize_code(code)
  for r in regions {
    if r.code == want {
      return Some(r)
    }
  }
  None
}

///|
/// Every national-number length any type in the region uses, sorted, without
/// repeats.
fn lengths_of(r : Region) -> Array[Int] {
  let out : Array[Int] = []
  for t in r.types {
    for n in t.national {
      push_unique_sorted(out, n)
    }
  }
  out
}

///|
/// Insert `v` into a sorted, unique array, keeping it sorted.
fn push_unique_sorted(a : Array[Int], v : Int) -> Unit {
  let mut i = 0
  while i < a.length() && a[i] < v {
    i = i + 1
  }
  if i < a.length() && a[i] == v {
    return
  }
  a.insert(i, v)
}

///|
/// The number types whose length rule admits an `n`-digit national number.
fn types_for_length(r : Region, n : Int) -> Array[NumberType] {
  let out : Array[NumberType] = []
  for t in r.types {
    if t.national.contains(n) {
      out.push(t.kind)
    }
  }
  out
}

///|
/// The type whose rule the national number matches, in the precedence order
/// libphonenumber uses: the special ranges win over the geographic ones, a
/// number that fits both fixed-line and mobile is reported as the shared type,
/// and a number outside the plan's general rule has no type at all.
fn type_of_national_number(r : Region, national_number : String) -> NumberType? {
  if !matches_pattern(r.general, national_number) {
    return None
  }
  for t in r.types {
    if t.kind != FixedLine && t.kind != Mobile && matches_pattern(t.pattern, national_number) {
      return Some(t.kind)
    }
  }
  let fixed = fits(r, FixedLine, national_number)
  let mobile = fits(r, Mobile, national_number)
  if fixed && mobile {
    return Some(FixedLineOrMobile)
  }
  if fixed {
    return Some(FixedLine)
  }
  if mobile {
    return Some(Mobile)
  }
  None
}

///|
/// True when the region publishes a rule of this type and the number matches it.
fn fits(r : Region, kind : NumberType, national_number : String) -> Bool {
  for t in r.types {
    if t.kind == kind && matches_pattern(t.pattern, national_number) {
      return true
    }
  }
  false
}

///|
/// The formatting rules that apply to a region. A territory that shares a
/// calling code and publishes no rules of its own (Canada, Puerto Rico and the
/// other NANP territories under `+1`) inherits the primary region's rules,
/// which is what the upstream metadata means by leaving them out.
fn formats_of(r : Region) -> Array[PhoneFormat] {
  if r.formats.length() > 0 {
    return r.formats
  }
  for other in regions {
    if other.calling_code == r.calling_code && other.primary {
      return other.formats
    }
  }
  []
}

///|
/// True when the number matches any published rule of the region. This is the
/// pattern-level test behind `is_valid`; the caller has already established that
/// the calling codes agree.
fn region_admits(r : Region, national_number : String) -> Bool {
  for t in r.types {
    if matches_pattern(t.pattern, national_number) {
      return true
    }
  }
  false
}

// ---------------------------------------------------------------------------
// Public lookups
// ---------------------------------------------------------------------------

///|
/// Every region code in the table, sorted.
pub fn region_codes() -> Array[String] {
  let out : Array[String] = []
  for r in regions {
    out.push(r.code)
  }
  out
}

///|
/// True when the region code is one the table knows.
pub fn region_exists(code : String) -> Bool {
  find_region(code) is Some(_)
}

///|
/// The table's own spelling of a region code, or None when it is not known.
/// Useful for echoing a user-supplied code in a canonical form.
pub fn canonical_region_code(code : String) -> String? {
  match find_region(code) {
    Some(r) => Some(r.code)
    None => None
  }
}

///|
/// The English name of a region, e.g. `"Japan"`.
pub fn region_name(code : String) -> String? {
  match find_region(code) {
    Some(r) => Some(r.name)
    None => None
  }
}

///|
/// The E.164 calling code of a region, without a leading `+`.
pub fn calling_code(code : String) -> Int? {
  match find_region(code) {
    Some(r) => Some(r.calling_code)
    None => None
  }
}

///|
/// The international dial-out prefix used inside a region, e.g. `"011"` for the
/// NANP or `"00"` for most of Europe.
pub fn idd_prefix(code : String) -> String? {
  match find_region(code) {
    Some(r) => Some(r.idd)
    None => None
  }
}

///|
/// The trunk prefix dialled before a national number, or None when the plan has
/// none (Italy, Spain, Portugal and others).
pub fn national_prefix(code : String) -> String? {
  match find_region(code) {
    Some(r) => if r.national_prefix == "" { None } else { Some(r.national_prefix) }
    None => None
  }
}

///|
/// The national-number lengths the region uses, sorted, without repeats.
pub fn possible_lengths(code : String) -> Array[Int]? {
  match find_region(code) {
    Some(r) => Some(lengths_of(r))
    None => None
  }
}

///|
/// The lengths a region accepts only for a number dialled locally (no trunk
/// prefix or no area code), sorted and without repeats. Empty when the plan
/// publishes none — which is most of them.
pub fn local_only_lengths(code : String) -> Array[Int]? {
  match find_region(code) {
    None => None
    Some(r) => {
      let out : Array[Int] = []
      for t in r.types {
        for n in t.local_only {
          push_unique_sorted(out, n)
        }
      }
      Some(out)
    }
  }
}

///|
/// One region that uses a calling code, or None when no region does. When
/// several share the code (the whole NANP is `+1`) the region marked primary
/// wins; otherwise the first in code order. Use `regions_by_calling_code` for
/// all of them.
pub fn region_by_calling_code(cc : Int) -> String? {
  for r in regions {
    if r.calling_code == cc && r.primary {
      return Some(r.code)
    }
  }
  for r in regions {
    if r.calling_code == cc {
      return Some(r.code)
    }
  }
  None
}

///|
/// Every region that shares a calling code, in table order.
pub fn regions_by_calling_code(cc : Int) -> Array[String] {
  let out : Array[String] = []
  for r in regions {
    if r.calling_code == cc {
      out.push(r.code)
    }
  }
  out
}

///|
/// The plan's overall rule for its national numbers, e.g. `"[2-9]\\d{9}"` for
/// the NANP. Exposed so a caller can see the rule a verdict was based on.
pub fn plan_pattern(code : String) -> String? {
  match find_region(code) {
    Some(r) => Some(r.general)
    None => None
  }
}

///|
/// The rule published for one number type in one region, if the plan has that
/// type. Lets a caller audit `is_valid` / `number_type` against the data.
pub fn type_pattern(code : String, kind : NumberType) -> String? {
  match find_region(code) {
    None => None
    Some(r) => {
      for t in r.types {
        if t.kind == kind {
          return Some(t.pattern)
        }
      }
      None
    }
  }
}
