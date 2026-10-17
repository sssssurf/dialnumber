// Structure of the North American Numbering Plan, and the +1 split between the
// United States and Canada.
//
// Every other plan in the table is only known by its lengths, but the NANP is
// one plan whose shape is published and simple:
//
//   NPA-NXX-XXXX
//
// where NPA is the area code, NXX the central-office code, and in both the
// first digit is 2..9. Codes of the form N11 are service codes, never area
// codes. A number that satisfies those rules *could* be assigned; whether a
// particular line is assigned still needs the per-NPA exchange data, which this
// library does not carry.
//
// The other half of the problem is which country a +1 number belongs to. The
// area code decides: Canada holds a known, small set of NPAs, and the rest of
// the NANP that appears in this library's table is the United States. This is a
// US/Canada resolver, not a full NANP resolver: Caribbean NPAs, Puerto Rico,
// Guam and the shared 8YY/900 codes resolve to US, because they are not
// represented separately in the region table.
//
// Source of the Canadian set: Google's libphonenumber metadata (Apache-2.0),
// CA territory, all number types, downloaded 2026-10-16 and cross-checked with
// the Canadian Numbering Administrator's published area-code map. It lists the
// NPAs in service on that date; reserved but not yet activated codes (568, 851,
// 387, 460, 537, 638, 644, 655, 677, 688) are deliberately absent, so a number
// in one of them is not yet a possible Canadian number.

///|
/// Canadian NPAs in service on 2026-10-16, sorted. The last three — 600, 622 and
/// 633 — are non-geographic codes (satellite, personal and special services)
/// that the metadata attributes to Canada.
let canadian_area_codes : Array[String] = [
  "204", "226", "236", "249", "250", "257", "263", "273", "289", "306",
  "343", "354", "365", "367", "368", "382", "403", "416", "418", "428",
  "431", "437", "438", "450", "468", "474", "506", "514", "519", "548",
  "579", "581", "584", "587", "600", "604", "613", "622", "633", "639",
  "647", "672", "683", "705", "709", "742", "753", "778", "780", "782",
  "807", "819", "825", "867", "873", "879", "902", "905", "942",
]

///|
/// True when `npa` is a Canadian area code.
fn is_canadian_area_code(npa : String) -> Bool {
  canadian_area_codes.contains(npa)
}

///|
/// True when `c` is one of the two digits an NPA or NXX may start with.
fn is_nanp_leading_digit(c : Char) -> Bool {
  c >= '2' && c <= '9'
}

///|
/// True when a ten-digit national number has the NANP's structure: NPA and NXX
/// both start with 2..9, and the NPA is not an N11 service code.
///
/// This is structural, not assignment data. A `555` exchange is accepted because
/// it is structurally valid; only 555-0100..0199 are reserved for fiction, and
/// that distinction needs exchange data this library does not have.
pub fn nanp_possible(national_number : String) -> Bool {
  let cs = chars_of(national_number)
  if cs.length() != 10 {
    return false
  }
  for c in cs {
    if !is_digit(c) {
      return false
    }
  }
  if !is_nanp_leading_digit(cs[0]) {
    return false
  }
  if cs[1] == '1' && cs[2] == '1' {
    return false
  }
  is_nanp_leading_digit(cs[3])
}

///|
/// Resolve a structurally valid +1 national number to `"CA"` or `"US"` by its
/// area code. None when the number does not have NANP structure.
pub fn nanp_region_of(national_number : String) -> String? {
  if !nanp_possible(national_number) {
    return None
  }
  let npa = slice(chars_of(national_number), 0, 3)
  if is_canadian_area_code(npa) {
    Some("CA")
  } else {
    Some("US")
  }
}

///|
/// The Canadian area codes the resolver knows, sorted. A copy: mutating it does
/// not change the resolver.
pub fn nanp_canadian_area_codes() -> Array[String] {
  let out : Array[String] = []
  for code in canadian_area_codes {
    out.push(code)
  }
  out
}
