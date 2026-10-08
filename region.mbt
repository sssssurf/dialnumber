// Numbering-plan metadata: one row per region, describing how to dial into and
// out of it and which national-number lengths it uses.
//
// The numbers come from Google's libphonenumber metadata (Apache-2.0), which in
// turn tracks the national number plans. Only the length rules are reproduced
// here; the leading-digit patterns are not, so `possible` is a length test and
// not a proof that a line is assigned. See the README for that boundary.

///|
/// A numbering plan.
///
/// `idd` is the prefix dialled to reach another country from inside this one.
/// `national_prefix` is the trunk prefix dialled before a national number; it is
/// empty for plans (Italy, Portugal, Spain, ...) that have none. `types` is a
/// compact per-type length spec, expanded by `parse_type_spec`.
priv struct Region {
  code : String
  name : String
  calling_code : Int
  idd : String
  national_prefix : String
  types : String
  primary : Bool
}

///|
/// One table row. Keeping this a function keeps the table below to one line per
/// region and lets the field order read in the order the data is published.
fn row(
  code : String,
  name : String,
  calling_code : Int,
  idd : String,
  national_prefix : String,
  types : String,
) -> Region {
  { code, name, calling_code, idd, national_prefix, types, primary: false }
}

///|
/// A row for the region that owns a shared calling code. When several regions
/// share one code (`+1` covers both the United States and Canada here), the
/// primary region is the one a bare calling code resolves to.
fn row_primary(
  code : String,
  name : String,
  calling_code : Int,
  idd : String,
  national_prefix : String,
  types : String,
) -> Region {
  { code, name, calling_code, idd, national_prefix, types, primary: true }
}

