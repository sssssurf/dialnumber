// The North American Numbering Plan, the one plan in the table whose structural
// rules are published as rules rather than as tables.
//
// The NANP is ten digits, NPA-NXX-XXXX. Both the area code (NPA) and the exchange
// (NXX) start with 2-9, and an area code of the form N11 is a service code, never
// a geographic one. Those three rules reject most of what cannot be a +1 number
// without consulting any pattern at all.
//
// Which *territory* a +1 number belongs to is a different question, and the plans
// now answer it: the +1 space covers 25 regions (US, CA and 23 Caribbean and
// Pacific territories), each with its own published area-code allocation. So
// `nanp_region_of` walks the territories' patterns instead of a hand-maintained
// list, and a new overlay code arrives with a data refresh rather than a code
// change.

///|
/// The number of digits in a NANP national number.
let nanp_length : Int = 10

///|
/// The digits of the number, or None when it is not exactly ten digits.
fn nanp_digits(national_number : String) -> Array[Char]? {
  let cs = chars_of(national_number)
  if cs.length() != nanp_length {
    return None
  }
  for c in cs {
    if !is_digit(c) {
      return None
    }
  }
  Some(cs)
}

///|
/// True for an NPA or NXX leading digit: 2 through 9.
fn nanp_leading_digit(c : Char) -> Bool {
  c >= '2' && c <= '9'
}

///|
/// True when the area code is an N11 service code (211, 311, ... 911), which is
/// never a geographic area code.
fn nanp_is_service_code(cs : Array[Char]) -> Bool {
  cs[1] == '1' && cs[2] == '1'
}

///|
/// The plan's structural rule: ten digits, an area code and an exchange that both
/// start 2-9, and no N11 area code.
///
/// A `555` exchange is structurally valid; only 555-0100..0199 is reserved for
/// fiction, which is an assignment fact and not part of the shape.
pub fn nanp_possible(national_number : String) -> Bool {
  match nanp_digits(national_number) {
    None => false
    Some(cs) =>
      nanp_leading_digit(cs[0]) &&
      !nanp_is_service_code(cs) &&
      nanp_leading_digit(cs[3])
  }
}

///|
/// The area code of a ten-digit (not necessarily possible) NANP number.
pub fn nanp_area_code(national_number : String) -> String? {
  match nanp_digits(national_number) {
    None => None
    Some(cs) => Some(slice(cs, 0, 3))
  }
}

///|
/// Every region the table places inside the NANP, in table order.
pub fn nanp_region_codes() -> Array[String] {
  let out : Array[String] = []
  for r in regions {
    if r.calling_code == 1 {
      out.push(r.code)
    }
  }
  out
}

///|
/// The territory a +1 national number belongs to.
///
/// The structural rule runs first, so a number without NANP shape has no
/// territory at all. The territories' published patterns then decide: the region
/// marked primary (the United States) wins a tie, which is what sends a toll-free
/// or shared range to US while an ordinary Canadian number resolves to CA. None
/// when the number is structurally valid but no territory's allocation claims it
/// — possible, but not assigned.
pub fn nanp_region_of(national_number : String) -> String? {
  if !nanp_possible(national_number) {
    return None
  }
  let mut fallback : String? = None
  for r in regions {
    if r.calling_code != 1 {
      continue
    }
    // The territory's leading digits answer the cheap half of the question: a
    // number outside them cannot belong to it, so its full rules need not run.
    if !region_leading_matches(r, national_number) {
      continue
    }
    if region_admits(r, national_number) {
      if r.primary {
        return Some(r.code)
      }
      if fallback is None {
        fallback = Some(r.code)
      }
    }
  }
  fallback
}
