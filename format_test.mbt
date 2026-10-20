// Formatting: the two grouped renderings, against the plans' own styles.
//
// The expected strings below are the everyday national and international
// spellings of the same numbers, so a change in the rendering rules has to argue
// with a person reading them, not only with a golden file.

///|
test "the NANP countries share one style" {
  let cases : Array[(Int, String, String, String)] = [
    // calling code, national number, national form, international form
    (1, "2015550123", "(201) 555-0123", "+1 201-555-0123"),
    (1, "2042545000", "(204) 254-5000", "+1 204-254-5000"),
    (1, "7872345678", "(787) 234-5678", "+1 787-234-5678"),
    (1, "8765230123", "(876) 523-0123", "+1 876-523-0123"),
    (1, "2423456789", "(242) 345-6789", "+1 242-345-6789"),
  ]
  for c in cases {
    let pn = @dialnumber.PhoneNumber::new(c.0, c.1)
    match @dialnumber.region_of_number(pn) {
      Some(code) => assert_eq(@dialnumber.format_national(pn, code), Some(c.2))
      None => assert_true(false)
    }
    assert_eq(@dialnumber.format_international(pn), c.3)
  }
}

///|
test "each plan keeps its own grouping" {
  let cases : Array[(Int, String, String, String, String)] = [
    // calling code, region, national number, national form, international form
    (44, "GB", "2079460958", "020 7946 0958", "+44 20 7946 0958"),
    (49, "DE", "30123456", "030 123456", "+49 30 123456"),
    (33, "FR", "123456789", "01 23 45 67 89", "+33 1 23 45 67 89"),
    (81, "JP", "9012345678", "090-1234-5678", "+81 90-1234-5678"),
    (39, "IT", "0212345678", "02 1234 5678", "+39 02 1234 5678"),
    (86, "CN", "13123456789", "131 2345 6789", "+86 131 2345 6789"),
    (55, "BR", "11987654321", "(11) 98765-4321", "+55 11 98765-4321"),
    (61, "AU", "212345678", "(02) 1234 5678", "+61 2 1234 5678"),
    (91, "IN", "9876543210", "098765 43210", "+91 98765 43210"),
    (7, "RU", "4951234567", "8 (495) 123-45-67", "+7 495 123-45-67"),
    (27, "ZA", "123456789", "012 345 6789", "+27 12 345 6789"),
    (971, "AE", "501234567", "050 123 4567", "+971 50 123 4567"),
  ]
  for c in cases {
    let pn = @dialnumber.PhoneNumber::new(c.0, c.2)
    assert_eq(@dialnumber.format_national(pn, c.1), Some(c.3))
    assert_eq(@dialnumber.format_international(pn), c.4)
  }
}

///|
test "the national rendering reads back as the same number" {
  let cases : Array[(Int, String, String)] = [
    (1, "US", "2015550123"),
    (1, "CA", "2042545000"),
    (1, "PR", "7872345678"),
    (44, "GB", "2079460958"),
    (49, "DE", "30123456"),
    (33, "FR", "123456789"),
    (81, "JP", "9012345678"),
    (39, "IT", "0212345678"),
    (86, "CN", "13123456789"),
    (55, "BR", "11987654321"),
    (61, "AU", "212345678"),
  ]
  for c in cases {
    let pn = @dialnumber.PhoneNumber::new(c.0, c.2)
    match @dialnumber.format_national(pn, c.1) {
      None => assert_true(false)
      Some(written) =>
        assert_eq(@dialnumber.parse(written, c.1), Some(pn))
    }
  }
}

///|
test "a plan without formatting data falls back to the ungrouped form" {
  // A number from a plan whose rules do not cover the shape keeps the trunk
  // prefix and digits, and still round-trips.
  let pn = @dialnumber.PhoneNumber::new(1, "9995550123")
  // 999 is not an assigned area code, so nothing resolves it and nothing formats
  // it; the international form is the plain +1 reading.
  assert_eq(@dialnumber.format_international(pn), "+1 9995550123")
  assert_eq(@dialnumber.format_e164(pn), "+19995550123")
}

///|
test "format_national refuses a region with another calling code" {
  let pn = @dialnumber.PhoneNumber::new(81, "9012345678")
  assert_eq(@dialnumber.format_national(pn, "US"), None)
  assert_eq(@dialnumber.format_national(pn, "ZZ"), None)
}

///|
test "format_dialling renders the dial-out prefix of the caller's region" {
  let gb = @dialnumber.PhoneNumber::new(44, "2079460958")
  assert_eq(@dialnumber.format_dialling(gb, "US"), Some("011 442079460958"))
  assert_eq(@dialnumber.format_dialling(gb, "DE"), Some("00 442079460958"))
  // From inside the country, what is dialled is the national form.
  assert_eq(@dialnumber.format_dialling(gb, "GB"), Some("020 7946 0958"))
  assert_eq(@dialnumber.format_dialling(gb, "ZZ"), None)
}

///|
test "format_dialling falls back to + when the prefix is an expression" {
  // Australia publishes its dial-out prefix as a set of alternatives, which is
  // not something to concatenate; the + form is the honest answer.
  let gb = @dialnumber.PhoneNumber::new(44, "2079460958")
  assert_eq(@dialnumber.format_dialling(gb, "AU"), Some("+442079460958"))
}

///|
test "the grouped forms leave the ungrouped renderings alone" {
  let pn = @dialnumber.PhoneNumber::new(44, "2079460958")
  assert_eq(@dialnumber.format_e164(pn), "+442079460958")
  assert_eq(@dialnumber.format_rfc3966(pn), "tel:+442079460958")
}