///|
/// The whole table, sorted by region code.
let regions : Array[Region] = [
  row("AE", "United Arab Emirates", 971, "00", "0", "f=8 m=9 t=5|6|7|8|9|10|11|12 p=9 s=9 u=9"),
  row("AR", "Argentina", 54, "00", "0", "f=10 m=10|11 t=10|11 p=10 u=10"),
  row("AT", "Austria", 43, "00", "0", "f=4|5|6|7|8|9|10|11|12|13 m=7|8|9|10|11|12|13 t=9|10|11|12|13 p=9|10|11|12|13 s=8|9|10|11|12|13 v=5|6|7|8|9|10|11|12|13"),
  row("AU", "Australia", 61, "0011", "0", "f=9 m=9 t=7|10 p=10 s=6|8|10|12 v=9 g=5|6|7|8|9"),
  row("BD", "Bangladesh", 880, "00", "0", "f=6|7|8|9|10 m=10 t=10 v=10"),
  row("BE", "Belgium", 32, "00", "0", "f=8 m=9 t=8 p=8 s=8 u=8"),
  row("BR", "Brazil", 55, "00", "0", "f=10 m=10|11 t=9|10 p=9|10 s=8|10"),
  row("CA", "Canada", 1, "011", "1", "f=10 m=10 t=10 p=10 v=10 u=7 r=10"),
  row("CH", "Switzerland", 41, "00", "0", "f=9 m=9 t=9 p=9 s=9 u=9 r=9 g=9 o=12"),
  row("CL", "Chile", 56, "00", "", "f=9 m=9 t=9|11 s=10|11 v=9"),
  row("CN", "China", 86, "00", "0", "f=7|8|9|10|11 m=11 t=10|12 p=8 s=7|8|9|10|11"),
  row("CO", "Colombia", 57, "00", "0", "f=8|10 m=10 t=11 p=10|11"),
  row("CZ", "Czechia", 420, "00", "", "f=9 m=9 t=9 p=9 s=9 v=9 u=9 r=9 o=9|10|11|12"),
  row("DE", "Germany", 49, "00", "0", "f=5|6|7|8|9|10|11|12|13|14|15 m=10|11 t=10|11|12|13|14|15 p=10|11 s=7|8|9|10|11|12|13|14 u=8|9|10|11|12|13|14 r=11 g=4|5|6|7|8|9|10|11|12|13|14 o=12|13"),
  row("DK", "Denmark", 45, "00", "", "f=8 m=8 t=8 p=8"),
  row("EG", "Egypt", 20, "00", "0", "f=8|9 m=10 t=10 p=10"),
  row("ES", "Spain", 34, "00", "", "f=9 m=9 t=9 p=9 s=9 u=9 r=9"),
  row("FI", "Finland", 358, "00", "0", "f=5|6|7|8|9 m=6|7|8|9|10 t=7|8|9 p=8|9 u=5|6|7|8|9|10|11|12"),
  row("FR", "France", 33, "00", "0", "f=9 m=9 t=9 p=9 s=9 v=9 u=9"),
  row("GB", "United Kingdom", 44, "00", "0", "f=9|10 m=10 t=7|9|10 p=7|10 v=10 u=10 r=10 g=10"),
  row("GR", "Greece", 30, "00", "", "f=10 m=10 t=10|11|12 p=10 s=10 u=10 r=10"),
  row("HK", "Hong Kong", 852, "00", "", "f=8 m=8 t=9 p=5|6|7|8|11 u=8 r=8 g=8"),
  row("ID", "Indonesia", 62, "00", "0", "f=7|8|9|10|11 m=9|10|11|12 t=8|9|10|11|12|13|14|15|16|17 p=10 s=10 u=7|10"),
  row("IE", "Ireland", 353, "00", "0", "f=7|8|9|10 m=9 t=10 p=10 s=10 v=9 u=9 r=9 o=10"),
  row("IL", "Israel", 972, "00", "0", "f=8|11|12 m=9 t=7|10 p=8|10 s=10 v=9 u=10 o=11|12"),
  row("IN", "India", 91, "00", "0", "f=10 m=10 t=8|9|10|11|12|13 p=13 s=11 u=10"),
  row("IT", "Italy", 39, "00", "", "f=6|7|8|9|10|11|12 m=9|10 t=6|9 p=6|8|9|10 s=6|9 v=10 r=9|10 o=11|12"),
  row("JP", "Japan", 81, "010", "0", "f=9 m=10 t=8|9|10|11|12|13|14|15|16|17 p=9 v=10 u=9 r=9 g=10"),
  row("KE", "Kenya", 254, "000", "0", "f=7|8|9 m=9 t=9|10 p=9"),
  row("KR", "South Korea", 82, "00", "0", "f=5|6|8|9|10 m=9|10 t=9|11|12|13|14 p=9 v=10 u=8 r=10|11 g=9|10"),
  row("MX", "Mexico", 52, "00", "", "f=10 m=10 t=10 p=10 s=10 r=10"),
  row("MY", "Malaysia", 60, "00", "0", "f=8|9 m=9|10 t=10 p=10 v=10"),
  row("NG", "Nigeria", 234, "009", "0", "f=10 m=10 t=10|11|12|13|14 u=10|11|12|13|14"),
  row("NL", "Netherlands", 31, "00", "0", "f=9 m=9|11 t=7|8|9|10 p=7|8|9|10 v=9 u=5|6|9 g=9"),
  row("NO", "Norway", 47, "00", "", "f=8 m=8 t=8 p=8 s=8 v=8 u=5|8 r=8 o=8"),
  row("NZ", "New Zealand", 64, "00", "0", "f=8 m=8|9|10 t=8|9|10 p=7|8|9|10 u=5|6|7|8|9|10 r=9"),
  row("PH", "Philippines", 63, "00", "0", "f=6|8|9|10 m=10 t=11|12|13"),
  row("PK", "Pakistan", 92, "00", "0", "f=9|10 m=10 t=8|11 p=8 u=11|12 r=9"),
  row("PL", "Poland", 48, "00", "", "f=7|9 m=9 t=9|10 p=9 s=9 v=9 u=9 g=6|7|8|9"),
  row("PT", "Portugal", 351, "00", "", "f=9 m=9 t=9 p=9 s=9 v=9 u=9 r=9 g=9 o=9"),
  row("RU", "Russia", 7, "810", "8", "f=10 m=10 t=10|14 p=10 r=10"),
  row("SA", "Saudi Arabia", 966, "00", "0", "f=9 m=9 t=10 p=9 s=9"),
  row("SE", "Sweden", 46, "00", "0", "f=7|8|9 m=9 t=6|7|8|9 p=7|8|9|10 s=9 u=9 r=9 g=9 o=12"),
  row("SG", "Singapore", 65, "00", "", "f=8 m=8 t=10|11 p=11 v=8 u=11"),
  row("TH", "Thailand", 66, "00", "0", "f=8 m=9 t=10|13 p=10 v=9"),
  row("TR", "Turkey", 90, "00", "0", "f=10 m=10 t=10|12|13 p=10 v=10 u=7 r=10 g=10"),
  row("TW", "Taiwan", 886, "00", "0", "f=8|9 m=9 t=8|9 p=7|9 v=10|11 u=9 r=9"),
  row("UA", "Ukraine", 380, "00", "0", "f=9 m=9 t=9|10 p=9|10 v=9"),
  row_primary("US", "United States", 1, "011", "1", "f=10 m=10 t=10 p=10 r=10"),
  row("VN", "Vietnam", 84, "00", "0", "f=10 m=9 t=8|9|10 p=8|9|10 v=9 u=7|8"),
  row("ZA", "South Africa", 27, "00", "0", "f=9 m=5|6|7|8|9 t=9 p=9 s=9 v=9 u=9|10"),
]

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
/// The letter that stands for a number type inside a `types` spec.
fn type_of_letter(c : Char) -> NumberType? {
  match c {
    'f' => Some(FixedLine)
    'm' => Some(Mobile)
    't' => Some(TollFree)
    'p' => Some(PremiumRate)
    's' => Some(SharedCost)
    'v' => Some(Voip)
    'u' => Some(Uan)
    'r' => Some(PersonalNumber)
    'g' => Some(Pager)
    'o' => Some(Voicemail)
    _ => None
  }
}

///|
/// Expand a `types` spec such as `"f=8 m=9|10"` into `(type, lengths)` pairs.
/// Unknown letters and malformed length fields are skipped rather than rejected:
/// the spec is an internal constant.
fn parse_type_spec(spec : String) -> Array[(NumberType, Array[Int])] {
  let out : Array[(NumberType, Array[Int])] = []
  for token in split_on(spec, ' ') {
    if token == "" {
      continue
    }
    let parts = split_on(token, '=')
    if parts.length() != 2 {
      continue
    }
    let letter = chars_of(parts[0])
    if letter.length() != 1 {
      continue
    }
    let ty = match type_of_letter(letter[0]) {
      Some(t) => t
      None => continue
    }
    let lens : Array[Int] = []
    for field in split_on(parts[1], '|') {
      match int_of_digits(field) {
        Some(v) => lens.push(v)
        None => ()
      }
    }
    out.push((ty, lens))
  }
  out
}

///|
/// The `(type, lengths)` pairs of a region, expanded from its spec.
fn type_lengths(r : Region) -> Array[(NumberType, Array[Int])] {
  parse_type_spec(r.types)
}

///|
/// Every national-number length the region uses, sorted and without repeats.
fn lengths_of(r : Region) -> Array[Int] {
  let out : Array[Int] = []
  for pair in type_lengths(r) {
    for n in pair.1 {
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
  for pair in type_lengths(r) {
    if pair.1.contains(n) {
      out.push(pair.0)
    }
  }
  out
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
/// One region that uses a calling code, or None when no region does. When
/// several share the code (`+1` is both the United States and Canada here) the
/// region marked primary wins; otherwise the first in code order. Use
/// `regions_by_calling_code` for all of them.
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
