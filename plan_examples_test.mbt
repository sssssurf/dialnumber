// Golden tests for every published example number.
//
// Generated from data/numbering-plans.json by scripts/gen-metadata.mjs.
// Each block proves one region end to end: the example is accepted by the
// region's own rule, reports a plausible number type, and resolves to the
// region the resolution order in region.mbt picks.

///|
test "plan examples: AC Ascension Island" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(247, "62889"), "AC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(247, "62889")), Some("AC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(247, "62889")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(247, "62889"), "AC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AC"), Some(@dialnumber.PhoneNumber::new(247, "62889")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(247, "40123"), "AC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(247, "40123")), Some("AC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(247, "40123")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(247, "40123"), "AC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AC"), Some(@dialnumber.PhoneNumber::new(247, "40123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(247, "542011"), "AC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(247, "542011")), Some("AC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(247, "542011")), Some(Uan))
}

///|
test "plan examples: AD Andorra" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(376, "712345"), "AD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(376, "712345")), Some("AD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(376, "712345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(376, "712345"), "AD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AD"), Some(@dialnumber.PhoneNumber::new(376, "712345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(376, "312345"), "AD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(376, "312345")), Some("AD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(376, "312345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(376, "312345"), "AD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AD"), Some(@dialnumber.PhoneNumber::new(376, "312345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(376, "18001234"), "AD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(376, "18001234")), Some("AD"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(376, "18001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(376, "912345"), "AD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(376, "912345")), Some("AD"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(376, "912345")), Some(PremiumRate))
}

///|
test "plan examples: AE United Arab Emirates" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(971, "22345678"), "AE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(971, "22345678")), Some("AE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(971, "22345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(971, "22345678"), "AE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AE"), Some(@dialnumber.PhoneNumber::new(971, "22345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(971, "501234567"), "AE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(971, "501234567")), Some("AE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(971, "501234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(971, "501234567"), "AE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AE"), Some(@dialnumber.PhoneNumber::new(971, "501234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(971, "800123456"), "AE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(971, "800123456")), Some("AE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(971, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(971, "900234567"), "AE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(971, "900234567")), Some("AE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(971, "900234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(971, "700012345"), "AE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(971, "700012345")), Some("AE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(971, "700012345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(971, "600212345"), "AE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(971, "600212345")), Some("AE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(971, "600212345")), Some(Uan))
}

///|
test "plan examples: AF Afghanistan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(93, "234567890"), "AF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(93, "234567890")), Some("AF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(93, "234567890")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(93, "234567890"), "AF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AF"), Some(@dialnumber.PhoneNumber::new(93, "234567890")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(93, "701234567"), "AF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(93, "701234567")), Some("AF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(93, "701234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(93, "701234567"), "AF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AF"), Some(@dialnumber.PhoneNumber::new(93, "701234567")))
    None => assert_true(false)
  }
}

///|
test "plan examples: AG Antigua & Barbuda" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2684601234"), "AG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2684601234")), Some("AG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2684601234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2684641234"), "AG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2684641234")), Some("AG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2684641234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "AG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "AG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2684801234"), "AG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2684801234")), Some("AG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2684801234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "AG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2684061234"), "AG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2684061234")), Some("AG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2684061234")), Some(Pager))
}

///|
test "plan examples: AI Anguilla" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2644612345"), "AI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2644612345")), Some("AI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2644612345")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2642351234"), "AI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2642351234")), Some("AI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2642351234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "AI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "AI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "AI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2647241234"), "AI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2647241234")), Some("AI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2647241234")), Some(Pager))
}

///|
test "plan examples: AL Albania" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(355, "22345678"), "AL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(355, "22345678")), Some("AL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(355, "22345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(355, "22345678"), "AL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AL"), Some(@dialnumber.PhoneNumber::new(355, "22345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(355, "672123456"), "AL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(355, "672123456")), Some("AL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(355, "672123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(355, "672123456"), "AL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AL"), Some(@dialnumber.PhoneNumber::new(355, "672123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(355, "8001234"), "AL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(355, "8001234")), Some("AL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(355, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(355, "900123"), "AL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(355, "900123")), Some("AL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(355, "900123")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(355, "808123"), "AL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(355, "808123")), Some("AL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(355, "808123")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(355, "70021234"), "AL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(355, "70021234")), Some("AL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(355, "70021234")), Some(PersonalNumber))
}

///|
test "plan examples: AM Armenia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(374, "10123456"), "AM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(374, "10123456")), Some("AM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(374, "10123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(374, "10123456"), "AM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AM"), Some(@dialnumber.PhoneNumber::new(374, "10123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(374, "77123456"), "AM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(374, "77123456")), Some("AM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(374, "77123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(374, "77123456"), "AM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AM"), Some(@dialnumber.PhoneNumber::new(374, "77123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(374, "80012345"), "AM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(374, "80012345")), Some("AM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(374, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(374, "90012345"), "AM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(374, "90012345")), Some("AM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(374, "90012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(374, "80112345"), "AM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(374, "80112345")), Some("AM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(374, "80112345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(374, "60271234"), "AM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(374, "60271234")), Some("AM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(374, "60271234")), Some(Voip))
}

///|
test "plan examples: AO Angola" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(244, "222123456"), "AO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(244, "222123456")), Some("AO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(244, "222123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(244, "222123456"), "AO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AO"), Some(@dialnumber.PhoneNumber::new(244, "222123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(244, "923123456"), "AO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(244, "923123456")), Some("AO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(244, "923123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(244, "923123456"), "AO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AO"), Some(@dialnumber.PhoneNumber::new(244, "923123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: AR Argentina" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(54, "1123456789"), "AR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(54, "1123456789")), Some("AR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(54, "1123456789")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(54, "91123456789"), "AR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(54, "91123456789")), Some("AR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(54, "91123456789")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(54, "8001234567"), "AR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(54, "8001234567")), Some("AR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(54, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(54, "6001234567"), "AR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(54, "6001234567")), Some("AR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(54, "6001234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(54, "8101234567"), "AR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(54, "8101234567")), Some("AR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(54, "8101234567")), Some(Uan))
}

///|
test "plan examples: AS American Samoa" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6846221234"), "AS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6846221234")), Some("AS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6846221234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6847331234"), "AS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6847331234")), Some("AS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6847331234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "AS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "AS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "AS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: AT Austria" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(43, "1234567890"), "AT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(43, "1234567890")), Some("AT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(43, "1234567890")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(43, "1234567890"), "AT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AT"), Some(@dialnumber.PhoneNumber::new(43, "1234567890")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(43, "664123456"), "AT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(43, "664123456")), Some("AT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(43, "664123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(43, "664123456"), "AT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AT"), Some(@dialnumber.PhoneNumber::new(43, "664123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(43, "800123456"), "AT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(43, "800123456")), Some("AT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(43, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(43, "900123456"), "AT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(43, "900123456")), Some("AT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(43, "900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(43, "810123456"), "AT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(43, "810123456")), Some("AT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(43, "810123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(43, "780123456"), "AT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(43, "780123456")), Some("AT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(43, "780123456")), Some(Voip))
}

///|
test "plan examples: AU Australia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "212345678"), "AU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "212345678")), Some("AU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "212345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(61, "212345678"), "AU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AU"), Some(@dialnumber.PhoneNumber::new(61, "212345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "412345678"), "AU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "412345678")), Some("AU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "412345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(61, "412345678"), "AU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AU"), Some(@dialnumber.PhoneNumber::new(61, "412345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1800123456"), "AU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1800123456")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1900123456"), "AU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1900123456")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1300123456"), "AU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1300123456")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1300123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "147101234"), "AU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "147101234")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "147101234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1631234"), "AU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1631234")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1631234")), Some(Pager))
}

///|
test "plan examples: AW Aruba" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(297, "5212345"), "AW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(297, "5212345")), Some("AW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(297, "5212345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(297, "5212345"), "AW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AW"), Some(@dialnumber.PhoneNumber::new(297, "5212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(297, "5601234"), "AW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(297, "5601234")), Some("AW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(297, "5601234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(297, "5601234"), "AW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AW"), Some(@dialnumber.PhoneNumber::new(297, "5601234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(297, "8001234"), "AW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(297, "8001234")), Some("AW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(297, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(297, "9001234"), "AW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(297, "9001234")), Some("AW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(297, "9001234")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(297, "5011234"), "AW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(297, "5011234")), Some("AW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(297, "5011234")), Some(Voip))
}

///|
test "plan examples: AX Åland Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "181234567"), "AX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "181234567")), Some("AX"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "181234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(358, "181234567"), "AX") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AX"), Some(@dialnumber.PhoneNumber::new(358, "181234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "412345678"), "AX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "412345678")), Some("FI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "412345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(358, "412345678"), "AX") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AX"), Some(@dialnumber.PhoneNumber::new(358, "412345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "800123456"), "AX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "800123456")), Some("FI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "600123456"), "AX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "600123456")), Some("FI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "600123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "10112345"), "AX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "10112345")), Some("FI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "10112345")), Some(Uan))
}

///|
test "plan examples: AZ Azerbaijan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(994, "123123456"), "AZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(994, "123123456")), Some("AZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(994, "123123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(994, "123123456"), "AZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AZ"), Some(@dialnumber.PhoneNumber::new(994, "123123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(994, "401234567"), "AZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(994, "401234567")), Some("AZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(994, "401234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(994, "401234567"), "AZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "AZ"), Some(@dialnumber.PhoneNumber::new(994, "401234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(994, "881234567"), "AZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(994, "881234567")), Some("AZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(994, "881234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(994, "900200123"), "AZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(994, "900200123")), Some("AZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(994, "900200123")), Some(PremiumRate))
}

///|
test "plan examples: BA Bosnia & Herzegovina" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(387, "30212345"), "BA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(387, "30212345")), Some("BA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(387, "30212345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(387, "30212345"), "BA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BA"), Some(@dialnumber.PhoneNumber::new(387, "30212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(387, "61123456"), "BA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(387, "61123456")), Some("BA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(387, "61123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(387, "61123456"), "BA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BA"), Some(@dialnumber.PhoneNumber::new(387, "61123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(387, "80123456"), "BA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(387, "80123456")), Some("BA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(387, "80123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(387, "90123456"), "BA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(387, "90123456")), Some("BA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(387, "90123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(387, "82123456"), "BA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(387, "82123456")), Some("BA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(387, "82123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(387, "70341234"), "BA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(387, "70341234")), Some("BA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(387, "70341234")), Some(Uan))
}

///|
test "plan examples: BB Barbados" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2464123456"), "BB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2464123456")), Some("BB"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2464123456")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2462501234"), "BB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2462501234")), Some("BB"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2462501234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "BB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "BB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2463101234"), "BB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2463101234")), Some("BB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2463101234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "BB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2464301234"), "BB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2464301234")), Some("BB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2464301234")), Some(Uan))
}

///|
test "plan examples: BD Bangladesh" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(880, "27111234"), "BD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(880, "27111234")), Some("BD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(880, "27111234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(880, "27111234"), "BD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BD"), Some(@dialnumber.PhoneNumber::new(880, "27111234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(880, "1812345678"), "BD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(880, "1812345678")), Some("BD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(880, "1812345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(880, "1812345678"), "BD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BD"), Some(@dialnumber.PhoneNumber::new(880, "1812345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(880, "8001234567"), "BD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(880, "8001234567")), Some("BD"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(880, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(880, "9604123456"), "BD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(880, "9604123456")), Some("BD"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(880, "9604123456")), Some(Voip))
}

///|
test "plan examples: BE Belgium" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(32, "12345678"), "BE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(32, "12345678")), Some("BE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(32, "12345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(32, "12345678"), "BE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BE"), Some(@dialnumber.PhoneNumber::new(32, "12345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(32, "450001234"), "BE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(32, "450001234")), Some("BE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(32, "450001234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(32, "450001234"), "BE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BE"), Some(@dialnumber.PhoneNumber::new(32, "450001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(32, "80012345"), "BE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(32, "80012345")), Some("BE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(32, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(32, "90012345"), "BE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(32, "90012345")), Some("BE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(32, "90012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(32, "78791234"), "BE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(32, "78791234")), Some("BE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(32, "78791234")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(32, "78102345"), "BE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(32, "78102345")), Some("BE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(32, "78102345")), Some(Uan))
}

///|
test "plan examples: BF Burkina Faso" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(226, "20491234"), "BF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(226, "20491234")), Some("BF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(226, "20491234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(226, "20491234"), "BF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BF"), Some(@dialnumber.PhoneNumber::new(226, "20491234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(226, "70123456"), "BF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(226, "70123456")), Some("BF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(226, "70123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(226, "70123456"), "BF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BF"), Some(@dialnumber.PhoneNumber::new(226, "70123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: BG Bulgaria" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(359, "2123456"), "BG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(359, "2123456")), Some("BG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(359, "2123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(359, "2123456"), "BG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BG"), Some(@dialnumber.PhoneNumber::new(359, "2123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(359, "43012345"), "BG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(359, "43012345")), Some("BG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(359, "43012345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(359, "43012345"), "BG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BG"), Some(@dialnumber.PhoneNumber::new(359, "43012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(359, "80012345"), "BG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(359, "80012345")), Some("BG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(359, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(359, "90123456"), "BG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(359, "90123456")), Some("BG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(359, "90123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(359, "70012345"), "BG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(359, "70012345")), Some("BG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(359, "70012345")), Some(SharedCost))
}

///|
test "plan examples: BH Bahrain" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(973, "17001234"), "BH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(973, "17001234")), Some("BH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(973, "17001234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(973, "17001234"), "BH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BH"), Some(@dialnumber.PhoneNumber::new(973, "17001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(973, "36001234"), "BH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(973, "36001234")), Some("BH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(973, "36001234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(973, "36001234"), "BH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BH"), Some(@dialnumber.PhoneNumber::new(973, "36001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(973, "80123456"), "BH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(973, "80123456")), Some("BH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(973, "80123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(973, "90123456"), "BH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(973, "90123456")), Some("BH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(973, "90123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(973, "84123456"), "BH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(973, "84123456")), Some("BH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(973, "84123456")), Some(SharedCost))
}

///|
test "plan examples: BI Burundi" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(257, "22201234"), "BI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(257, "22201234")), Some("BI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(257, "22201234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(257, "22201234"), "BI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BI"), Some(@dialnumber.PhoneNumber::new(257, "22201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(257, "79561234"), "BI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(257, "79561234")), Some("BI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(257, "79561234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(257, "79561234"), "BI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BI"), Some(@dialnumber.PhoneNumber::new(257, "79561234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: BJ Benin" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(229, "0120211234"), "BJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(229, "0120211234")), Some("BJ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(229, "0120211234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(229, "0120211234"), "BJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BJ"), Some(@dialnumber.PhoneNumber::new(229, "0120211234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(229, "0195123456"), "BJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(229, "0195123456")), Some("BJ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(229, "0195123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(229, "0195123456"), "BJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BJ"), Some(@dialnumber.PhoneNumber::new(229, "0195123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(229, "85751234"), "BJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(229, "85751234")), Some("BJ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(229, "85751234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(229, "81123456"), "BJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(229, "81123456")), Some("BJ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(229, "81123456")), Some(Uan))
}

///|
test "plan examples: BL St. Barthélemy" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "590271234"), "BL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "590271234")), Some("BL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "590271234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(590, "590271234"), "BL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BL"), Some(@dialnumber.PhoneNumber::new(590, "590271234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "690001234"), "BL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "690001234")), Some("GP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "690001234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(590, "690001234"), "BL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BL"), Some(@dialnumber.PhoneNumber::new(590, "690001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "800012345"), "BL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "800012345")), Some("GP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "800012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "810123456"), "BL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "810123456")), Some("GP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "810123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "976012345"), "BL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "976012345")), Some("GP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "976012345")), Some(Voip))
}

///|
test "plan examples: BM Bermuda" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "4414123456"), "BM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "4414123456")), Some("BM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "4414123456")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "4413701234"), "BM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "4413701234")), Some("BM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "4413701234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "BM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "BM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "BM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: BN Brunei" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(673, "2345678"), "BN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(673, "2345678")), Some("BN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(673, "2345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(673, "2345678"), "BN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BN"), Some(@dialnumber.PhoneNumber::new(673, "2345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(673, "7123456"), "BN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(673, "7123456")), Some("BN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(673, "7123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(673, "7123456"), "BN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BN"), Some(@dialnumber.PhoneNumber::new(673, "7123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(673, "5345678"), "BN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(673, "5345678")), Some("BN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(673, "5345678")), Some(Voip))
}

///|
test "plan examples: BO Bolivia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(591, "22123456"), "BO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(591, "22123456")), Some("BO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(591, "22123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(591, "22123456"), "BO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BO"), Some(@dialnumber.PhoneNumber::new(591, "22123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(591, "71234567"), "BO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(591, "71234567")), Some("BO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(591, "71234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(591, "71234567"), "BO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BO"), Some(@dialnumber.PhoneNumber::new(591, "71234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(591, "800171234"), "BO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(591, "800171234")), Some("BO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(591, "800171234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(591, "50123456"), "BO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(591, "50123456")), Some("BO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(591, "50123456")), Some(Voip))
}

///|
test "plan examples: BQ Caribbean Netherlands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(599, "7151234"), "BQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(599, "7151234")), Some("BQ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(599, "7151234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(599, "7151234"), "BQ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BQ"), Some(@dialnumber.PhoneNumber::new(599, "7151234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(599, "3181234"), "BQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(599, "3181234")), Some("BQ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(599, "3181234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(599, "3181234"), "BQ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BQ"), Some(@dialnumber.PhoneNumber::new(599, "3181234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: BR Brazil" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(55, "1123456789"), "BR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(55, "1123456789")), Some("BR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(55, "1123456789")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(55, "11961234567"), "BR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(55, "11961234567")), Some("BR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(55, "11961234567")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(55, "800123456"), "BR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(55, "800123456")), Some("BR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(55, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(55, "500123456"), "BR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(55, "500123456")), Some("BR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(55, "500123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(55, "40041234"), "BR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(55, "40041234")), Some("BR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(55, "40041234")), Some(SharedCost))
}

///|
test "plan examples: BS Bahamas" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2423456789"), "BS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2423456789")), Some("BS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2423456789")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2423591234"), "BS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2423591234")), Some("BS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2423591234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "BS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "BS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "BS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2422250123"), "BS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2422250123")), Some("BS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2422250123")), Some(Uan))
}

///|
test "plan examples: BT Bhutan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(975, "2345678"), "BT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(975, "2345678")), Some("BT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(975, "2345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(975, "2345678"), "BT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BT"), Some(@dialnumber.PhoneNumber::new(975, "2345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(975, "17123456"), "BT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(975, "17123456")), Some("BT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(975, "17123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(975, "17123456"), "BT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BT"), Some(@dialnumber.PhoneNumber::new(975, "17123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: BW Botswana" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(267, "2401234"), "BW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(267, "2401234")), Some("BW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(267, "2401234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(267, "2401234"), "BW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BW"), Some(@dialnumber.PhoneNumber::new(267, "2401234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(267, "71123456"), "BW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(267, "71123456")), Some("BW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(267, "71123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(267, "71123456"), "BW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BW"), Some(@dialnumber.PhoneNumber::new(267, "71123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(267, "0800012345"), "BW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(267, "0800012345")), Some("BW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(267, "0800012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(267, "9012345"), "BW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(267, "9012345")), Some("BW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(267, "9012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(267, "79101234"), "BW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(267, "79101234")), Some("BW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(267, "79101234")), Some(Voip))
}

///|
test "plan examples: BY Belarus" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(375, "152450911"), "BY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(375, "152450911")), Some("BY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(375, "152450911")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(375, "152450911"), "BY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BY"), Some(@dialnumber.PhoneNumber::new(375, "152450911")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(375, "294911911"), "BY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(375, "294911911")), Some("BY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(375, "294911911")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(375, "294911911"), "BY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BY"), Some(@dialnumber.PhoneNumber::new(375, "294911911")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(375, "8011234567"), "BY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(375, "8011234567")), Some("BY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(375, "8011234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(375, "9021234567"), "BY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(375, "9021234567")), Some("BY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(375, "9021234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(375, "249123456"), "BY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(375, "249123456")), Some("BY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(375, "249123456")), Some(Voip))
}

///|
test "plan examples: BZ Belize" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(501, "2221234"), "BZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(501, "2221234")), Some("BZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(501, "2221234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(501, "2221234"), "BZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BZ"), Some(@dialnumber.PhoneNumber::new(501, "2221234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(501, "6221234"), "BZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(501, "6221234")), Some("BZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(501, "6221234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(501, "6221234"), "BZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "BZ"), Some(@dialnumber.PhoneNumber::new(501, "6221234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(501, "08001234123"), "BZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(501, "08001234123")), Some("BZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(501, "08001234123")), Some(TollFree))
}

///|
test "plan examples: CA Canada" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5062345678"), "CA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5062345678")), Some("CA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5062345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "5062345678"), "CA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CA"), Some(@dialnumber.PhoneNumber::new(1, "5062345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5062345678"), "CA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5062345678")), Some("CA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5062345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "5062345678"), "CA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CA"), Some(@dialnumber.PhoneNumber::new(1, "5062345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "CA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "CA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6002012345"), "CA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6002012345")), Some("CA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6002012345")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5219023456"), "CA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5219023456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5219023456")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "3101234"), "CA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "3101234")), None)
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "3101234")), None)
}

///|
test "plan examples: CC Cocos (Keeling) Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "891621234"), "CC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "891621234")), Some("CC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "891621234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "412345678"), "CC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "412345678")), Some("AU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "412345678")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1800123456"), "CC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1800123456")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1900123456"), "CC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1900123456")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1300123456"), "CC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1300123456")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1300123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "147101234"), "CC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "147101234")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "147101234")), Some(Voip))
}

///|
test "plan examples: CD Congo - Kinshasa" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(243, "1234567"), "CD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(243, "1234567")), Some("CD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(243, "1234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(243, "1234567"), "CD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CD"), Some(@dialnumber.PhoneNumber::new(243, "1234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(243, "991234567"), "CD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(243, "991234567")), Some("CD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(243, "991234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(243, "991234567"), "CD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CD"), Some(@dialnumber.PhoneNumber::new(243, "991234567")))
    None => assert_true(false)
  }
}

///|
test "plan examples: CF Central African Republic" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(236, "21612345"), "CF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(236, "21612345")), Some("CF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(236, "21612345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(236, "21612345"), "CF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CF"), Some(@dialnumber.PhoneNumber::new(236, "21612345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(236, "70012345"), "CF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(236, "70012345")), Some("CF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(236, "70012345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(236, "70012345"), "CF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CF"), Some(@dialnumber.PhoneNumber::new(236, "70012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(236, "87761234"), "CF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(236, "87761234")), Some("CF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(236, "87761234")), Some(PremiumRate))
}

///|
test "plan examples: CG Congo - Brazzaville" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(242, "222123456"), "CG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(242, "222123456")), Some("CG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(242, "222123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(242, "222123456"), "CG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CG"), Some(@dialnumber.PhoneNumber::new(242, "222123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(242, "061234567"), "CG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(242, "061234567")), Some("CG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(242, "061234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(242, "061234567"), "CG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CG"), Some(@dialnumber.PhoneNumber::new(242, "061234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(242, "800123456"), "CG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(242, "800123456")), Some("CG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(242, "800123456")), Some(PremiumRate))
}

///|
test "plan examples: CH Switzerland" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(41, "212345678"), "CH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(41, "212345678")), Some("CH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(41, "212345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(41, "212345678"), "CH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CH"), Some(@dialnumber.PhoneNumber::new(41, "212345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(41, "781234567"), "CH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(41, "781234567")), Some("CH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(41, "781234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(41, "781234567"), "CH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CH"), Some(@dialnumber.PhoneNumber::new(41, "781234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(41, "800123456"), "CH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(41, "800123456")), Some("CH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(41, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(41, "900123456"), "CH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(41, "900123456")), Some("CH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(41, "900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(41, "840123456"), "CH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(41, "840123456")), Some("CH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(41, "840123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(41, "878123456"), "CH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(41, "878123456")), Some("CH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(41, "878123456")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(41, "581234567"), "CH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(41, "581234567")), Some("CH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(41, "581234567")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(41, "740123456"), "CH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(41, "740123456")), Some("CH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(41, "740123456")), Some(Pager))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(41, "860123456789"), "CH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(41, "860123456789")), Some("CH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(41, "860123456789")), Some(Voicemail))
}

///|
test "plan examples: CI Côte d’Ivoire" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(225, "2123456789"), "CI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(225, "2123456789")), Some("CI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(225, "2123456789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(225, "2123456789"), "CI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CI"), Some(@dialnumber.PhoneNumber::new(225, "2123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(225, "0123456789"), "CI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(225, "0123456789")), Some("CI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(225, "0123456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(225, "0123456789"), "CI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CI"), Some(@dialnumber.PhoneNumber::new(225, "0123456789")))
    None => assert_true(false)
  }
}

///|
test "plan examples: CK Cook Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(682, "21234"), "CK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(682, "21234")), Some("CK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(682, "21234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(682, "21234"), "CK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CK"), Some(@dialnumber.PhoneNumber::new(682, "21234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(682, "71234"), "CK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(682, "71234")), Some("CK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(682, "71234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(682, "71234"), "CK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CK"), Some(@dialnumber.PhoneNumber::new(682, "71234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: CL Chile" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(56, "600123456"), "CL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(56, "600123456")), Some("CL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(56, "600123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(56, "600123456"), "CL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CL"), Some(@dialnumber.PhoneNumber::new(56, "600123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(56, "221234567"), "CL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(56, "221234567")), Some("CL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(56, "221234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(56, "221234567"), "CL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CL"), Some(@dialnumber.PhoneNumber::new(56, "221234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(56, "800123456"), "CL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(56, "800123456")), Some("CL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(56, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(56, "6001234567"), "CL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(56, "6001234567")), Some("CL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(56, "6001234567")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(56, "441234567"), "CL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(56, "441234567")), Some("CL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(56, "441234567")), Some(Voip))
}

///|
test "plan examples: CM Cameroon" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(237, "222123456"), "CM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(237, "222123456")), Some("CM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(237, "222123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(237, "222123456"), "CM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CM"), Some(@dialnumber.PhoneNumber::new(237, "222123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(237, "671234567"), "CM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(237, "671234567")), Some("CM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(237, "671234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(237, "671234567"), "CM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CM"), Some(@dialnumber.PhoneNumber::new(237, "671234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(237, "88012345"), "CM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(237, "88012345")), Some("CM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(237, "88012345")), Some(TollFree))
}

///|
test "plan examples: CN China" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(86, "1012345678"), "CN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(86, "1012345678")), Some("CN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(86, "1012345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(86, "1012345678"), "CN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CN"), Some(@dialnumber.PhoneNumber::new(86, "1012345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(86, "13123456789"), "CN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(86, "13123456789")), Some("CN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(86, "13123456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(86, "13123456789"), "CN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CN"), Some(@dialnumber.PhoneNumber::new(86, "13123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(86, "8001234567"), "CN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(86, "8001234567")), Some("CN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(86, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(86, "16812345"), "CN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(86, "16812345")), Some("CN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(86, "16812345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(86, "4001234567"), "CN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(86, "4001234567")), Some("CN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(86, "4001234567")), Some(SharedCost))
}

///|
test "plan examples: CO Colombia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(57, "6012345678"), "CO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(57, "6012345678")), Some("CO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(57, "6012345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(57, "6012345678"), "CO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CO"), Some(@dialnumber.PhoneNumber::new(57, "6012345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(57, "3211234567"), "CO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(57, "3211234567")), Some("CO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(57, "3211234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(57, "3211234567"), "CO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CO"), Some(@dialnumber.PhoneNumber::new(57, "3211234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(57, "18001234567"), "CO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(57, "18001234567")), Some("CO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(57, "18001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(57, "19001234567"), "CO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(57, "19001234567")), Some("CO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(57, "19001234567")), Some(PremiumRate))
}

///|
test "plan examples: CR Costa Rica" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(506, "22123456"), "CR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(506, "22123456")), Some("CR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(506, "22123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(506, "22123456"), "CR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CR"), Some(@dialnumber.PhoneNumber::new(506, "22123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(506, "83123456"), "CR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(506, "83123456")), Some("CR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(506, "83123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(506, "83123456"), "CR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CR"), Some(@dialnumber.PhoneNumber::new(506, "83123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(506, "8001234567"), "CR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(506, "8001234567")), Some("CR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(506, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(506, "9001234567"), "CR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(506, "9001234567")), Some("CR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(506, "9001234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(506, "40001234"), "CR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(506, "40001234")), Some("CR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(506, "40001234")), Some(Voip))
}

///|
test "plan examples: CU Cuba" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(53, "71234567"), "CU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(53, "71234567")), Some("CU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(53, "71234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(53, "71234567"), "CU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CU"), Some(@dialnumber.PhoneNumber::new(53, "71234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(53, "51234567"), "CU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(53, "51234567")), Some("CU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(53, "51234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(53, "51234567"), "CU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CU"), Some(@dialnumber.PhoneNumber::new(53, "51234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(53, "8001234567"), "CU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(53, "8001234567")), Some("CU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(53, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(53, "8071234567"), "CU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(53, "8071234567")), Some("CU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(53, "8071234567")), Some(SharedCost))
}

///|
test "plan examples: CV Cape Verde" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(238, "2211234"), "CV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(238, "2211234")), Some("CV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(238, "2211234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(238, "2211234"), "CV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CV"), Some(@dialnumber.PhoneNumber::new(238, "2211234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(238, "9911234"), "CV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(238, "9911234")), Some("CV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(238, "9911234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(238, "9911234"), "CV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CV"), Some(@dialnumber.PhoneNumber::new(238, "9911234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(238, "8001234"), "CV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(238, "8001234")), Some("CV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(238, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(238, "3401234"), "CV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(238, "3401234")), Some("CV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(238, "3401234")), Some(Voip))
}

///|
test "plan examples: CW Curaçao" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(599, "94351234"), "CW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(599, "94351234")), Some("CW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(599, "94351234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(599, "94351234"), "CW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CW"), Some(@dialnumber.PhoneNumber::new(599, "94351234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(599, "95181234"), "CW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(599, "95181234")), Some("CW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(599, "95181234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(599, "95181234"), "CW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CW"), Some(@dialnumber.PhoneNumber::new(599, "95181234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(599, "6001234"), "CW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(599, "6001234")), Some("CW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(599, "6001234")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(599, "95581234"), "CW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(599, "95581234")), Some("CW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(599, "95581234")), Some(Pager))
}

///|
test "plan examples: CX Christmas Island" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "891641234"), "CX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "891641234")), Some("CX"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "891641234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "412345678"), "CX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "412345678")), Some("AU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "412345678")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1800123456"), "CX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1800123456")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1900123456"), "CX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1900123456")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "1300123456"), "CX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "1300123456")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "1300123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(61, "147101234"), "CX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(61, "147101234")), Some("AU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(61, "147101234")), Some(Voip))
}

///|
test "plan examples: CY Cyprus" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(357, "22345678"), "CY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(357, "22345678")), Some("CY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(357, "22345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(357, "22345678"), "CY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CY"), Some(@dialnumber.PhoneNumber::new(357, "22345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(357, "96123456"), "CY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(357, "96123456")), Some("CY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(357, "96123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(357, "96123456"), "CY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CY"), Some(@dialnumber.PhoneNumber::new(357, "96123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(357, "80001234"), "CY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(357, "80001234")), Some("CY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(357, "80001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(357, "90012345"), "CY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(357, "90012345")), Some("CY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(357, "90012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(357, "80112345"), "CY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(357, "80112345")), Some("CY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(357, "80112345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(357, "70012345"), "CY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(357, "70012345")), Some("CY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(357, "70012345")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(357, "77123456"), "CY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(357, "77123456")), Some("CY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(357, "77123456")), Some(Uan))
}

///|
test "plan examples: CZ Czechia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(420, "212345678"), "CZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(420, "212345678")), Some("CZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(420, "212345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(420, "212345678"), "CZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CZ"), Some(@dialnumber.PhoneNumber::new(420, "212345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(420, "601123456"), "CZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(420, "601123456")), Some("CZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(420, "601123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(420, "601123456"), "CZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "CZ"), Some(@dialnumber.PhoneNumber::new(420, "601123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(420, "800123456"), "CZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(420, "800123456")), Some("CZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(420, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(420, "900123456"), "CZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(420, "900123456")), Some("CZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(420, "900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(420, "811234567"), "CZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(420, "811234567")), Some("CZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(420, "811234567")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(420, "910123456"), "CZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(420, "910123456")), Some("CZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(420, "910123456")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(420, "700123456"), "CZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(420, "700123456")), Some("CZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(420, "700123456")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(420, "972123456"), "CZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(420, "972123456")), Some("CZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(420, "972123456")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(420, "93123456789"), "CZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(420, "93123456789")), Some("CZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(420, "93123456789")), Some(Voicemail))
}

///|
test "plan examples: DE Germany" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(49, "30123456"), "DE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(49, "30123456")), Some("DE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(49, "30123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(49, "30123456"), "DE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DE"), Some(@dialnumber.PhoneNumber::new(49, "30123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(49, "15123456789"), "DE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(49, "15123456789")), Some("DE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(49, "15123456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(49, "15123456789"), "DE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DE"), Some(@dialnumber.PhoneNumber::new(49, "15123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(49, "8001234567890"), "DE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(49, "8001234567890")), Some("DE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(49, "8001234567890")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(49, "9001234567"), "DE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(49, "9001234567")), Some("DE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(49, "9001234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(49, "18012345"), "DE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(49, "18012345")), Some("DE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(49, "18012345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(49, "70012345678"), "DE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(49, "70012345678")), Some("DE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(49, "70012345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(49, "18500123456"), "DE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(49, "18500123456")), Some("DE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(49, "18500123456")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(49, "16412345"), "DE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(49, "16412345")), Some("DE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(49, "16412345")), Some(Pager))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(49, "177991234567"), "DE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(49, "177991234567")), Some("DE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(49, "177991234567")), Some(Voicemail))
}

///|
test "plan examples: DJ Djibouti" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(253, "21360003"), "DJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(253, "21360003")), Some("DJ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(253, "21360003")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(253, "21360003"), "DJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DJ"), Some(@dialnumber.PhoneNumber::new(253, "21360003")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(253, "77831001"), "DJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(253, "77831001")), Some("DJ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(253, "77831001")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(253, "77831001"), "DJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DJ"), Some(@dialnumber.PhoneNumber::new(253, "77831001")))
    None => assert_true(false)
  }
}

///|
test "plan examples: DK Denmark" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(45, "32123456"), "DK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(45, "32123456")), Some("DK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(45, "32123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(45, "32123456"), "DK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DK"), Some(@dialnumber.PhoneNumber::new(45, "32123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(45, "34412345"), "DK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(45, "34412345")), Some("DK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(45, "34412345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(45, "34412345"), "DK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DK"), Some(@dialnumber.PhoneNumber::new(45, "34412345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(45, "80123456"), "DK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(45, "80123456")), Some("DK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(45, "80123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(45, "90123456"), "DK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(45, "90123456")), Some("DK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(45, "90123456")), Some(PremiumRate))
}

///|
test "plan examples: DM Dominica" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7674201234"), "DM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7674201234")), Some("DM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7674201234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7672251234"), "DM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7672251234")), Some("DM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7672251234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "DM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "DM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "DM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: DO Dominican Republic" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8092345678"), "DO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8092345678")), Some("DO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8092345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "8092345678"), "DO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DO"), Some(@dialnumber.PhoneNumber::new(1, "8092345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8092345678"), "DO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8092345678")), Some("DO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8092345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "8092345678"), "DO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DO"), Some(@dialnumber.PhoneNumber::new(1, "8092345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "DO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "DO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "DO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: DZ Algeria" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(213, "12345678"), "DZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(213, "12345678")), Some("DZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(213, "12345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(213, "12345678"), "DZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DZ"), Some(@dialnumber.PhoneNumber::new(213, "12345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(213, "551234567"), "DZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(213, "551234567")), Some("DZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(213, "551234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(213, "551234567"), "DZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "DZ"), Some(@dialnumber.PhoneNumber::new(213, "551234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(213, "800123456"), "DZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(213, "800123456")), Some("DZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(213, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(213, "808123456"), "DZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(213, "808123456")), Some("DZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(213, "808123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(213, "801123456"), "DZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(213, "801123456")), Some("DZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(213, "801123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(213, "983123456"), "DZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(213, "983123456")), Some("DZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(213, "983123456")), Some(Voip))
}

///|
test "plan examples: EC Ecuador" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(593, "22123456"), "EC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(593, "22123456")), Some("EC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(593, "22123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(593, "22123456"), "EC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "EC"), Some(@dialnumber.PhoneNumber::new(593, "22123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(593, "991234567"), "EC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(593, "991234567")), Some("EC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(593, "991234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(593, "991234567"), "EC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "EC"), Some(@dialnumber.PhoneNumber::new(593, "991234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(593, "18001234567"), "EC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(593, "18001234567")), Some("EC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(593, "18001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(593, "28901234"), "EC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(593, "28901234")), Some("EC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(593, "28901234")), Some(Voip))
}

///|
test "plan examples: EE Estonia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(372, "3212345"), "EE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(372, "3212345")), Some("EE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(372, "3212345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(372, "3212345"), "EE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "EE"), Some(@dialnumber.PhoneNumber::new(372, "3212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(372, "51234567"), "EE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(372, "51234567")), Some("EE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(372, "51234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(372, "51234567"), "EE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "EE"), Some(@dialnumber.PhoneNumber::new(372, "51234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(372, "80012345"), "EE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(372, "80012345")), Some("EE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(372, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(372, "9001234"), "EE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(372, "9001234")), Some("EE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(372, "9001234")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(372, "70012345"), "EE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(372, "70012345")), Some("EE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(372, "70012345")), Some(PersonalNumber))
}

///|
test "plan examples: EG Egypt" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(20, "234567890"), "EG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(20, "234567890")), Some("EG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(20, "234567890")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(20, "234567890"), "EG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "EG"), Some(@dialnumber.PhoneNumber::new(20, "234567890")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(20, "1001234567"), "EG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(20, "1001234567")), Some("EG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(20, "1001234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(20, "1001234567"), "EG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "EG"), Some(@dialnumber.PhoneNumber::new(20, "1001234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(20, "8001234567"), "EG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(20, "8001234567")), Some("EG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(20, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(20, "9001234567"), "EG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(20, "9001234567")), Some("EG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(20, "9001234567")), Some(PremiumRate))
}

///|
test "plan examples: EH Western Sahara" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "528812345"), "EH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "528812345")), Some("MA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "528812345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(212, "528812345"), "EH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "EH"), Some(@dialnumber.PhoneNumber::new(212, "528812345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "650123456"), "EH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "650123456")), Some("MA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "650123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(212, "650123456"), "EH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "EH"), Some(@dialnumber.PhoneNumber::new(212, "650123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "801234567"), "EH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "801234567")), Some("MA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "801234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "891234567"), "EH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "891234567")), Some("MA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "891234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "592401234"), "EH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "592401234")), Some("MA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "592401234")), Some(Voip))
}

///|
test "plan examples: ER Eritrea" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(291, "8370362"), "ER"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(291, "8370362")), Some("ER"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(291, "8370362")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(291, "8370362"), "ER") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ER"), Some(@dialnumber.PhoneNumber::new(291, "8370362")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(291, "7123456"), "ER"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(291, "7123456")), Some("ER"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(291, "7123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(291, "7123456"), "ER") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ER"), Some(@dialnumber.PhoneNumber::new(291, "7123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: ES Spain" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(34, "810123456"), "ES"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(34, "810123456")), Some("ES"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(34, "810123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(34, "810123456"), "ES") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ES"), Some(@dialnumber.PhoneNumber::new(34, "810123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(34, "612345678"), "ES"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(34, "612345678")), Some("ES"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(34, "612345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(34, "612345678"), "ES") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ES"), Some(@dialnumber.PhoneNumber::new(34, "612345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(34, "800123456"), "ES"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(34, "800123456")), Some("ES"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(34, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(34, "803123456"), "ES"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(34, "803123456")), Some("ES"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(34, "803123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(34, "901123456"), "ES"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(34, "901123456")), Some("ES"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(34, "901123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(34, "701234567"), "ES"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(34, "701234567")), Some("ES"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(34, "701234567")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(34, "511234567"), "ES"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(34, "511234567")), Some("ES"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(34, "511234567")), Some(Uan))
}

///|
test "plan examples: ET Ethiopia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(251, "111112345"), "ET"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(251, "111112345")), Some("ET"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(251, "111112345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(251, "111112345"), "ET") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ET"), Some(@dialnumber.PhoneNumber::new(251, "111112345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(251, "911234567"), "ET"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(251, "911234567")), Some("ET"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(251, "911234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(251, "911234567"), "ET") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ET"), Some(@dialnumber.PhoneNumber::new(251, "911234567")))
    None => assert_true(false)
  }
}

///|
test "plan examples: FI Finland" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "131234567"), "FI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "131234567")), Some("FI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "131234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(358, "131234567"), "FI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FI"), Some(@dialnumber.PhoneNumber::new(358, "131234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "412345678"), "FI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "412345678")), Some("FI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "412345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(358, "412345678"), "FI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FI"), Some(@dialnumber.PhoneNumber::new(358, "412345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "800123456"), "FI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "800123456")), Some("FI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "600123456"), "FI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "600123456")), Some("FI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "600123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(358, "10112345"), "FI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(358, "10112345")), Some("FI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(358, "10112345")), Some(Uan))
}

///|
test "plan examples: FJ Fiji" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(679, "3212345"), "FJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(679, "3212345")), Some("FJ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(679, "3212345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(679, "3212345"), "FJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FJ"), Some(@dialnumber.PhoneNumber::new(679, "3212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(679, "7012345"), "FJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(679, "7012345")), Some("FJ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(679, "7012345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(679, "7012345"), "FJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FJ"), Some(@dialnumber.PhoneNumber::new(679, "7012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(679, "08001234567"), "FJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(679, "08001234567")), Some("FJ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(679, "08001234567")), Some(TollFree))
}

///|
test "plan examples: FK Falkland Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(500, "31234"), "FK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(500, "31234")), Some("FK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(500, "31234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(500, "31234"), "FK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FK"), Some(@dialnumber.PhoneNumber::new(500, "31234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(500, "51234"), "FK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(500, "51234")), Some("FK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(500, "51234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(500, "51234"), "FK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FK"), Some(@dialnumber.PhoneNumber::new(500, "51234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: FM Micronesia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(691, "3201234"), "FM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(691, "3201234")), Some("FM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(691, "3201234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(691, "3201234"), "FM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FM"), Some(@dialnumber.PhoneNumber::new(691, "3201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(691, "3501234"), "FM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(691, "3501234")), Some("FM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(691, "3501234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(691, "3501234"), "FM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FM"), Some(@dialnumber.PhoneNumber::new(691, "3501234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: FO Faroe Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(298, "201234"), "FO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(298, "201234")), Some("FO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(298, "201234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(298, "201234"), "FO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FO"), Some(@dialnumber.PhoneNumber::new(298, "201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(298, "211234"), "FO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(298, "211234")), Some("FO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(298, "211234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(298, "211234"), "FO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FO"), Some(@dialnumber.PhoneNumber::new(298, "211234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(298, "802123"), "FO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(298, "802123")), Some("FO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(298, "802123")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(298, "901123"), "FO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(298, "901123")), Some("FO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(298, "901123")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(298, "601234"), "FO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(298, "601234")), Some("FO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(298, "601234")), Some(Voip))
}

///|
test "plan examples: FR France" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(33, "123456789"), "FR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(33, "123456789")), Some("FR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(33, "123456789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(33, "123456789"), "FR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FR"), Some(@dialnumber.PhoneNumber::new(33, "123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(33, "612345678"), "FR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(33, "612345678")), Some("FR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(33, "612345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(33, "612345678"), "FR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "FR"), Some(@dialnumber.PhoneNumber::new(33, "612345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(33, "801234567"), "FR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(33, "801234567")), Some("FR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(33, "801234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(33, "891123456"), "FR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(33, "891123456")), Some("FR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(33, "891123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(33, "884012345"), "FR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(33, "884012345")), Some("FR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(33, "884012345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(33, "912345678"), "FR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(33, "912345678")), Some("FR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(33, "912345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(33, "806123456"), "FR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(33, "806123456")), Some("FR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(33, "806123456")), Some(Uan))
}

///|
test "plan examples: GA Gabon" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(241, "01441234"), "GA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(241, "01441234")), Some("GA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(241, "01441234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(241, "06031234"), "GA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(241, "06031234")), Some("GA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(241, "06031234")), Mobile))
}

///|
test "plan examples: GB United Kingdom" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "1212345678"), "GB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "1212345678")), Some("GB"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "1212345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(44, "1212345678"), "GB") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GB"), Some(@dialnumber.PhoneNumber::new(44, "1212345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7400123456"), "GB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7400123456")), Some("GB"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7400123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(44, "7400123456"), "GB") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GB"), Some(@dialnumber.PhoneNumber::new(44, "7400123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "8001234567"), "GB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "8001234567")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "9012345678"), "GB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "9012345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "9012345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "5612345678"), "GB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "5612345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "5612345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7012345678"), "GB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7012345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7012345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "5512345678"), "GB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "5512345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "5512345678")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7640123456"), "GB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7640123456")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7640123456")), Some(Pager))
}

///|
test "plan examples: GD Grenada" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "4732691234"), "GD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "4732691234")), Some("GD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "4732691234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "4734031234"), "GD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "4734031234")), Some("GD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "4734031234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "GD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "GD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "GD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: GE Georgia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(995, "322123456"), "GE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(995, "322123456")), Some("GE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(995, "322123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(995, "322123456"), "GE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GE"), Some(@dialnumber.PhoneNumber::new(995, "322123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(995, "555123456"), "GE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(995, "555123456")), Some("GE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(995, "555123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(995, "555123456"), "GE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GE"), Some(@dialnumber.PhoneNumber::new(995, "555123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(995, "800123456"), "GE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(995, "800123456")), Some("GE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(995, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(995, "706123456"), "GE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(995, "706123456")), Some("GE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(995, "706123456")), Some(Voip))
}

///|
test "plan examples: GF French Guiana" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(594, "594101234"), "GF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(594, "594101234")), Some("GF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(594, "594101234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(594, "594101234"), "GF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GF"), Some(@dialnumber.PhoneNumber::new(594, "594101234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(594, "694201234"), "GF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(594, "694201234")), Some("GF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(594, "694201234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(594, "694201234"), "GF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GF"), Some(@dialnumber.PhoneNumber::new(594, "694201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(594, "800012345"), "GF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(594, "800012345")), Some("GF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(594, "800012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(594, "890123456"), "GF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(594, "890123456")), Some("GF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(594, "890123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(594, "976012345"), "GF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(594, "976012345")), Some("GF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(594, "976012345")), Some(Voip))
}

///|
test "plan examples: GG Guernsey" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "1481256789"), "GG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "1481256789")), Some("GG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "1481256789")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7781123456"), "GG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7781123456")), Some("GG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7781123456")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "8001234567"), "GG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "8001234567")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "9012345678"), "GG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "9012345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "9012345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "5612345678"), "GG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "5612345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "5612345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7012345678"), "GG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7012345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7012345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "5512345678"), "GG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "5512345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "5512345678")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7640123456"), "GG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7640123456")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7640123456")), Some(Pager))
}

///|
test "plan examples: GH Ghana" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(233, "302345678"), "GH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(233, "302345678")), Some("GH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(233, "302345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(233, "302345678"), "GH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GH"), Some(@dialnumber.PhoneNumber::new(233, "302345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(233, "231234567"), "GH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(233, "231234567")), Some("GH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(233, "231234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(233, "231234567"), "GH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GH"), Some(@dialnumber.PhoneNumber::new(233, "231234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(233, "80012345"), "GH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(233, "80012345")), Some("GH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(233, "80012345")), Some(TollFree))
}

///|
test "plan examples: GI Gibraltar" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(350, "20012345"), "GI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(350, "20012345")), Some("GI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(350, "20012345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(350, "20012345"), "GI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GI"), Some(@dialnumber.PhoneNumber::new(350, "20012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(350, "57123456"), "GI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(350, "57123456")), Some("GI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(350, "57123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(350, "57123456"), "GI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GI"), Some(@dialnumber.PhoneNumber::new(350, "57123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: GL Greenland" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(299, "321000"), "GL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(299, "321000")), Some("GL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(299, "321000")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(299, "321000"), "GL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GL"), Some(@dialnumber.PhoneNumber::new(299, "321000")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(299, "221234"), "GL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(299, "221234")), Some("GL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(299, "221234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(299, "221234"), "GL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GL"), Some(@dialnumber.PhoneNumber::new(299, "221234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(299, "801234"), "GL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(299, "801234")), Some("GL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(299, "801234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(299, "381234"), "GL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(299, "381234")), Some("GL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(299, "381234")), Some(Voip))
}

///|
test "plan examples: GM Gambia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(220, "5661234"), "GM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(220, "5661234")), Some("GM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(220, "5661234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(220, "5661234"), "GM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GM"), Some(@dialnumber.PhoneNumber::new(220, "5661234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(220, "3012345"), "GM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(220, "3012345")), Some("GM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(220, "3012345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(220, "3012345"), "GM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GM"), Some(@dialnumber.PhoneNumber::new(220, "3012345")))
    None => assert_true(false)
  }
}

///|
test "plan examples: GN Guinea" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(224, "30241234"), "GN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(224, "30241234")), Some("GN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(224, "30241234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(224, "30241234"), "GN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GN"), Some(@dialnumber.PhoneNumber::new(224, "30241234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(224, "601123456"), "GN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(224, "601123456")), Some("GN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(224, "601123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(224, "601123456"), "GN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GN"), Some(@dialnumber.PhoneNumber::new(224, "601123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(224, "722123456"), "GN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(224, "722123456")), Some("GN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(224, "722123456")), Some(Voip))
}

///|
test "plan examples: GP Guadeloupe" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "590201234"), "GP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "590201234")), Some("GP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "590201234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(590, "590201234"), "GP") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GP"), Some(@dialnumber.PhoneNumber::new(590, "590201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "690001234"), "GP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "690001234")), Some("GP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "690001234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(590, "690001234"), "GP") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GP"), Some(@dialnumber.PhoneNumber::new(590, "690001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "800012345"), "GP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "800012345")), Some("GP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "800012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "810123456"), "GP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "810123456")), Some("GP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "810123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "976012345"), "GP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "976012345")), Some("GP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "976012345")), Some(Voip))
}

///|
test "plan examples: GQ Equatorial Guinea" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(240, "333091234"), "GQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(240, "333091234")), Some("GQ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(240, "333091234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(240, "333091234"), "GQ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GQ"), Some(@dialnumber.PhoneNumber::new(240, "333091234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(240, "222123456"), "GQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(240, "222123456")), Some("GQ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(240, "222123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(240, "222123456"), "GQ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GQ"), Some(@dialnumber.PhoneNumber::new(240, "222123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(240, "800123456"), "GQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(240, "800123456")), Some("GQ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(240, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(240, "900123456"), "GQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(240, "900123456")), Some("GQ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(240, "900123456")), Some(PremiumRate))
}

///|
test "plan examples: GR Greece" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(30, "2123456789"), "GR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(30, "2123456789")), Some("GR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(30, "2123456789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(30, "2123456789"), "GR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GR"), Some(@dialnumber.PhoneNumber::new(30, "2123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(30, "6912345678"), "GR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(30, "6912345678")), Some("GR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(30, "6912345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(30, "6912345678"), "GR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GR"), Some(@dialnumber.PhoneNumber::new(30, "6912345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(30, "8001234567"), "GR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(30, "8001234567")), Some("GR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(30, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(30, "9091234567"), "GR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(30, "9091234567")), Some("GR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(30, "9091234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(30, "8011234567"), "GR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(30, "8011234567")), Some("GR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(30, "8011234567")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(30, "7012345678"), "GR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(30, "7012345678")), Some("GR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(30, "7012345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(30, "5005000123"), "GR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(30, "5005000123")), Some("GR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(30, "5005000123")), Some(Uan))
}

///|
test "plan examples: GT Guatemala" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(502, "22456789"), "GT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(502, "22456789")), Some("GT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(502, "22456789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(502, "22456789"), "GT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GT"), Some(@dialnumber.PhoneNumber::new(502, "22456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(502, "51234567"), "GT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(502, "51234567")), Some("GT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(502, "51234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(502, "51234567"), "GT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GT"), Some(@dialnumber.PhoneNumber::new(502, "51234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(502, "18001112222"), "GT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(502, "18001112222")), Some("GT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(502, "18001112222")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(502, "19001112222"), "GT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(502, "19001112222")), Some("GT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(502, "19001112222")), Some(PremiumRate))
}

///|
test "plan examples: GU Guam" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6713001234"), "GU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6713001234")), Some("GU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6713001234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6713001234"), "GU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6713001234")), Some("GU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6713001234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "GU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "GU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "GU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: GW Guinea-Bissau" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(245, "443201234"), "GW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(245, "443201234")), Some("GW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(245, "443201234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(245, "443201234"), "GW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GW"), Some(@dialnumber.PhoneNumber::new(245, "443201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(245, "955012345"), "GW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(245, "955012345")), Some("GW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(245, "955012345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(245, "955012345"), "GW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GW"), Some(@dialnumber.PhoneNumber::new(245, "955012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(245, "4012345"), "GW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(245, "4012345")), Some("GW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(245, "4012345")), Some(Voip))
}

///|
test "plan examples: GY Guyana" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(592, "2201234"), "GY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(592, "2201234")), Some("GY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(592, "2201234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(592, "2201234"), "GY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GY"), Some(@dialnumber.PhoneNumber::new(592, "2201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(592, "6091234"), "GY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(592, "6091234")), Some("GY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(592, "6091234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(592, "6091234"), "GY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "GY"), Some(@dialnumber.PhoneNumber::new(592, "6091234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(592, "2891234"), "GY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(592, "2891234")), Some("GY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(592, "2891234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(592, "9008123"), "GY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(592, "9008123")), Some("GY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(592, "9008123")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(592, "5151234"), "GY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(592, "5151234")), Some("GY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(592, "5151234")), Some(Voip))
}

///|
test "plan examples: HK Hong Kong SAR China" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(852, "21234567"), "HK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(852, "21234567")), Some("HK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(852, "21234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(852, "21234567"), "HK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HK"), Some(@dialnumber.PhoneNumber::new(852, "21234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(852, "51234567"), "HK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(852, "51234567")), Some("HK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(852, "51234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(852, "51234567"), "HK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HK"), Some(@dialnumber.PhoneNumber::new(852, "51234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(852, "800123456"), "HK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(852, "800123456")), Some("HK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(852, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(852, "90012345678"), "HK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(852, "90012345678")), Some("HK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(852, "90012345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(852, "81123456"), "HK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(852, "81123456")), Some("HK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(852, "81123456")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(852, "30161234"), "HK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(852, "30161234")), Some("HK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(852, "30161234")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(852, "71123456"), "HK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(852, "71123456")), Some("HK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(852, "71123456")), Some(Pager))
}

///|
test "plan examples: HN Honduras" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(504, "22123456"), "HN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(504, "22123456")), Some("HN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(504, "22123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(504, "22123456"), "HN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HN"), Some(@dialnumber.PhoneNumber::new(504, "22123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(504, "91234567"), "HN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(504, "91234567")), Some("HN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(504, "91234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(504, "91234567"), "HN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HN"), Some(@dialnumber.PhoneNumber::new(504, "91234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(504, "80021234567"), "HN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(504, "80021234567")), Some("HN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(504, "80021234567")), Some(TollFree))
}

///|
test "plan examples: HR Croatia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(385, "12345678"), "HR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(385, "12345678")), Some("HR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(385, "12345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(385, "12345678"), "HR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HR"), Some(@dialnumber.PhoneNumber::new(385, "12345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(385, "921234567"), "HR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(385, "921234567")), Some("HR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(385, "921234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(385, "921234567"), "HR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HR"), Some(@dialnumber.PhoneNumber::new(385, "921234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(385, "800123456"), "HR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(385, "800123456")), Some("HR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(385, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(385, "6001234"), "HR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(385, "6001234")), Some("HR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(385, "6001234")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(385, "74123456"), "HR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(385, "74123456")), Some("HR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(385, "74123456")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(385, "62123456"), "HR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(385, "62123456")), Some("HR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(385, "62123456")), Some(Uan))
}

///|
test "plan examples: HT Haiti" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(509, "22453300"), "HT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(509, "22453300")), Some("HT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(509, "22453300")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(509, "22453300"), "HT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HT"), Some(@dialnumber.PhoneNumber::new(509, "22453300")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(509, "34101234"), "HT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(509, "34101234")), Some("HT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(509, "34101234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(509, "34101234"), "HT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HT"), Some(@dialnumber.PhoneNumber::new(509, "34101234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(509, "80012345"), "HT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(509, "80012345")), Some("HT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(509, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(509, "98901234"), "HT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(509, "98901234")), Some("HT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(509, "98901234")), Some(Voip))
}

///|
test "plan examples: HU Hungary" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(36, "12345678"), "HU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(36, "12345678")), Some("HU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(36, "12345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(36, "12345678"), "HU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HU"), Some(@dialnumber.PhoneNumber::new(36, "12345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(36, "201234567"), "HU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(36, "201234567")), Some("HU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(36, "201234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(36, "201234567"), "HU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "HU"), Some(@dialnumber.PhoneNumber::new(36, "201234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(36, "80123456"), "HU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(36, "80123456")), Some("HU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(36, "80123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(36, "90123456"), "HU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(36, "90123456")), Some("HU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(36, "90123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(36, "211234567"), "HU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(36, "211234567")), Some("HU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(36, "211234567")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(36, "381234567"), "HU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(36, "381234567")), Some("HU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(36, "381234567")), Some(Uan))
}

///|
test "plan examples: ID Indonesia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(62, "218350123"), "ID"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(62, "218350123")), Some("ID"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(62, "218350123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(62, "218350123"), "ID") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ID"), Some(@dialnumber.PhoneNumber::new(62, "218350123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(62, "812345678"), "ID"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(62, "812345678")), Some("ID"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(62, "812345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(62, "812345678"), "ID") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ID"), Some(@dialnumber.PhoneNumber::new(62, "812345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(62, "8001234567"), "ID"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(62, "8001234567")), Some("ID"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(62, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(62, "8091234567"), "ID"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(62, "8091234567")), Some("ID"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(62, "8091234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(62, "8041234567"), "ID"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(62, "8041234567")), Some("ID"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(62, "8041234567")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(62, "8071123456"), "ID"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(62, "8071123456")), Some("ID"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(62, "8071123456")), Some(Uan))
}

///|
test "plan examples: IE Ireland" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(353, "2212345"), "IE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(353, "2212345")), Some("IE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(353, "2212345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(353, "2212345"), "IE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IE"), Some(@dialnumber.PhoneNumber::new(353, "2212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(353, "850123456"), "IE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(353, "850123456")), Some("IE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(353, "850123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(353, "850123456"), "IE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IE"), Some(@dialnumber.PhoneNumber::new(353, "850123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(353, "1800123456"), "IE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(353, "1800123456")), Some("IE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(353, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(353, "1520123456"), "IE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(353, "1520123456")), Some("IE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(353, "1520123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(353, "1850123456"), "IE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(353, "1850123456")), Some("IE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(353, "1850123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(353, "761234567"), "IE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(353, "761234567")), Some("IE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(353, "761234567")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(353, "700123456"), "IE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(353, "700123456")), Some("IE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(353, "700123456")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(353, "818123456"), "IE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(353, "818123456")), Some("IE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(353, "818123456")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(353, "8551234567"), "IE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(353, "8551234567")), Some("IE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(353, "8551234567")), Some(Voicemail))
}

///|
test "plan examples: IL Israel" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(972, "21234567"), "IL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(972, "21234567")), Some("IL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(972, "21234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(972, "21234567"), "IL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IL"), Some(@dialnumber.PhoneNumber::new(972, "21234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(972, "502345678"), "IL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(972, "502345678")), Some("IL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(972, "502345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(972, "502345678"), "IL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IL"), Some(@dialnumber.PhoneNumber::new(972, "502345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(972, "1800123456"), "IL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(972, "1800123456")), Some("IL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(972, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(972, "1919123456"), "IL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(972, "1919123456")), Some("IL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(972, "1919123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(972, "1700123456"), "IL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(972, "1700123456")), Some("IL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(972, "1700123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(972, "771234567"), "IL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(972, "771234567")), Some("IL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(972, "771234567")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(972, "1599123456"), "IL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(972, "1599123456")), Some("IL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(972, "1599123456")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(972, "15112340000"), "IL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(972, "15112340000")), Some("IL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(972, "15112340000")), Some(Voicemail))
}

///|
test "plan examples: IM Isle of Man" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "1624756789"), "IM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "1624756789")), Some("IM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "1624756789")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7924123456"), "IM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7924123456")), Some("GB"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7924123456")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "8081624567"), "IM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "8081624567")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "8081624567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "9016247890"), "IM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "9016247890")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "9016247890")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "5612345678"), "IM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "5612345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "5612345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7012345678"), "IM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7012345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7012345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "5512345678"), "IM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "5512345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "5512345678")), Some(Uan))
}

///|
test "plan examples: IN India" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(91, "7410410123"), "IN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(91, "7410410123")), Some("IN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(91, "7410410123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(91, "7410410123"), "IN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IN"), Some(@dialnumber.PhoneNumber::new(91, "7410410123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(91, "8123456789"), "IN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(91, "8123456789")), Some("IN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(91, "8123456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(91, "8123456789"), "IN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IN"), Some(@dialnumber.PhoneNumber::new(91, "8123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(91, "1800123456"), "IN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(91, "1800123456")), Some("IN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(91, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(91, "1861123456789"), "IN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(91, "1861123456789")), Some("IN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(91, "1861123456789")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(91, "18603451234"), "IN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(91, "18603451234")), Some("IN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(91, "18603451234")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(91, "1409305260"), "IN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(91, "1409305260")), Some("IN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(91, "1409305260")), Some(Uan))
}

///|
test "plan examples: IO British Indian Ocean Territory" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(246, "3709100"), "IO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(246, "3709100")), Some("IO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(246, "3709100")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(246, "3709100"), "IO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IO"), Some(@dialnumber.PhoneNumber::new(246, "3709100")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(246, "3801234"), "IO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(246, "3801234")), Some("IO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(246, "3801234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(246, "3801234"), "IO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IO"), Some(@dialnumber.PhoneNumber::new(246, "3801234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: IQ Iraq" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(964, "12345678"), "IQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(964, "12345678")), Some("IQ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(964, "12345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(964, "12345678"), "IQ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IQ"), Some(@dialnumber.PhoneNumber::new(964, "12345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(964, "7912345678"), "IQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(964, "7912345678")), Some("IQ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(964, "7912345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(964, "7912345678"), "IQ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IQ"), Some(@dialnumber.PhoneNumber::new(964, "7912345678")))
    None => assert_true(false)
  }
}

///|
test "plan examples: IR Iran" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(98, "2123456789"), "IR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(98, "2123456789")), Some("IR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(98, "2123456789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(98, "2123456789"), "IR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IR"), Some(@dialnumber.PhoneNumber::new(98, "2123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(98, "9123456789"), "IR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(98, "9123456789")), Some("IR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(98, "9123456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(98, "9123456789"), "IR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IR"), Some(@dialnumber.PhoneNumber::new(98, "9123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(98, "9601"), "IR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(98, "9601")), Some("IR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(98, "9601")), Some(Uan))
}

///|
test "plan examples: IS Iceland" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(354, "4101234"), "IS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(354, "4101234")), Some("IS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(354, "4101234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(354, "4101234"), "IS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IS"), Some(@dialnumber.PhoneNumber::new(354, "4101234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(354, "6111234"), "IS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(354, "6111234")), Some("IS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(354, "6111234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(354, "6111234"), "IS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IS"), Some(@dialnumber.PhoneNumber::new(354, "6111234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(354, "8001234"), "IS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(354, "8001234")), Some("IS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(354, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(354, "9001234"), "IS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(354, "9001234")), Some("IS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(354, "9001234")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(354, "4921234"), "IS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(354, "4921234")), Some("IS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(354, "4921234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(354, "8091234"), "IS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(354, "8091234")), Some("IS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(354, "8091234")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(354, "6891234"), "IS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(354, "6891234")), Some("IS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(354, "6891234")), Some(Voicemail))
}

///|
test "plan examples: IT Italy" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "0212345678"), "IT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "0212345678")), Some("IT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "0212345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(39, "0212345678"), "IT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IT"), Some(@dialnumber.PhoneNumber::new(39, "0212345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "3123456789"), "IT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "3123456789")), Some("IT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "3123456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(39, "3123456789"), "IT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "IT"), Some(@dialnumber.PhoneNumber::new(39, "3123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "800123456"), "IT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "800123456")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "899123456"), "IT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "899123456")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "899123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "848123456"), "IT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "848123456")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "848123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "5512345678"), "IT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "5512345678")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "5512345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "1781234567"), "IT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "1781234567")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "1781234567")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "33101234501"), "IT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "33101234501")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "33101234501")), Some(Voicemail))
}

///|
test "plan examples: JE Jersey" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "1534456789"), "JE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "1534456789")), Some("JE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "1534456789")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7797712345"), "JE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7797712345")), Some("JE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7797712345")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "8007354567"), "JE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "8007354567")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "8007354567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "9018105678"), "JE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "9018105678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "9018105678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "5612345678"), "JE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "5612345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "5612345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7015115678"), "JE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7015115678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7015115678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "5512345678"), "JE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "5512345678")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "5512345678")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(44, "7640123456"), "JE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(44, "7640123456")), Some("GB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(44, "7640123456")), Some(Pager))
}

///|
test "plan examples: JM Jamaica" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8765230123"), "JM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8765230123")), Some("JM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8765230123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "8765230123"), "JM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "JM"), Some(@dialnumber.PhoneNumber::new(1, "8765230123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8762101234"), "JM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8762101234")), Some("JM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8762101234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "8762101234"), "JM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "JM"), Some(@dialnumber.PhoneNumber::new(1, "8762101234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "JM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "JM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "JM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: JO Jordan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(962, "62001234"), "JO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(962, "62001234")), Some("JO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(962, "62001234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(962, "62001234"), "JO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "JO"), Some(@dialnumber.PhoneNumber::new(962, "62001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(962, "790123456"), "JO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(962, "790123456")), Some("JO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(962, "790123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(962, "790123456"), "JO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "JO"), Some(@dialnumber.PhoneNumber::new(962, "790123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(962, "80012345"), "JO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(962, "80012345")), Some("JO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(962, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(962, "90012345"), "JO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(962, "90012345")), Some("JO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(962, "90012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(962, "85012345"), "JO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(962, "85012345")), Some("JO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(962, "85012345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(962, "700123456"), "JO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(962, "700123456")), Some("JO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(962, "700123456")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(962, "88101234"), "JO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(962, "88101234")), Some("JO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(962, "88101234")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(962, "746612345"), "JO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(962, "746612345")), Some("JO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(962, "746612345")), Some(Pager))
}

///|
test "plan examples: JP Japan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(81, "312345678"), "JP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(81, "312345678")), Some("JP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(81, "312345678")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(81, "9012345678"), "JP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(81, "9012345678")), Some("JP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(81, "9012345678")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(81, "120123456"), "JP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(81, "120123456")), Some("JP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(81, "120123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(81, "990123456"), "JP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(81, "990123456")), Some("JP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(81, "990123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(81, "5012345678"), "JP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(81, "5012345678")), Some("JP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(81, "5012345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(81, "601234567"), "JP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(81, "601234567")), Some("JP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(81, "601234567")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(81, "570123456"), "JP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(81, "570123456")), Some("JP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(81, "570123456")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(81, "2012345678"), "JP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(81, "2012345678")), Some("JP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(81, "2012345678")), Some(Pager))
}

///|
test "plan examples: KE Kenya" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(254, "202012345"), "KE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(254, "202012345")), Some("KE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(254, "202012345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(254, "202012345"), "KE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KE"), Some(@dialnumber.PhoneNumber::new(254, "202012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(254, "712123456"), "KE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(254, "712123456")), Some("KE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(254, "712123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(254, "712123456"), "KE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KE"), Some(@dialnumber.PhoneNumber::new(254, "712123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(254, "800223456"), "KE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(254, "800223456")), Some("KE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(254, "800223456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(254, "900223456"), "KE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(254, "900223456")), Some("KE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(254, "900223456")), Some(PremiumRate))
}

///|
test "plan examples: KG Kyrgyzstan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(996, "312123456"), "KG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(996, "312123456")), Some("KG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(996, "312123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(996, "312123456"), "KG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KG"), Some(@dialnumber.PhoneNumber::new(996, "312123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(996, "700123456"), "KG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(996, "700123456")), Some("KG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(996, "700123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(996, "700123456"), "KG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KG"), Some(@dialnumber.PhoneNumber::new(996, "700123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(996, "800123456"), "KG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(996, "800123456")), Some("KG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(996, "800123456")), Some(TollFree))
}

///|
test "plan examples: KH Cambodia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(855, "23756789"), "KH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(855, "23756789")), Some("KH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(855, "23756789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(855, "23756789"), "KH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KH"), Some(@dialnumber.PhoneNumber::new(855, "23756789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(855, "91234567"), "KH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(855, "91234567")), Some("KH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(855, "91234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(855, "91234567"), "KH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KH"), Some(@dialnumber.PhoneNumber::new(855, "91234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(855, "1800123456"), "KH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(855, "1800123456")), Some("KH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(855, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(855, "1900123456"), "KH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(855, "1900123456")), Some("KH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(855, "1900123456")), Some(PremiumRate))
}

///|
test "plan examples: KI Kiribati" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(686, "31234"), "KI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(686, "31234")), Some("KI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(686, "31234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(686, "31234"), "KI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KI"), Some(@dialnumber.PhoneNumber::new(686, "31234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(686, "72001234"), "KI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(686, "72001234")), Some("KI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(686, "72001234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(686, "72001234"), "KI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KI"), Some(@dialnumber.PhoneNumber::new(686, "72001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(686, "30010000"), "KI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(686, "30010000")), Some("KI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(686, "30010000")), Some(Voip))
}

///|
test "plan examples: KM Comoros" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(269, "7712345"), "KM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(269, "7712345")), Some("KM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(269, "7712345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(269, "7712345"), "KM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KM"), Some(@dialnumber.PhoneNumber::new(269, "7712345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(269, "3212345"), "KM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(269, "3212345")), Some("KM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(269, "3212345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(269, "3212345"), "KM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KM"), Some(@dialnumber.PhoneNumber::new(269, "3212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(269, "8001234"), "KM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(269, "8001234")), Some("KM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(269, "8001234")), Some(PremiumRate))
}

///|
test "plan examples: KN St. Kitts & Nevis" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8692361234"), "KN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8692361234")), Some("KN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8692361234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8697652917"), "KN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8697652917")), Some("KN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8697652917")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "KN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "KN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "KN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: KP North Korea" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(850, "21234567"), "KP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(850, "21234567")), Some("KP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(850, "21234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(850, "21234567"), "KP") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KP"), Some(@dialnumber.PhoneNumber::new(850, "21234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(850, "1921234567"), "KP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(850, "1921234567")), Some("KP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(850, "1921234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(850, "1921234567"), "KP") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KP"), Some(@dialnumber.PhoneNumber::new(850, "1921234567")))
    None => assert_true(false)
  }
}

///|
test "plan examples: KR South Korea" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(82, "22123456"), "KR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(82, "22123456")), Some("KR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(82, "22123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(82, "22123456"), "KR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KR"), Some(@dialnumber.PhoneNumber::new(82, "22123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(82, "1020000000"), "KR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(82, "1020000000")), Some("KR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(82, "1020000000")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(82, "1020000000"), "KR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KR"), Some(@dialnumber.PhoneNumber::new(82, "1020000000")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(82, "801234567"), "KR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(82, "801234567")), Some("KR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(82, "801234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(82, "602345678"), "KR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(82, "602345678")), Some("KR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(82, "602345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(82, "7012345678"), "KR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(82, "7012345678")), Some("KR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(82, "7012345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(82, "5012345678"), "KR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(82, "5012345678")), Some("KR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(82, "5012345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(82, "15441234"), "KR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(82, "15441234")), Some("KR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(82, "15441234")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(82, "1523456789"), "KR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(82, "1523456789")), Some("KR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(82, "1523456789")), Some(Pager))
}

///|
test "plan examples: KW Kuwait" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(965, "22345678"), "KW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(965, "22345678")), Some("KW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(965, "22345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(965, "22345678"), "KW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KW"), Some(@dialnumber.PhoneNumber::new(965, "22345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(965, "50012345"), "KW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(965, "50012345")), Some("KW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(965, "50012345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(965, "50012345"), "KW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KW"), Some(@dialnumber.PhoneNumber::new(965, "50012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(965, "1801234"), "KW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(965, "1801234")), Some("KW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(965, "1801234")), Some(TollFree))
}

///|
test "plan examples: KY Cayman Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "3452221234"), "KY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "3452221234")), Some("KY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "3452221234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "3453231234"), "KY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "3453231234")), Some("KY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "3453231234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002345678"), "KY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002345678")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002345678"), "KY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "KY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: KZ Kazakhstan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "7123456789"), "KZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "7123456789")), Some("KZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "7123456789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(7, "7123456789"), "KZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KZ"), Some(@dialnumber.PhoneNumber::new(7, "7123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "7710009998"), "KZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "7710009998")), Some("KZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "7710009998")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(7, "7710009998"), "KZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "KZ"), Some(@dialnumber.PhoneNumber::new(7, "7710009998")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "8001234567"), "KZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "8001234567")), Some("RU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "8091234567"), "KZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "8091234567")), Some("RU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "8091234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "7511234567"), "KZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "7511234567")), Some("KZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "7511234567")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "8081234567"), "KZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "8081234567")), Some("RU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "8081234567")), Some(PersonalNumber))
}

///|
test "plan examples: LA Laos" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(856, "21212862"), "LA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(856, "21212862")), Some("LA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(856, "21212862")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(856, "21212862"), "LA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LA"), Some(@dialnumber.PhoneNumber::new(856, "21212862")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(856, "2023123456"), "LA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(856, "2023123456")), Some("LA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(856, "2023123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(856, "2023123456"), "LA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LA"), Some(@dialnumber.PhoneNumber::new(856, "2023123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: LB Lebanon" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(961, "1123456"), "LB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(961, "1123456")), Some("LB"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(961, "1123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(961, "1123456"), "LB") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LB"), Some(@dialnumber.PhoneNumber::new(961, "1123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(961, "71123456"), "LB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(961, "71123456")), Some("LB"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(961, "71123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(961, "71123456"), "LB") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LB"), Some(@dialnumber.PhoneNumber::new(961, "71123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(961, "90123456"), "LB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(961, "90123456")), Some("LB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(961, "90123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(961, "80123456"), "LB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(961, "80123456")), Some("LB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(961, "80123456")), Some(SharedCost))
}

///|
test "plan examples: LC St. Lucia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7584305678"), "LC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7584305678")), Some("LC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7584305678")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7582845678"), "LC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7582845678")), Some("LC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7582845678")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "LC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "LC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "LC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: LI Liechtenstein" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(423, "2345678"), "LI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(423, "2345678")), Some("LI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(423, "2345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(423, "2345678"), "LI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LI"), Some(@dialnumber.PhoneNumber::new(423, "2345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(423, "660234567"), "LI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(423, "660234567")), Some("LI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(423, "660234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(423, "660234567"), "LI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LI"), Some(@dialnumber.PhoneNumber::new(423, "660234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(423, "8002222"), "LI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(423, "8002222")), Some("LI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(423, "8002222")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(423, "9002222"), "LI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(423, "9002222")), Some("LI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(423, "9002222")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(423, "8702812"), "LI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(423, "8702812")), Some("LI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(423, "8702812")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(423, "697861234"), "LI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(423, "697861234")), Some("LI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(423, "697861234")), Some(Voicemail))
}

///|
test "plan examples: LK Sri Lanka" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(94, "112345678"), "LK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(94, "112345678")), Some("LK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(94, "112345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(94, "112345678"), "LK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LK"), Some(@dialnumber.PhoneNumber::new(94, "112345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(94, "712345678"), "LK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(94, "712345678")), Some("LK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(94, "712345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(94, "712345678"), "LK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LK"), Some(@dialnumber.PhoneNumber::new(94, "712345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(94, "197312345"), "LK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(94, "197312345")), Some("LK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(94, "197312345")), Some(Uan))
}

///|
test "plan examples: LR Liberia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(231, "21234567"), "LR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(231, "21234567")), Some("LR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(231, "21234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(231, "21234567"), "LR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LR"), Some(@dialnumber.PhoneNumber::new(231, "21234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(231, "770123456"), "LR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(231, "770123456")), Some("LR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(231, "770123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(231, "770123456"), "LR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LR"), Some(@dialnumber.PhoneNumber::new(231, "770123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(231, "332021234"), "LR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(231, "332021234")), Some("LR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(231, "332021234")), Some(PremiumRate))
}

///|
test "plan examples: LS Lesotho" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(266, "22123456"), "LS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(266, "22123456")), Some("LS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(266, "22123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(266, "22123456"), "LS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LS"), Some(@dialnumber.PhoneNumber::new(266, "22123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(266, "50123456"), "LS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(266, "50123456")), Some("LS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(266, "50123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(266, "50123456"), "LS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LS"), Some(@dialnumber.PhoneNumber::new(266, "50123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(266, "80021234"), "LS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(266, "80021234")), Some("LS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(266, "80021234")), Some(TollFree))
}

///|
test "plan examples: LT Lithuania" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(370, "31234567"), "LT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(370, "31234567")), Some("LT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(370, "31234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(370, "31234567"), "LT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LT"), Some(@dialnumber.PhoneNumber::new(370, "31234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(370, "61234567"), "LT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(370, "61234567")), Some("LT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(370, "61234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(370, "61234567"), "LT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LT"), Some(@dialnumber.PhoneNumber::new(370, "61234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(370, "80012345"), "LT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(370, "80012345")), Some("LT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(370, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(370, "90012345"), "LT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(370, "90012345")), Some("LT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(370, "90012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(370, "80812345"), "LT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(370, "80812345")), Some("LT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(370, "80812345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(370, "80123456"), "LT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(370, "80123456")), Some("LT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(370, "80123456")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(370, "70012345"), "LT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(370, "70012345")), Some("LT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(370, "70012345")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(370, "70712345"), "LT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(370, "70712345")), Some("LT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(370, "70712345")), Some(Uan))
}

///|
test "plan examples: LU Luxembourg" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(352, "27123456"), "LU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(352, "27123456")), Some("LU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(352, "27123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(352, "27123456"), "LU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LU"), Some(@dialnumber.PhoneNumber::new(352, "27123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(352, "628123456"), "LU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(352, "628123456")), Some("LU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(352, "628123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(352, "628123456"), "LU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LU"), Some(@dialnumber.PhoneNumber::new(352, "628123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(352, "80012345"), "LU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(352, "80012345")), Some("LU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(352, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(352, "90012345"), "LU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(352, "90012345")), Some("LU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(352, "90012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(352, "80112345"), "LU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(352, "80112345")), Some("LU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(352, "80112345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(352, "20201234"), "LU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(352, "20201234")), Some("LU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(352, "20201234")), Some(Voip))
}

///|
test "plan examples: LV Latvia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(371, "63123456"), "LV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(371, "63123456")), Some("LV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(371, "63123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(371, "63123456"), "LV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LV"), Some(@dialnumber.PhoneNumber::new(371, "63123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(371, "21234567"), "LV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(371, "21234567")), Some("LV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(371, "21234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(371, "21234567"), "LV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LV"), Some(@dialnumber.PhoneNumber::new(371, "21234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(371, "80123456"), "LV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(371, "80123456")), Some("LV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(371, "80123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(371, "90123456"), "LV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(371, "90123456")), Some("LV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(371, "90123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(371, "81123456"), "LV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(371, "81123456")), Some("LV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(371, "81123456")), Some(SharedCost))
}

///|
test "plan examples: LY Libya" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(218, "212345678"), "LY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(218, "212345678")), Some("LY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(218, "212345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(218, "212345678"), "LY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LY"), Some(@dialnumber.PhoneNumber::new(218, "212345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(218, "912345678"), "LY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(218, "912345678")), Some("LY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(218, "912345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(218, "912345678"), "LY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "LY"), Some(@dialnumber.PhoneNumber::new(218, "912345678")))
    None => assert_true(false)
  }
}

///|
test "plan examples: MA Morocco" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "520123456"), "MA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "520123456")), Some("MA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "520123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(212, "520123456"), "MA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MA"), Some(@dialnumber.PhoneNumber::new(212, "520123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "650123456"), "MA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "650123456")), Some("MA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "650123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(212, "650123456"), "MA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MA"), Some(@dialnumber.PhoneNumber::new(212, "650123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "801234567"), "MA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "801234567")), Some("MA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "801234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "891234567"), "MA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "891234567")), Some("MA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "891234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(212, "592401234"), "MA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(212, "592401234")), Some("MA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(212, "592401234")), Some(Voip))
}

///|
test "plan examples: MC Monaco" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(377, "99123456"), "MC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(377, "99123456")), Some("MC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(377, "99123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(377, "99123456"), "MC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MC"), Some(@dialnumber.PhoneNumber::new(377, "99123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(377, "612345678"), "MC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(377, "612345678")), Some("MC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(377, "612345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(377, "612345678"), "MC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MC"), Some(@dialnumber.PhoneNumber::new(377, "612345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(377, "90123456"), "MC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(377, "90123456")), Some("MC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(377, "90123456")), Some(TollFree))
}

///|
test "plan examples: MD Moldova" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(373, "22212345"), "MD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(373, "22212345")), Some("MD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(373, "22212345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(373, "22212345"), "MD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MD"), Some(@dialnumber.PhoneNumber::new(373, "22212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(373, "62112345"), "MD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(373, "62112345")), Some("MD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(373, "62112345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(373, "62112345"), "MD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MD"), Some(@dialnumber.PhoneNumber::new(373, "62112345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(373, "80012345"), "MD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(373, "80012345")), Some("MD"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(373, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(373, "90012345"), "MD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(373, "90012345")), Some("MD"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(373, "90012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(373, "80812345"), "MD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(373, "80812345")), Some("MD"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(373, "80812345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(373, "30123456"), "MD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(373, "30123456")), Some("MD"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(373, "30123456")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(373, "80312345"), "MD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(373, "80312345")), Some("MD"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(373, "80312345")), Some(Uan))
}

///|
test "plan examples: ME Montenegro" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(382, "30234567"), "ME"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(382, "30234567")), Some("ME"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(382, "30234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(382, "30234567"), "ME") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ME"), Some(@dialnumber.PhoneNumber::new(382, "30234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(382, "60123456"), "ME"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(382, "60123456")), Some("ME"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(382, "60123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(382, "60123456"), "ME") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ME"), Some(@dialnumber.PhoneNumber::new(382, "60123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(382, "80080002"), "ME"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(382, "80080002")), Some("ME"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(382, "80080002")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(382, "94515151"), "ME"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(382, "94515151")), Some("ME"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(382, "94515151")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(382, "78108780"), "ME"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(382, "78108780")), Some("ME"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(382, "78108780")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(382, "77273012"), "ME"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(382, "77273012")), Some("ME"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(382, "77273012")), Some(Uan))
}

///|
test "plan examples: MF St. Martin" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "590271234"), "MF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "590271234")), Some("BL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "590271234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(590, "590271234"), "MF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MF"), Some(@dialnumber.PhoneNumber::new(590, "590271234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "690001234"), "MF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "690001234")), Some("GP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "690001234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(590, "690001234"), "MF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MF"), Some(@dialnumber.PhoneNumber::new(590, "690001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "800012345"), "MF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "800012345")), Some("GP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "800012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "810123456"), "MF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "810123456")), Some("GP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "810123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(590, "976012345"), "MF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(590, "976012345")), Some("GP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(590, "976012345")), Some(Voip))
}

///|
test "plan examples: MG Madagascar" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(261, "202123456"), "MG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(261, "202123456")), Some("MG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(261, "202123456")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(261, "321234567"), "MG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(261, "321234567")), Some("MG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(261, "321234567")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(261, "221234567"), "MG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(261, "221234567")), Some("MG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(261, "221234567")), Some(Voip))
}

///|
test "plan examples: MH Marshall Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(692, "2471234"), "MH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(692, "2471234")), Some("MH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(692, "2471234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(692, "2471234"), "MH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MH"), Some(@dialnumber.PhoneNumber::new(692, "2471234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(692, "2351234"), "MH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(692, "2351234")), Some("MH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(692, "2351234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(692, "2351234"), "MH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MH"), Some(@dialnumber.PhoneNumber::new(692, "2351234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(692, "6351234"), "MH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(692, "6351234")), Some("MH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(692, "6351234")), Some(Voip))
}

///|
test "plan examples: MK North Macedonia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(389, "22012345"), "MK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(389, "22012345")), Some("MK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(389, "22012345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(389, "22012345"), "MK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MK"), Some(@dialnumber.PhoneNumber::new(389, "22012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(389, "72345678"), "MK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(389, "72345678")), Some("MK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(389, "72345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(389, "72345678"), "MK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MK"), Some(@dialnumber.PhoneNumber::new(389, "72345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(389, "80012345"), "MK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(389, "80012345")), Some("MK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(389, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(389, "50012345"), "MK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(389, "50012345")), Some("MK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(389, "50012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(389, "80123456"), "MK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(389, "80123456")), Some("MK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(389, "80123456")), Some(SharedCost))
}

///|
test "plan examples: ML Mali" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(223, "20212345"), "ML"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(223, "20212345")), Some("ML"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(223, "20212345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(223, "20212345"), "ML") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ML"), Some(@dialnumber.PhoneNumber::new(223, "20212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(223, "65012345"), "ML"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(223, "65012345")), Some("ML"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(223, "65012345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(223, "65012345"), "ML") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ML"), Some(@dialnumber.PhoneNumber::new(223, "65012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(223, "80012345"), "ML"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(223, "80012345")), Some("ML"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(223, "80012345")), Some(TollFree))
}

///|
test "plan examples: MM Myanmar (Burma)" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(95, "1234567"), "MM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(95, "1234567")), Some("MM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(95, "1234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(95, "1234567"), "MM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MM"), Some(@dialnumber.PhoneNumber::new(95, "1234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(95, "92123456"), "MM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(95, "92123456")), Some("MM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(95, "92123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(95, "92123456"), "MM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MM"), Some(@dialnumber.PhoneNumber::new(95, "92123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(95, "8008001234"), "MM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(95, "8008001234")), Some("MM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(95, "8008001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(95, "13331234"), "MM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(95, "13331234")), Some("MM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(95, "13331234")), Some(Voip))
}

///|
test "plan examples: MN Mongolia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(976, "53123456"), "MN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(976, "53123456")), Some("MN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(976, "53123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(976, "53123456"), "MN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MN"), Some(@dialnumber.PhoneNumber::new(976, "53123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(976, "88123456"), "MN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(976, "88123456")), Some("MN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(976, "88123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(976, "88123456"), "MN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MN"), Some(@dialnumber.PhoneNumber::new(976, "88123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(976, "75123456"), "MN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(976, "75123456")), Some("MN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(976, "75123456")), Some(Voip))
}

///|
test "plan examples: MO Macao SAR China" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(853, "28212345"), "MO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(853, "28212345")), Some("MO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(853, "28212345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(853, "28212345"), "MO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MO"), Some(@dialnumber.PhoneNumber::new(853, "28212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(853, "66123456"), "MO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(853, "66123456")), Some("MO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(853, "66123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(853, "66123456"), "MO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MO"), Some(@dialnumber.PhoneNumber::new(853, "66123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(853, "0800501"), "MO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(853, "0800501")), Some("MO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(853, "0800501")), Some(TollFree))
}

///|
test "plan examples: MP Northern Mariana Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6702345678"), "MP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6702345678")), Some("MP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6702345678")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6702345678"), "MP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6702345678")), Some("MP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6702345678")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "MP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "MP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "MP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: MQ Martinique" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(596, "596301234"), "MQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(596, "596301234")), Some("MQ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(596, "596301234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(596, "596301234"), "MQ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MQ"), Some(@dialnumber.PhoneNumber::new(596, "596301234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(596, "696201234"), "MQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(596, "696201234")), Some("MQ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(596, "696201234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(596, "696201234"), "MQ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MQ"), Some(@dialnumber.PhoneNumber::new(596, "696201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(596, "800012345"), "MQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(596, "800012345")), Some("MQ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(596, "800012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(596, "810123456"), "MQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(596, "810123456")), Some("MQ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(596, "810123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(596, "976612345"), "MQ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(596, "976612345")), Some("MQ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(596, "976612345")), Some(Voip))
}

///|
test "plan examples: MR Mauritania" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(222, "35123456"), "MR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(222, "35123456")), Some("MR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(222, "35123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(222, "35123456"), "MR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MR"), Some(@dialnumber.PhoneNumber::new(222, "35123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(222, "22123456"), "MR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(222, "22123456")), Some("MR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(222, "22123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(222, "22123456"), "MR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MR"), Some(@dialnumber.PhoneNumber::new(222, "22123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(222, "80012345"), "MR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(222, "80012345")), Some("MR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(222, "80012345")), Some(TollFree))
}

///|
test "plan examples: MS Montserrat" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6644912345"), "MS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6644912345")), Some("MS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6644912345")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6644923456"), "MS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6644923456")), Some("MS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6644923456")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "MS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "MS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "MS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: MT Malta" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(356, "21001234"), "MT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(356, "21001234")), Some("MT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(356, "21001234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(356, "21001234"), "MT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MT"), Some(@dialnumber.PhoneNumber::new(356, "21001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(356, "96961234"), "MT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(356, "96961234")), Some("MT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(356, "96961234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(356, "96961234"), "MT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MT"), Some(@dialnumber.PhoneNumber::new(356, "96961234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(356, "80071234"), "MT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(356, "80071234")), Some("MT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(356, "80071234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(356, "50037123"), "MT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(356, "50037123")), Some("MT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(356, "50037123")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(356, "35501234"), "MT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(356, "35501234")), Some("MT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(356, "35501234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(356, "50112345"), "MT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(356, "50112345")), Some("MT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(356, "50112345")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(356, "71171234"), "MT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(356, "71171234")), Some("MT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(356, "71171234")), Some(Pager))
}

///|
test "plan examples: MU Mauritius" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(230, "54480123"), "MU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(230, "54480123")), Some("MU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(230, "54480123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(230, "54480123"), "MU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MU"), Some(@dialnumber.PhoneNumber::new(230, "54480123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(230, "52512345"), "MU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(230, "52512345")), Some("MU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(230, "52512345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(230, "52512345"), "MU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MU"), Some(@dialnumber.PhoneNumber::new(230, "52512345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(230, "8001234"), "MU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(230, "8001234")), Some("MU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(230, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(230, "3012345"), "MU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(230, "3012345")), Some("MU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(230, "3012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(230, "3201234"), "MU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(230, "3201234")), Some("MU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(230, "3201234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(230, "2190123"), "MU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(230, "2190123")), Some("MU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(230, "2190123")), Some(Pager))
}

///|
test "plan examples: MV Maldives" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(960, "6701234"), "MV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(960, "6701234")), Some("MV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(960, "6701234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(960, "6701234"), "MV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MV"), Some(@dialnumber.PhoneNumber::new(960, "6701234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(960, "7712345"), "MV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(960, "7712345")), Some("MV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(960, "7712345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(960, "7712345"), "MV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MV"), Some(@dialnumber.PhoneNumber::new(960, "7712345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(960, "8001234567"), "MV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(960, "8001234567")), Some("MV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(960, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(960, "9001234567"), "MV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(960, "9001234567")), Some("MV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(960, "9001234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(960, "4001234"), "MV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(960, "4001234")), Some("MV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(960, "4001234")), Some(Uan))
}

///|
test "plan examples: MW Malawi" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(265, "1234567"), "MW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(265, "1234567")), Some("MW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(265, "1234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(265, "1234567"), "MW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MW"), Some(@dialnumber.PhoneNumber::new(265, "1234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(265, "991234567"), "MW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(265, "991234567")), Some("MW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(265, "991234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(265, "991234567"), "MW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MW"), Some(@dialnumber.PhoneNumber::new(265, "991234567")))
    None => assert_true(false)
  }
}

///|
test "plan examples: MX Mexico" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(52, "2001234567"), "MX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(52, "2001234567")), Some("MX"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(52, "2001234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(52, "2001234567"), "MX") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MX"), Some(@dialnumber.PhoneNumber::new(52, "2001234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(52, "2221234567"), "MX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(52, "2221234567")), Some("MX"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(52, "2221234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(52, "2221234567"), "MX") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MX"), Some(@dialnumber.PhoneNumber::new(52, "2221234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(52, "8001234567"), "MX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(52, "8001234567")), Some("MX"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(52, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(52, "9001234567"), "MX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(52, "9001234567")), Some("MX"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(52, "9001234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(52, "3001234567"), "MX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(52, "3001234567")), Some("MX"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(52, "3001234567")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(52, "5001234567"), "MX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(52, "5001234567")), Some("MX"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(52, "5001234567")), Some(PersonalNumber))
}

///|
test "plan examples: MY Malaysia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(60, "323856789"), "MY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(60, "323856789")), Some("MY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(60, "323856789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(60, "323856789"), "MY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MY"), Some(@dialnumber.PhoneNumber::new(60, "323856789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(60, "123456789"), "MY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(60, "123456789")), Some("MY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(60, "123456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(60, "123456789"), "MY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MY"), Some(@dialnumber.PhoneNumber::new(60, "123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(60, "1300123456"), "MY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(60, "1300123456")), Some("MY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(60, "1300123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(60, "1600123456"), "MY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(60, "1600123456")), Some("MY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(60, "1600123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(60, "1546012345"), "MY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(60, "1546012345")), Some("MY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(60, "1546012345")), Some(Voip))
}

///|
test "plan examples: MZ Mozambique" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(258, "21123456"), "MZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(258, "21123456")), Some("MZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(258, "21123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(258, "21123456"), "MZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MZ"), Some(@dialnumber.PhoneNumber::new(258, "21123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(258, "821234567"), "MZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(258, "821234567")), Some("MZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(258, "821234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(258, "821234567"), "MZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "MZ"), Some(@dialnumber.PhoneNumber::new(258, "821234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(258, "800123456"), "MZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(258, "800123456")), Some("MZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(258, "800123456")), Some(TollFree))
}

///|
test "plan examples: NA Namibia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(264, "61221234"), "NA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(264, "61221234")), Some("NA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(264, "61221234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(264, "61221234"), "NA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NA"), Some(@dialnumber.PhoneNumber::new(264, "61221234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(264, "811234567"), "NA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(264, "811234567")), Some("NA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(264, "811234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(264, "811234567"), "NA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NA"), Some(@dialnumber.PhoneNumber::new(264, "811234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(264, "800123456"), "NA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(264, "800123456")), Some("NA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(264, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(264, "870123456"), "NA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(264, "870123456")), Some("NA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(264, "870123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(264, "88612345"), "NA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(264, "88612345")), Some("NA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(264, "88612345")), Some(Voip))
}

///|
test "plan examples: NC New Caledonia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(687, "201234"), "NC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(687, "201234")), Some("NC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(687, "201234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(687, "201234"), "NC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NC"), Some(@dialnumber.PhoneNumber::new(687, "201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(687, "751234"), "NC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(687, "751234")), Some("NC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(687, "751234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(687, "751234"), "NC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NC"), Some(@dialnumber.PhoneNumber::new(687, "751234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(687, "050012"), "NC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(687, "050012")), Some("NC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(687, "050012")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(687, "366711"), "NC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(687, "366711")), Some("NC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(687, "366711")), Some(PremiumRate))
}

///|
test "plan examples: NE Niger" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(227, "20201234"), "NE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(227, "20201234")), Some("NE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(227, "20201234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(227, "20201234"), "NE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NE"), Some(@dialnumber.PhoneNumber::new(227, "20201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(227, "93123456"), "NE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(227, "93123456")), Some("NE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(227, "93123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(227, "93123456"), "NE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NE"), Some(@dialnumber.PhoneNumber::new(227, "93123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(227, "08123456"), "NE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(227, "08123456")), Some("NE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(227, "08123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(227, "09123456"), "NE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(227, "09123456")), Some("NE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(227, "09123456")), Some(PremiumRate))
}

///|
test "plan examples: NF Norfolk Island" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(672, "106609"), "NF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(672, "106609")), Some("NF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(672, "106609")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(672, "381234"), "NF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(672, "381234")), Some("NF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(672, "381234")), Mobile))
}

///|
test "plan examples: NG Nigeria" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(234, "2033123456"), "NG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(234, "2033123456")), Some("NG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(234, "2033123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(234, "2033123456"), "NG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NG"), Some(@dialnumber.PhoneNumber::new(234, "2033123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(234, "8021234567"), "NG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(234, "8021234567")), Some("NG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(234, "8021234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(234, "8021234567"), "NG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NG"), Some(@dialnumber.PhoneNumber::new(234, "8021234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(234, "80017591759"), "NG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(234, "80017591759")), Some("NG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(234, "80017591759")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(234, "7001234567"), "NG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(234, "7001234567")), Some("NG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(234, "7001234567")), Some(Uan))
}

///|
test "plan examples: NI Nicaragua" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(505, "21234567"), "NI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(505, "21234567")), Some("NI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(505, "21234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(505, "21234567"), "NI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NI"), Some(@dialnumber.PhoneNumber::new(505, "21234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(505, "81234567"), "NI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(505, "81234567")), Some("NI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(505, "81234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(505, "81234567"), "NI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NI"), Some(@dialnumber.PhoneNumber::new(505, "81234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(505, "18001234"), "NI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(505, "18001234")), Some("NI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(505, "18001234")), Some(TollFree))
}

///|
test "plan examples: NL Netherlands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(31, "101234567"), "NL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(31, "101234567")), Some("NL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(31, "101234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(31, "101234567"), "NL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NL"), Some(@dialnumber.PhoneNumber::new(31, "101234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(31, "612345678"), "NL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(31, "612345678")), Some("NL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(31, "612345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(31, "612345678"), "NL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NL"), Some(@dialnumber.PhoneNumber::new(31, "612345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(31, "8001234"), "NL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(31, "8001234")), Some("NL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(31, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(31, "9061234"), "NL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(31, "9061234")), Some("NL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(31, "9061234")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(31, "851234567"), "NL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(31, "851234567")), Some("NL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(31, "851234567")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(31, "14020"), "NL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(31, "14020")), Some("NL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(31, "14020")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(31, "662345678"), "NL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(31, "662345678")), Some("NL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(31, "662345678")), Some(Pager))
}

///|
test "plan examples: NO Norway" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "21234567"), "NO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "21234567")), Some("NO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "21234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(47, "21234567"), "NO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NO"), Some(@dialnumber.PhoneNumber::new(47, "21234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "40612345"), "NO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "40612345")), Some("NO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "40612345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(47, "40612345"), "NO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NO"), Some(@dialnumber.PhoneNumber::new(47, "40612345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "80012345"), "NO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "80012345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "82012345"), "NO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "82012345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "82012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "81021234"), "NO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "81021234")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "81021234")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "85012345"), "NO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "85012345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "85012345")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "88012345"), "NO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "88012345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "88012345")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "02000"), "NO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "02000")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "02000")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "81212345"), "NO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "81212345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "81212345")), Some(Voicemail))
}

///|
test "plan examples: NP Nepal" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(977, "14567890"), "NP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(977, "14567890")), Some("NP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(977, "14567890")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(977, "14567890"), "NP") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NP"), Some(@dialnumber.PhoneNumber::new(977, "14567890")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(977, "9841234567"), "NP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(977, "9841234567")), Some("NP"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(977, "9841234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(977, "9841234567"), "NP") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NP"), Some(@dialnumber.PhoneNumber::new(977, "9841234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(977, "16600101234"), "NP"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(977, "16600101234")), Some("NP"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(977, "16600101234")), Some(TollFree))
}

///|
test "plan examples: NR Nauru" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(674, "4441234"), "NR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(674, "4441234")), Some("NR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(674, "4441234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(674, "4441234"), "NR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NR"), Some(@dialnumber.PhoneNumber::new(674, "4441234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(674, "5551234"), "NR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(674, "5551234")), Some("NR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(674, "5551234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(674, "5551234"), "NR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NR"), Some(@dialnumber.PhoneNumber::new(674, "5551234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: NU Niue" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(683, "7012"), "NU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(683, "7012")), Some("NU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(683, "7012")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(683, "7012"), "NU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NU"), Some(@dialnumber.PhoneNumber::new(683, "7012")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(683, "8884012"), "NU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(683, "8884012")), Some("NU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(683, "8884012")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(683, "8884012"), "NU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NU"), Some(@dialnumber.PhoneNumber::new(683, "8884012")))
    None => assert_true(false)
  }
}

///|
test "plan examples: NZ New Zealand" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(64, "32345678"), "NZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(64, "32345678")), Some("NZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(64, "32345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(64, "32345678"), "NZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NZ"), Some(@dialnumber.PhoneNumber::new(64, "32345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(64, "211234567"), "NZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(64, "211234567")), Some("NZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(64, "211234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(64, "211234567"), "NZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "NZ"), Some(@dialnumber.PhoneNumber::new(64, "211234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(64, "800123456"), "NZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(64, "800123456")), Some("NZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(64, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(64, "900123456"), "NZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(64, "900123456")), Some("NZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(64, "900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(64, "701234567"), "NZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(64, "701234567")), Some("NZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(64, "701234567")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(64, "83012378"), "NZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(64, "83012378")), Some("NZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(64, "83012378")), Some(Uan))
}

///|
test "plan examples: OM Oman" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(968, "23123456"), "OM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(968, "23123456")), Some("OM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(968, "23123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(968, "23123456"), "OM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "OM"), Some(@dialnumber.PhoneNumber::new(968, "23123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(968, "92123456"), "OM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(968, "92123456")), Some("OM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(968, "92123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(968, "92123456"), "OM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "OM"), Some(@dialnumber.PhoneNumber::new(968, "92123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(968, "80071234"), "OM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(968, "80071234")), Some("OM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(968, "80071234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(968, "90012345"), "OM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(968, "90012345")), Some("OM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(968, "90012345")), Some(PremiumRate))
}

///|
test "plan examples: PA Panama" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(507, "2001234"), "PA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(507, "2001234")), Some("PA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(507, "2001234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(507, "2001234"), "PA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PA"), Some(@dialnumber.PhoneNumber::new(507, "2001234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(507, "61234567"), "PA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(507, "61234567")), Some("PA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(507, "61234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(507, "61234567"), "PA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PA"), Some(@dialnumber.PhoneNumber::new(507, "61234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(507, "8001234"), "PA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(507, "8001234")), Some("PA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(507, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(507, "8601234"), "PA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(507, "8601234")), Some("PA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(507, "8601234")), Some(PremiumRate))
}

///|
test "plan examples: PE Peru" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(51, "11234567"), "PE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(51, "11234567")), Some("PE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(51, "11234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(51, "11234567"), "PE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PE"), Some(@dialnumber.PhoneNumber::new(51, "11234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(51, "912345678"), "PE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(51, "912345678")), Some("PE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(51, "912345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(51, "912345678"), "PE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PE"), Some(@dialnumber.PhoneNumber::new(51, "912345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(51, "80012345"), "PE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(51, "80012345")), Some("PE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(51, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(51, "80512345"), "PE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(51, "80512345")), Some("PE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(51, "80512345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(51, "80112345"), "PE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(51, "80112345")), Some("PE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(51, "80112345")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(51, "80212345"), "PE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(51, "80212345")), Some("PE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(51, "80212345")), Some(PersonalNumber))
}

///|
test "plan examples: PF French Polynesia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(689, "40412345"), "PF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(689, "40412345")), Some("PF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(689, "40412345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(689, "40412345"), "PF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PF"), Some(@dialnumber.PhoneNumber::new(689, "40412345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(689, "87123456"), "PF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(689, "87123456")), Some("PF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(689, "87123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(689, "87123456"), "PF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PF"), Some(@dialnumber.PhoneNumber::new(689, "87123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(689, "800012345"), "PF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(689, "800012345")), Some("PF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(689, "800012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(689, "49901234"), "PF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(689, "49901234")), Some("PF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(689, "49901234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(689, "440123"), "PF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(689, "440123")), Some("PF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(689, "440123")), Some(Uan))
}

///|
test "plan examples: PG Papua New Guinea" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(675, "3123456"), "PG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(675, "3123456")), Some("PG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(675, "3123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(675, "3123456"), "PG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PG"), Some(@dialnumber.PhoneNumber::new(675, "3123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(675, "70123456"), "PG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(675, "70123456")), Some("PG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(675, "70123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(675, "70123456"), "PG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PG"), Some(@dialnumber.PhoneNumber::new(675, "70123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(675, "1801234"), "PG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(675, "1801234")), Some("PG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(675, "1801234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(675, "2751234"), "PG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(675, "2751234")), Some("PG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(675, "2751234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(675, "2700123"), "PG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(675, "2700123")), Some("PG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(675, "2700123")), Some(Pager))
}

///|
test "plan examples: PH Philippines" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(63, "232345678"), "PH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(63, "232345678")), Some("PH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(63, "232345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(63, "232345678"), "PH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PH"), Some(@dialnumber.PhoneNumber::new(63, "232345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(63, "9051234567"), "PH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(63, "9051234567")), Some("PH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(63, "9051234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(63, "9051234567"), "PH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PH"), Some(@dialnumber.PhoneNumber::new(63, "9051234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(63, "180012345678"), "PH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(63, "180012345678")), Some("PH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(63, "180012345678")), Some(TollFree))
}

///|
test "plan examples: PK Pakistan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(92, "2123456789"), "PK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(92, "2123456789")), Some("PK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(92, "2123456789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(92, "2123456789"), "PK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PK"), Some(@dialnumber.PhoneNumber::new(92, "2123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(92, "3012345678"), "PK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(92, "3012345678")), Some("PK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(92, "3012345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(92, "3012345678"), "PK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PK"), Some(@dialnumber.PhoneNumber::new(92, "3012345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(92, "80012345"), "PK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(92, "80012345")), Some("PK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(92, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(92, "90012345"), "PK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(92, "90012345")), Some("PK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(92, "90012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(92, "122044444"), "PK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(92, "122044444")), Some("PK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(92, "122044444")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(92, "21111825888"), "PK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(92, "21111825888")), Some("PK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(92, "21111825888")), Some(Uan))
}

///|
test "plan examples: PL Poland" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(48, "123456789"), "PL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(48, "123456789")), Some("PL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(48, "123456789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(48, "123456789"), "PL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PL"), Some(@dialnumber.PhoneNumber::new(48, "123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(48, "512345678"), "PL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(48, "512345678")), Some("PL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(48, "512345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(48, "512345678"), "PL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PL"), Some(@dialnumber.PhoneNumber::new(48, "512345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(48, "800123456"), "PL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(48, "800123456")), Some("PL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(48, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(48, "701234567"), "PL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(48, "701234567")), Some("PL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(48, "701234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(48, "801234567"), "PL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(48, "801234567")), Some("PL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(48, "801234567")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(48, "391234567"), "PL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(48, "391234567")), Some("PL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(48, "391234567")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(48, "804123456"), "PL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(48, "804123456")), Some("PL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(48, "804123456")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(48, "641234567"), "PL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(48, "641234567")), Some("PL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(48, "641234567")), Some(Pager))
}

///|
test "plan examples: PM St. Pierre & Miquelon" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(508, "430123"), "PM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(508, "430123")), Some("PM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(508, "430123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(508, "430123"), "PM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PM"), Some(@dialnumber.PhoneNumber::new(508, "430123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(508, "551234"), "PM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(508, "551234")), Some("PM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(508, "551234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(508, "551234"), "PM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PM"), Some(@dialnumber.PhoneNumber::new(508, "551234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(508, "800012345"), "PM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(508, "800012345")), Some("PM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(508, "800012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(508, "810123456"), "PM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(508, "810123456")), Some("PM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(508, "810123456")), Some(PremiumRate))
}

///|
test "plan examples: PR Puerto Rico" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7872345678"), "PR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7872345678")), Some("PR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7872345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "7872345678"), "PR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PR"), Some(@dialnumber.PhoneNumber::new(1, "7872345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7872345678"), "PR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7872345678")), Some("PR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7872345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "7872345678"), "PR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PR"), Some(@dialnumber.PhoneNumber::new(1, "7872345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002345678"), "PR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002345678")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002345678"), "PR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "PR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: PS Palestinian Territories" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(970, "22234567"), "PS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(970, "22234567")), Some("PS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(970, "22234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(970, "22234567"), "PS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PS"), Some(@dialnumber.PhoneNumber::new(970, "22234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(970, "599123456"), "PS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(970, "599123456")), Some("PS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(970, "599123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(970, "599123456"), "PS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PS"), Some(@dialnumber.PhoneNumber::new(970, "599123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(970, "1800123456"), "PS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(970, "1800123456")), Some("PS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(970, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(970, "1700123456"), "PS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(970, "1700123456")), Some("PS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(970, "1700123456")), Some(SharedCost))
}

///|
test "plan examples: PT Portugal" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "212345678"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "212345678")), Some("PT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "212345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(351, "212345678"), "PT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PT"), Some(@dialnumber.PhoneNumber::new(351, "212345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "912345678"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "912345678")), Some("PT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "912345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(351, "912345678"), "PT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PT"), Some(@dialnumber.PhoneNumber::new(351, "912345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "800123456"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "800123456")), Some("PT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "760123456"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "760123456")), Some("PT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "760123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "808123456"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "808123456")), Some("PT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "808123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "301234567"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "301234567")), Some("PT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "301234567")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "884123456"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "884123456")), Some("PT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "884123456")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "707123456"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "707123456")), Some("PT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "707123456")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "622212345"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "622212345")), Some("PT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "622212345")), Some(Pager))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(351, "600110000"), "PT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(351, "600110000")), Some("PT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(351, "600110000")), Some(Voicemail))
}

///|
test "plan examples: PW Palau" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(680, "2771234"), "PW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(680, "2771234")), Some("PW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(680, "2771234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(680, "2771234"), "PW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PW"), Some(@dialnumber.PhoneNumber::new(680, "2771234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(680, "6201234"), "PW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(680, "6201234")), Some("PW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(680, "6201234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(680, "6201234"), "PW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PW"), Some(@dialnumber.PhoneNumber::new(680, "6201234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: PY Paraguay" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(595, "212345678"), "PY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(595, "212345678")), Some("PY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(595, "212345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(595, "212345678"), "PY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PY"), Some(@dialnumber.PhoneNumber::new(595, "212345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(595, "961456789"), "PY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(595, "961456789")), Some("PY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(595, "961456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(595, "961456789"), "PY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "PY"), Some(@dialnumber.PhoneNumber::new(595, "961456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(595, "98000123456"), "PY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(595, "98000123456")), Some("PY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(595, "98000123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(595, "870012345"), "PY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(595, "870012345")), Some("PY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(595, "870012345")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(595, "201234567"), "PY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(595, "201234567")), Some("PY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(595, "201234567")), Some(Uan))
}

///|
test "plan examples: QA Qatar" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(974, "44123456"), "QA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(974, "44123456")), Some("QA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(974, "44123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(974, "44123456"), "QA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "QA"), Some(@dialnumber.PhoneNumber::new(974, "44123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(974, "33123456"), "QA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(974, "33123456")), Some("QA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(974, "33123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(974, "33123456"), "QA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "QA"), Some(@dialnumber.PhoneNumber::new(974, "33123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(974, "8001234"), "QA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(974, "8001234")), Some("QA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(974, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(974, "2123456"), "QA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(974, "2123456")), Some("QA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(974, "2123456")), Some(Pager))
}

///|
test "plan examples: RE Réunion" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "262161234"), "RE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "262161234")), Some("RE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "262161234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(262, "262161234"), "RE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RE"), Some(@dialnumber.PhoneNumber::new(262, "262161234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "692123456"), "RE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "692123456")), Some("RE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "692123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(262, "692123456"), "RE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RE"), Some(@dialnumber.PhoneNumber::new(262, "692123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "801234567"), "RE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "801234567")), Some("RE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "801234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "891123456"), "RE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "891123456")), Some("RE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "891123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "810123456"), "RE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "810123456")), Some("RE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "810123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "939901234"), "RE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "939901234")), Some("RE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "939901234")), Some(Voip))
}

///|
test "plan examples: RO Romania" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(40, "211234567"), "RO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(40, "211234567")), Some("RO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(40, "211234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(40, "211234567"), "RO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RO"), Some(@dialnumber.PhoneNumber::new(40, "211234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(40, "712034567"), "RO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(40, "712034567")), Some("RO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(40, "712034567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(40, "712034567"), "RO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RO"), Some(@dialnumber.PhoneNumber::new(40, "712034567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(40, "800123456"), "RO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(40, "800123456")), Some("RO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(40, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(40, "900123456"), "RO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(40, "900123456")), Some("RO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(40, "900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(40, "801123456"), "RO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(40, "801123456")), Some("RO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(40, "801123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(40, "372123456"), "RO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(40, "372123456")), Some("RO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(40, "372123456")), Some(Uan))
}

///|
test "plan examples: RS Serbia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(381, "10234567"), "RS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(381, "10234567")), Some("RS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(381, "10234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(381, "10234567"), "RS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RS"), Some(@dialnumber.PhoneNumber::new(381, "10234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(381, "601234567"), "RS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(381, "601234567")), Some("RS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(381, "601234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(381, "601234567"), "RS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RS"), Some(@dialnumber.PhoneNumber::new(381, "601234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(381, "80012345"), "RS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(381, "80012345")), Some("RS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(381, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(381, "90012345"), "RS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(381, "90012345")), Some("RS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(381, "90012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(381, "700123456"), "RS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(381, "700123456")), Some("RS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(381, "700123456")), Some(Uan))
}

///|
test "plan examples: RU Russia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "3011234567"), "RU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "3011234567")), Some("RU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "3011234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(7, "3011234567"), "RU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RU"), Some(@dialnumber.PhoneNumber::new(7, "3011234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "9123456789"), "RU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "9123456789")), Some("RU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "9123456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(7, "9123456789"), "RU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RU"), Some(@dialnumber.PhoneNumber::new(7, "9123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "8001234567"), "RU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "8001234567")), Some("RU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "8091234567"), "RU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "8091234567")), Some("RU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "8091234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(7, "8081234567"), "RU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(7, "8081234567")), Some("RU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(7, "8081234567")), Some(PersonalNumber))
}

///|
test "plan examples: RW Rwanda" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(250, "250123456"), "RW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(250, "250123456")), Some("RW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(250, "250123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(250, "250123456"), "RW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RW"), Some(@dialnumber.PhoneNumber::new(250, "250123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(250, "720123456"), "RW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(250, "720123456")), Some("RW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(250, "720123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(250, "720123456"), "RW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "RW"), Some(@dialnumber.PhoneNumber::new(250, "720123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(250, "800123456"), "RW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(250, "800123456")), Some("RW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(250, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(250, "900123456"), "RW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(250, "900123456")), Some("RW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(250, "900123456")), Some(PremiumRate))
}

///|
test "plan examples: SA Saudi Arabia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(966, "112345678"), "SA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(966, "112345678")), Some("SA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(966, "112345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(966, "112345678"), "SA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SA"), Some(@dialnumber.PhoneNumber::new(966, "112345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(966, "512345678"), "SA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(966, "512345678")), Some("SA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(966, "512345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(966, "512345678"), "SA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SA"), Some(@dialnumber.PhoneNumber::new(966, "512345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(966, "8001234567"), "SA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(966, "8001234567")), Some("SA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(966, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(966, "925012345"), "SA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(966, "925012345")), Some("SA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(966, "925012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(966, "920012345"), "SA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(966, "920012345")), Some("SA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(966, "920012345")), Some(SharedCost))
}

///|
test "plan examples: SB Solomon Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(677, "40123"), "SB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(677, "40123")), Some("SB"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(677, "40123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(677, "40123"), "SB") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SB"), Some(@dialnumber.PhoneNumber::new(677, "40123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(677, "7421234"), "SB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(677, "7421234")), Some("SB"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(677, "7421234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(677, "7421234"), "SB") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SB"), Some(@dialnumber.PhoneNumber::new(677, "7421234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(677, "18123"), "SB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(677, "18123")), Some("SB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(677, "18123")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(677, "51123"), "SB"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(677, "51123")), Some("SB"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(677, "51123")), Some(Voip))
}

///|
test "plan examples: SC Seychelles" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(248, "4217123"), "SC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(248, "4217123")), Some("SC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(248, "4217123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(248, "4217123"), "SC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SC"), Some(@dialnumber.PhoneNumber::new(248, "4217123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(248, "2510123"), "SC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(248, "2510123")), Some("SC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(248, "2510123")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(248, "2510123"), "SC") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SC"), Some(@dialnumber.PhoneNumber::new(248, "2510123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(248, "8000000"), "SC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(248, "8000000")), Some("SC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(248, "8000000")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(248, "8512345"), "SC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(248, "8512345")), Some("SC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(248, "8512345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(248, "6412345"), "SC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(248, "6412345")), Some("SC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(248, "6412345")), Some(Voip))
}

///|
test "plan examples: SD Sudan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(249, "153123456"), "SD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(249, "153123456")), Some("SD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(249, "153123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(249, "153123456"), "SD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SD"), Some(@dialnumber.PhoneNumber::new(249, "153123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(249, "911231234"), "SD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(249, "911231234")), Some("SD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(249, "911231234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(249, "911231234"), "SD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SD"), Some(@dialnumber.PhoneNumber::new(249, "911231234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: SE Sweden" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(46, "8123456"), "SE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(46, "8123456")), Some("SE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(46, "8123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(46, "8123456"), "SE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SE"), Some(@dialnumber.PhoneNumber::new(46, "8123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(46, "701234567"), "SE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(46, "701234567")), Some("SE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(46, "701234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(46, "701234567"), "SE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SE"), Some(@dialnumber.PhoneNumber::new(46, "701234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(46, "20123456"), "SE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(46, "20123456")), Some("SE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(46, "20123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(46, "9001234567"), "SE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(46, "9001234567")), Some("SE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(46, "9001234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(46, "771234567"), "SE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(46, "771234567")), Some("SE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(46, "771234567")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(46, "751234567"), "SE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(46, "751234567")), Some("SE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(46, "751234567")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(46, "102345678"), "SE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(46, "102345678")), Some("SE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(46, "102345678")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(46, "740123456"), "SE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(46, "740123456")), Some("SE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(46, "740123456")), Some(Pager))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(46, "254123456789"), "SE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(46, "254123456789")), Some("SE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(46, "254123456789")), Some(Voicemail))
}

///|
test "plan examples: SG Singapore" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(65, "61234567"), "SG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(65, "61234567")), Some("SG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(65, "61234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(65, "61234567"), "SG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SG"), Some(@dialnumber.PhoneNumber::new(65, "61234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(65, "81234567"), "SG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(65, "81234567")), Some("SG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(65, "81234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(65, "81234567"), "SG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SG"), Some(@dialnumber.PhoneNumber::new(65, "81234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(65, "18001234567"), "SG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(65, "18001234567")), Some("SG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(65, "18001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(65, "19001234567"), "SG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(65, "19001234567")), Some("SG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(65, "19001234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(65, "31234567"), "SG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(65, "31234567")), Some("SG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(65, "31234567")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(65, "70001234567"), "SG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(65, "70001234567")), Some("SG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(65, "70001234567")), Some(Uan))
}

///|
test "plan examples: SH St. Helena" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(290, "22158"), "SH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(290, "22158")), Some("SH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(290, "22158")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(290, "22158"), "SH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SH"), Some(@dialnumber.PhoneNumber::new(290, "22158")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(290, "51234"), "SH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(290, "51234")), Some("SH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(290, "51234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(290, "51234"), "SH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SH"), Some(@dialnumber.PhoneNumber::new(290, "51234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(290, "26212"), "SH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(290, "26212")), Some("SH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(290, "26212")), Some(Voip))
}

///|
test "plan examples: SI Slovenia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(386, "12345678"), "SI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(386, "12345678")), Some("SI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(386, "12345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(386, "12345678"), "SI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SI"), Some(@dialnumber.PhoneNumber::new(386, "12345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(386, "31234567"), "SI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(386, "31234567")), Some("SI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(386, "31234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(386, "31234567"), "SI") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SI"), Some(@dialnumber.PhoneNumber::new(386, "31234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(386, "80123456"), "SI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(386, "80123456")), Some("SI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(386, "80123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(386, "90123456"), "SI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(386, "90123456")), Some("SI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(386, "90123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(386, "59012345"), "SI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(386, "59012345")), Some("SI"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(386, "59012345")), Some(Voip))
}

///|
test "plan examples: SJ Svalbard & Jan Mayen" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "79123456"), "SJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "79123456")), Some("SJ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "79123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(47, "79123456"), "SJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SJ"), Some(@dialnumber.PhoneNumber::new(47, "79123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "41234567"), "SJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "41234567")), Some("NO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "41234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(47, "41234567"), "SJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SJ"), Some(@dialnumber.PhoneNumber::new(47, "41234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "80012345"), "SJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "80012345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "80012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "82012345"), "SJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "82012345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "82012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "81021234"), "SJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "81021234")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "81021234")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "85012345"), "SJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "85012345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "85012345")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "88012345"), "SJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "88012345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "88012345")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "02000"), "SJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "02000")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "02000")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(47, "81212345"), "SJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(47, "81212345")), Some("NO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(47, "81212345")), Some(Voicemail))
}

///|
test "plan examples: SK Slovakia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(421, "221234567"), "SK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(421, "221234567")), Some("SK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(421, "221234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(421, "221234567"), "SK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SK"), Some(@dialnumber.PhoneNumber::new(421, "221234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(421, "912123456"), "SK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(421, "912123456")), Some("SK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(421, "912123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(421, "912123456"), "SK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SK"), Some(@dialnumber.PhoneNumber::new(421, "912123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(421, "800123456"), "SK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(421, "800123456")), Some("SK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(421, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(421, "900123456"), "SK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(421, "900123456")), Some("SK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(421, "900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(421, "850123456"), "SK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(421, "850123456")), Some("SK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(421, "850123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(421, "690123456"), "SK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(421, "690123456")), Some("SK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(421, "690123456")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(421, "961234567"), "SK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(421, "961234567")), Some("SK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(421, "961234567")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(421, "9090123"), "SK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(421, "9090123")), Some("SK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(421, "9090123")), Some(Pager))
}

///|
test "plan examples: SL Sierra Leone" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(232, "22221234"), "SL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(232, "22221234")), Some("SL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(232, "22221234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(232, "22221234"), "SL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SL"), Some(@dialnumber.PhoneNumber::new(232, "22221234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(232, "25123456"), "SL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(232, "25123456")), Some("SL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(232, "25123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(232, "25123456"), "SL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SL"), Some(@dialnumber.PhoneNumber::new(232, "25123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: SM San Marino" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(378, "0549886377"), "SM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(378, "0549886377")), Some("SM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(378, "0549886377")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(378, "66661212"), "SM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(378, "66661212")), Some("SM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(378, "66661212")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(378, "71123456"), "SM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(378, "71123456")), Some("SM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(378, "71123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(378, "58001110"), "SM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(378, "58001110")), Some("SM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(378, "58001110")), Some(Voip))
}

///|
test "plan examples: SN Senegal" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(221, "301012345"), "SN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(221, "301012345")), Some("SN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(221, "301012345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(221, "301012345"), "SN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SN"), Some(@dialnumber.PhoneNumber::new(221, "301012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(221, "701234567"), "SN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(221, "701234567")), Some("SN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(221, "701234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(221, "701234567"), "SN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SN"), Some(@dialnumber.PhoneNumber::new(221, "701234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(221, "800123456"), "SN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(221, "800123456")), Some("SN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(221, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(221, "884123456"), "SN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(221, "884123456")), Some("SN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(221, "884123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(221, "810123456"), "SN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(221, "810123456")), Some("SN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(221, "810123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(221, "933301234"), "SN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(221, "933301234")), Some("SN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(221, "933301234")), Some(Voip))
}

///|
test "plan examples: SO Somalia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(252, "4012345"), "SO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(252, "4012345")), Some("SO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(252, "4012345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(252, "4012345"), "SO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SO"), Some(@dialnumber.PhoneNumber::new(252, "4012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(252, "71123456"), "SO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(252, "71123456")), Some("SO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(252, "71123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(252, "71123456"), "SO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SO"), Some(@dialnumber.PhoneNumber::new(252, "71123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: SR Suriname" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(597, "211234"), "SR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(597, "211234")), Some("SR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(597, "211234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(597, "211234"), "SR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SR"), Some(@dialnumber.PhoneNumber::new(597, "211234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(597, "7412345"), "SR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(597, "7412345")), Some("SR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(597, "7412345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(597, "7412345"), "SR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SR"), Some(@dialnumber.PhoneNumber::new(597, "7412345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(597, "8012345"), "SR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(597, "8012345")), Some("SR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(597, "8012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(597, "9012345"), "SR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(597, "9012345")), Some("SR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(597, "9012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(597, "561234"), "SR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(597, "561234")), Some("SR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(597, "561234")), Some(Voip))
}

///|
test "plan examples: SS South Sudan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(211, "181234567"), "SS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(211, "181234567")), Some("SS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(211, "181234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(211, "181234567"), "SS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SS"), Some(@dialnumber.PhoneNumber::new(211, "181234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(211, "977123456"), "SS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(211, "977123456")), Some("SS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(211, "977123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(211, "977123456"), "SS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SS"), Some(@dialnumber.PhoneNumber::new(211, "977123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: ST São Tomé & Príncipe" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(239, "2221234"), "ST"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(239, "2221234")), Some("ST"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(239, "2221234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(239, "2221234"), "ST") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ST"), Some(@dialnumber.PhoneNumber::new(239, "2221234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(239, "9812345"), "ST"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(239, "9812345")), Some("ST"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(239, "9812345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(239, "9812345"), "ST") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ST"), Some(@dialnumber.PhoneNumber::new(239, "9812345")))
    None => assert_true(false)
  }
}

///|
test "plan examples: SV El Salvador" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(503, "21234567"), "SV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(503, "21234567")), Some("SV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(503, "21234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(503, "21234567"), "SV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SV"), Some(@dialnumber.PhoneNumber::new(503, "21234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(503, "70123456"), "SV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(503, "70123456")), Some("SV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(503, "70123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(503, "70123456"), "SV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SV"), Some(@dialnumber.PhoneNumber::new(503, "70123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(503, "8001234"), "SV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(503, "8001234")), Some("SV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(503, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(503, "9001234"), "SV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(503, "9001234")), Some("SV"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(503, "9001234")), Some(PremiumRate))
}

///|
test "plan examples: SX Sint Maarten" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7215425678"), "SX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7215425678")), Some("SX"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7215425678")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7215205678"), "SX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7215205678")), Some("SX"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7215205678")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002123456"), "SX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002123456"), "SX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002123456")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "SX"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: SY Syria" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(963, "112345678"), "SY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(963, "112345678")), Some("SY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(963, "112345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(963, "112345678"), "SY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SY"), Some(@dialnumber.PhoneNumber::new(963, "112345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(963, "944567890"), "SY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(963, "944567890")), Some("SY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(963, "944567890")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(963, "944567890"), "SY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SY"), Some(@dialnumber.PhoneNumber::new(963, "944567890")))
    None => assert_true(false)
  }
}

///|
test "plan examples: SZ Eswatini" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(268, "22171234"), "SZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(268, "22171234")), Some("SZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(268, "22171234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(268, "22171234"), "SZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SZ"), Some(@dialnumber.PhoneNumber::new(268, "22171234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(268, "76123456"), "SZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(268, "76123456")), Some("SZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(268, "76123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(268, "76123456"), "SZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "SZ"), Some(@dialnumber.PhoneNumber::new(268, "76123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(268, "08001234"), "SZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(268, "08001234")), Some("SZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(268, "08001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(268, "900012345"), "SZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(268, "900012345")), Some("SZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(268, "900012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(268, "70012345"), "SZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(268, "70012345")), Some("SZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(268, "70012345")), Some(Voip))
}

///|
test "plan examples: TA Tristan da Cunha" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(290, "8999"), "TA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(290, "8999")), Some("TA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(290, "8999")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(290, "8999"), "TA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TA"), Some(@dialnumber.PhoneNumber::new(290, "8999")))
    None => assert_true(false)
  }
}

///|
test "plan examples: TC Turks & Caicos Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6497121234"), "TC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6497121234")), Some("TC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6497121234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6492311234"), "TC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6492311234")), Some("TC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6492311234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002345678"), "TC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002345678")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002345678"), "TC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "6497101234"), "TC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "6497101234")), Some("TC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "6497101234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "TC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: TD Chad" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(235, "22501234"), "TD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(235, "22501234")), Some("TD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(235, "22501234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(235, "22501234"), "TD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TD"), Some(@dialnumber.PhoneNumber::new(235, "22501234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(235, "63012345"), "TD"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(235, "63012345")), Some("TD"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(235, "63012345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(235, "63012345"), "TD") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TD"), Some(@dialnumber.PhoneNumber::new(235, "63012345")))
    None => assert_true(false)
  }
}

///|
test "plan examples: TG Togo" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(228, "22212345"), "TG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(228, "22212345")), Some("TG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(228, "22212345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(228, "22212345"), "TG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TG"), Some(@dialnumber.PhoneNumber::new(228, "22212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(228, "90112345"), "TG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(228, "90112345")), Some("TG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(228, "90112345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(228, "90112345"), "TG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TG"), Some(@dialnumber.PhoneNumber::new(228, "90112345")))
    None => assert_true(false)
  }
}

///|
test "plan examples: TH Thailand" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(66, "21234567"), "TH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(66, "21234567")), Some("TH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(66, "21234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(66, "21234567"), "TH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TH"), Some(@dialnumber.PhoneNumber::new(66, "21234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(66, "812345678"), "TH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(66, "812345678")), Some("TH"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(66, "812345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(66, "812345678"), "TH") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TH"), Some(@dialnumber.PhoneNumber::new(66, "812345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(66, "1800123456"), "TH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(66, "1800123456")), Some("TH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(66, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(66, "1900123456"), "TH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(66, "1900123456")), Some("TH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(66, "1900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(66, "601234567"), "TH"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(66, "601234567")), Some("TH"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(66, "601234567")), Some(Voip))
}

///|
test "plan examples: TJ Tajikistan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(992, "372123456"), "TJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(992, "372123456")), Some("TJ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(992, "372123456")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(992, "372123456"), "TJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TJ"), Some(@dialnumber.PhoneNumber::new(992, "372123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(992, "917123456"), "TJ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(992, "917123456")), Some("TJ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(992, "917123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(992, "917123456"), "TJ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TJ"), Some(@dialnumber.PhoneNumber::new(992, "917123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: TK Tokelau" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(690, "3101"), "TK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(690, "3101")), Some("TK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(690, "3101")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(690, "3101"), "TK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TK"), Some(@dialnumber.PhoneNumber::new(690, "3101")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(690, "7290"), "TK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(690, "7290")), Some("TK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(690, "7290")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(690, "7290"), "TK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TK"), Some(@dialnumber.PhoneNumber::new(690, "7290")))
    None => assert_true(false)
  }
}

///|
test "plan examples: TL Timor-Leste" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(670, "2112345"), "TL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(670, "2112345")), Some("TL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(670, "2112345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(670, "2112345"), "TL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TL"), Some(@dialnumber.PhoneNumber::new(670, "2112345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(670, "77212345"), "TL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(670, "77212345")), Some("TL"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(670, "77212345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(670, "77212345"), "TL") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TL"), Some(@dialnumber.PhoneNumber::new(670, "77212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(670, "8012345"), "TL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(670, "8012345")), Some("TL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(670, "8012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(670, "9012345"), "TL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(670, "9012345")), Some("TL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(670, "9012345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(670, "7012345"), "TL"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(670, "7012345")), Some("TL"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(670, "7012345")), Some(PersonalNumber))
}

///|
test "plan examples: TM Turkmenistan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(993, "12345678"), "TM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(993, "12345678")), Some("TM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(993, "12345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(993, "12345678"), "TM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TM"), Some(@dialnumber.PhoneNumber::new(993, "12345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(993, "66123456"), "TM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(993, "66123456")), Some("TM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(993, "66123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(993, "66123456"), "TM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TM"), Some(@dialnumber.PhoneNumber::new(993, "66123456")))
    None => assert_true(false)
  }
}

///|
test "plan examples: TN Tunisia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(216, "30010123"), "TN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(216, "30010123")), Some("TN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(216, "30010123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(216, "30010123"), "TN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TN"), Some(@dialnumber.PhoneNumber::new(216, "30010123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(216, "20123456"), "TN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(216, "20123456")), Some("TN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(216, "20123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(216, "20123456"), "TN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TN"), Some(@dialnumber.PhoneNumber::new(216, "20123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(216, "80101234"), "TN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(216, "80101234")), Some("TN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(216, "80101234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(216, "88123456"), "TN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(216, "88123456")), Some("TN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(216, "88123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(216, "81101234"), "TN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(216, "81101234")), Some("TN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(216, "81101234")), Some(SharedCost))
}

///|
test "plan examples: TO Tonga" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(676, "20123"), "TO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(676, "20123")), Some("TO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(676, "20123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(676, "20123"), "TO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TO"), Some(@dialnumber.PhoneNumber::new(676, "20123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(676, "7715123"), "TO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(676, "7715123")), Some("TO"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(676, "7715123")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(676, "7715123"), "TO") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TO"), Some(@dialnumber.PhoneNumber::new(676, "7715123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(676, "0800222"), "TO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(676, "0800222")), Some("TO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(676, "0800222")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(676, "5510123"), "TO"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(676, "5510123")), Some("TO"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(676, "5510123")), Some(Voip))
}

///|
test "plan examples: TR Türkiye" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(90, "2123456789"), "TR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(90, "2123456789")), Some("TR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(90, "2123456789")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(90, "2123456789"), "TR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TR"), Some(@dialnumber.PhoneNumber::new(90, "2123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(90, "5012345678"), "TR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(90, "5012345678")), Some("TR"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(90, "5012345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(90, "5012345678"), "TR") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TR"), Some(@dialnumber.PhoneNumber::new(90, "5012345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(90, "8001234567"), "TR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(90, "8001234567")), Some("TR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(90, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(90, "9001234567"), "TR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(90, "9001234567")), Some("TR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(90, "9001234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(90, "8500123456"), "TR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(90, "8500123456")), Some("TR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(90, "8500123456")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(90, "5922121234"), "TR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(90, "5922121234")), Some("TR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(90, "5922121234")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(90, "4441444"), "TR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(90, "4441444")), Some("TR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(90, "4441444")), Some(Uan))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(90, "5123456789"), "TR"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(90, "5123456789")), Some("TR"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(90, "5123456789")), Some(Pager))
}

///|
test "plan examples: TT Trinidad & Tobago" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8682211234"), "TT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8682211234")), Some("TT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8682211234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8682911234"), "TT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8682911234")), Some("TT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8682911234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002345678"), "TT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002345678")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002345678"), "TT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "TT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8686191234"), "TT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8686191234")), Some("TT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8686191234")), Some(Voicemail))
}

///|
test "plan examples: TV Tuvalu" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(688, "20123"), "TV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(688, "20123")), Some("TV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(688, "20123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(688, "20123"), "TV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TV"), Some(@dialnumber.PhoneNumber::new(688, "20123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(688, "901234"), "TV"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(688, "901234")), Some("TV"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(688, "901234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(688, "901234"), "TV") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TV"), Some(@dialnumber.PhoneNumber::new(688, "901234")))
    None => assert_true(false)
  }
}

///|
test "plan examples: TW Taiwan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(886, "221234567"), "TW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(886, "221234567")), Some("TW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(886, "221234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(886, "221234567"), "TW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TW"), Some(@dialnumber.PhoneNumber::new(886, "221234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(886, "912345678"), "TW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(886, "912345678")), Some("TW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(886, "912345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(886, "912345678"), "TW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TW"), Some(@dialnumber.PhoneNumber::new(886, "912345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(886, "800123456"), "TW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(886, "800123456")), Some("TW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(886, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(886, "203123456"), "TW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(886, "203123456")), Some("TW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(886, "203123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(886, "7012345678"), "TW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(886, "7012345678")), Some("TW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(886, "7012345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(886, "990123456"), "TW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(886, "990123456")), Some("TW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(886, "990123456")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(886, "500123456"), "TW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(886, "500123456")), Some("TW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(886, "500123456")), Some(Uan))
}

///|
test "plan examples: TZ Tanzania" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(255, "222345678"), "TZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(255, "222345678")), Some("TZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(255, "222345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(255, "222345678"), "TZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TZ"), Some(@dialnumber.PhoneNumber::new(255, "222345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(255, "621234567"), "TZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(255, "621234567")), Some("TZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(255, "621234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(255, "621234567"), "TZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "TZ"), Some(@dialnumber.PhoneNumber::new(255, "621234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(255, "800123456"), "TZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(255, "800123456")), Some("TZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(255, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(255, "900123456"), "TZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(255, "900123456")), Some("TZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(255, "900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(255, "840123456"), "TZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(255, "840123456")), Some("TZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(255, "840123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(255, "412345678"), "TZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(255, "412345678")), Some("TZ"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(255, "412345678")), Some(Voip))
}

///|
test "plan examples: UA Ukraine" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(380, "311234567"), "UA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(380, "311234567")), Some("UA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(380, "311234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(380, "311234567"), "UA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "UA"), Some(@dialnumber.PhoneNumber::new(380, "311234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(380, "501234567"), "UA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(380, "501234567")), Some("UA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(380, "501234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(380, "501234567"), "UA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "UA"), Some(@dialnumber.PhoneNumber::new(380, "501234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(380, "800123456"), "UA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(380, "800123456")), Some("UA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(380, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(380, "900212345"), "UA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(380, "900212345")), Some("UA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(380, "900212345")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(380, "891234567"), "UA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(380, "891234567")), Some("UA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(380, "891234567")), Some(Voip))
}

///|
test "plan examples: UG Uganda" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(256, "312345678"), "UG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(256, "312345678")), Some("UG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(256, "312345678")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(256, "312345678"), "UG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "UG"), Some(@dialnumber.PhoneNumber::new(256, "312345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(256, "712345678"), "UG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(256, "712345678")), Some("UG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(256, "712345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(256, "712345678"), "UG") {
    Some(written) => assert_eq(@dialnumber.parse(written, "UG"), Some(@dialnumber.PhoneNumber::new(256, "712345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(256, "800123456"), "UG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(256, "800123456")), Some("UG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(256, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(256, "901123456"), "UG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(256, "901123456")), Some("UG"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(256, "901123456")), Some(PremiumRate))
}

///|
test "plan examples: US United States" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2015550123"), "US"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2015550123")), Some("US"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2015550123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "2015550123"), "US") {
    Some(written) => assert_eq(@dialnumber.parse(written, "US"), Some(@dialnumber.PhoneNumber::new(1, "2015550123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2015550123"), "US"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2015550123")), Some("US"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2015550123")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(1, "2015550123"), "US") {
    Some(written) => assert_eq(@dialnumber.parse(written, "US"), Some(@dialnumber.PhoneNumber::new(1, "2015550123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002345678"), "US"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002345678")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002345678"), "US"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "US"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: UY Uruguay" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(598, "21231234"), "UY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(598, "21231234")), Some("UY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(598, "21231234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(598, "21231234"), "UY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "UY"), Some(@dialnumber.PhoneNumber::new(598, "21231234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(598, "94231234"), "UY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(598, "94231234")), Some("UY"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(598, "94231234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(598, "94231234"), "UY") {
    Some(written) => assert_eq(@dialnumber.parse(written, "UY"), Some(@dialnumber.PhoneNumber::new(598, "94231234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(598, "8001234"), "UY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(598, "8001234")), Some("UY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(598, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(598, "9001234"), "UY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(598, "9001234")), Some("UY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(598, "9001234")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(598, "21123"), "UY"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(598, "21123")), Some("UY"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(598, "21123")), Some(Uan))
}

///|
test "plan examples: UZ Uzbekistan" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(998, "669050123"), "UZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(998, "669050123")), Some("UZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(998, "669050123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(998, "669050123"), "UZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "UZ"), Some(@dialnumber.PhoneNumber::new(998, "669050123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(998, "912345678"), "UZ"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(998, "912345678")), Some("UZ"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(998, "912345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(998, "912345678"), "UZ") {
    Some(written) => assert_eq(@dialnumber.parse(written, "UZ"), Some(@dialnumber.PhoneNumber::new(998, "912345678")))
    None => assert_true(false)
  }
}

///|
test "plan examples: VA Vatican City" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "0669812345"), "VA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "0669812345")), Some("VA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "0669812345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(39, "0669812345"), "VA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "VA"), Some(@dialnumber.PhoneNumber::new(39, "0669812345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "3123456789"), "VA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "3123456789")), Some("IT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "3123456789")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(39, "3123456789"), "VA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "VA"), Some(@dialnumber.PhoneNumber::new(39, "3123456789")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "800123456"), "VA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "800123456")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "899123456"), "VA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "899123456")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "899123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "848123456"), "VA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "848123456")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "848123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "5512345678"), "VA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "5512345678")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "5512345678")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "1781234567"), "VA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "1781234567")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "1781234567")), Some(PersonalNumber))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(39, "33101234501"), "VA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(39, "33101234501")), Some("IT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(39, "33101234501")), Some(Voicemail))
}

///|
test "plan examples: VC St. Vincent & Grenadines" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7842661234"), "VC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7842661234")), Some("VC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7842661234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7844301234"), "VC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7844301234")), Some("VC"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7844301234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002345678"), "VC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002345678")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002345678"), "VC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "7845101234"), "VC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "7845101234")), Some("VC"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "7845101234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "VC"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: VE Venezuela" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(58, "2121234567"), "VE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(58, "2121234567")), Some("VE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(58, "2121234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(58, "2121234567"), "VE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "VE"), Some(@dialnumber.PhoneNumber::new(58, "2121234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(58, "4121234567"), "VE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(58, "4121234567")), Some("VE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(58, "4121234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(58, "4121234567"), "VE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "VE"), Some(@dialnumber.PhoneNumber::new(58, "4121234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(58, "8001234567"), "VE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(58, "8001234567")), Some("VE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(58, "8001234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(58, "9001234567"), "VE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(58, "9001234567")), Some("VE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(58, "9001234567")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(58, "5010123456"), "VE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(58, "5010123456")), Some("VE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(58, "5010123456")), Some(Uan))
}

///|
test "plan examples: VG British Virgin Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2842291234"), "VG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2842291234")), Some("VG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2842291234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "2843001234"), "VG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "2843001234")), Some("VG"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "2843001234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002345678"), "VG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002345678")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002345678"), "VG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "VG"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: VI U.S. Virgin Islands" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "3406421234"), "VI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "3406421234")), Some("VI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "3406421234")), FixedLine))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "3406421234"), "VI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "3406421234")), Some("VI"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "3406421234")), Mobile))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "8002345678"), "VI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "8002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "8002345678")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "9002345678"), "VI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "9002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "9002345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(1, "5002345678"), "VI"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(1, "5002345678")), Some("US"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(1, "5002345678")), Some(PersonalNumber))
}

///|
test "plan examples: VN Vietnam" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(84, "2101234567"), "VN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(84, "2101234567")), Some("VN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(84, "2101234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(84, "2101234567"), "VN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "VN"), Some(@dialnumber.PhoneNumber::new(84, "2101234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(84, "912345678"), "VN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(84, "912345678")), Some("VN"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(84, "912345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(84, "912345678"), "VN") {
    Some(written) => assert_eq(@dialnumber.parse(written, "VN"), Some(@dialnumber.PhoneNumber::new(84, "912345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(84, "1800123456"), "VN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(84, "1800123456")), Some("VN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(84, "1800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(84, "1900123456"), "VN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(84, "1900123456")), Some("VN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(84, "1900123456")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(84, "672012345"), "VN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(84, "672012345")), Some("VN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(84, "672012345")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(84, "1992000"), "VN"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(84, "1992000")), Some("VN"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(84, "1992000")), Some(Uan))
}

///|
test "plan examples: VU Vanuatu" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(678, "22123"), "VU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(678, "22123")), Some("VU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(678, "22123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(678, "22123"), "VU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "VU"), Some(@dialnumber.PhoneNumber::new(678, "22123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(678, "5912345"), "VU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(678, "5912345")), Some("VU"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(678, "5912345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(678, "5912345"), "VU") {
    Some(written) => assert_eq(@dialnumber.parse(written, "VU"), Some(@dialnumber.PhoneNumber::new(678, "5912345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(678, "81123"), "VU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(678, "81123")), Some("VU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(678, "81123")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(678, "9010123"), "VU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(678, "9010123")), Some("VU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(678, "9010123")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(678, "30123"), "VU"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(678, "30123")), Some("VU"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(678, "30123")), Some(Uan))
}

///|
test "plan examples: WF Wallis & Futuna" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(681, "721234"), "WF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(681, "721234")), Some("WF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(681, "721234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(681, "721234"), "WF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "WF"), Some(@dialnumber.PhoneNumber::new(681, "721234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(681, "821234"), "WF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(681, "821234")), Some("WF"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(681, "821234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(681, "821234"), "WF") {
    Some(written) => assert_eq(@dialnumber.parse(written, "WF"), Some(@dialnumber.PhoneNumber::new(681, "821234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(681, "800012345"), "WF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(681, "800012345")), Some("WF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(681, "800012345")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(681, "921234"), "WF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(681, "921234")), Some("WF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(681, "921234")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(681, "401234"), "WF"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(681, "401234")), Some("WF"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(681, "401234")), Some(Voicemail))
}

///|
test "plan examples: WS Samoa" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(685, "22123"), "WS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(685, "22123")), Some("WS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(685, "22123")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(685, "22123"), "WS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "WS"), Some(@dialnumber.PhoneNumber::new(685, "22123")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(685, "7212345"), "WS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(685, "7212345")), Some("WS"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(685, "7212345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(685, "7212345"), "WS") {
    Some(written) => assert_eq(@dialnumber.parse(written, "WS"), Some(@dialnumber.PhoneNumber::new(685, "7212345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(685, "800123"), "WS"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(685, "800123")), Some("WS"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(685, "800123")), Some(TollFree))
}

///|
test "plan examples: XK Kosovo" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(383, "28012345"), "XK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(383, "28012345")), Some("XK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(383, "28012345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(383, "28012345"), "XK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "XK"), Some(@dialnumber.PhoneNumber::new(383, "28012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(383, "43201234"), "XK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(383, "43201234")), Some("XK"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(383, "43201234")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(383, "43201234"), "XK") {
    Some(written) => assert_eq(@dialnumber.parse(written, "XK"), Some(@dialnumber.PhoneNumber::new(383, "43201234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(383, "80001234"), "XK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(383, "80001234")), Some("XK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(383, "80001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(383, "90001234"), "XK"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(383, "90001234")), Some("XK"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(383, "90001234")), Some(PremiumRate))
}

///|
test "plan examples: YE Yemen" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(967, "1234567"), "YE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(967, "1234567")), Some("YE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(967, "1234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(967, "1234567"), "YE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "YE"), Some(@dialnumber.PhoneNumber::new(967, "1234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(967, "712345678"), "YE"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(967, "712345678")), Some("YE"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(967, "712345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(967, "712345678"), "YE") {
    Some(written) => assert_eq(@dialnumber.parse(written, "YE"), Some(@dialnumber.PhoneNumber::new(967, "712345678")))
    None => assert_true(false)
  }
}

///|
test "plan examples: YT Mayotte" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "269601234"), "YT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "269601234")), Some("YT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "269601234")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(262, "269601234"), "YT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "YT"), Some(@dialnumber.PhoneNumber::new(262, "269601234")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "639012345"), "YT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "639012345")), Some("YT"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "639012345")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(262, "639012345"), "YT") {
    Some(written) => assert_eq(@dialnumber.parse(written, "YT"), Some(@dialnumber.PhoneNumber::new(262, "639012345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "801234567"), "YT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "801234567")), Some("RE"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "801234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(262, "939801234"), "YT"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(262, "939801234")), Some("YT"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(262, "939801234")), Some(Voip))
}

///|
test "plan examples: ZA South Africa" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(27, "101234567"), "ZA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(27, "101234567")), Some("ZA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(27, "101234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(27, "101234567"), "ZA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ZA"), Some(@dialnumber.PhoneNumber::new(27, "101234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(27, "711234567"), "ZA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(27, "711234567")), Some("ZA"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(27, "711234567")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(27, "711234567"), "ZA") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ZA"), Some(@dialnumber.PhoneNumber::new(27, "711234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(27, "801234567"), "ZA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(27, "801234567")), Some("ZA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(27, "801234567")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(27, "862345678"), "ZA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(27, "862345678")), Some("ZA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(27, "862345678")), Some(PremiumRate))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(27, "860123456"), "ZA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(27, "860123456")), Some("ZA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(27, "860123456")), Some(SharedCost))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(27, "871234567"), "ZA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(27, "871234567")), Some("ZA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(27, "871234567")), Some(Voip))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(27, "861123456"), "ZA"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(27, "861123456")), Some("ZA"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(27, "861123456")), Some(Uan))
}

///|
test "plan examples: ZM Zambia" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(260, "211234567"), "ZM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(260, "211234567")), Some("ZM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(260, "211234567")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(260, "211234567"), "ZM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ZM"), Some(@dialnumber.PhoneNumber::new(260, "211234567")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(260, "955123456"), "ZM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(260, "955123456")), Some("ZM"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(260, "955123456")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(260, "955123456"), "ZM") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ZM"), Some(@dialnumber.PhoneNumber::new(260, "955123456")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(260, "800123456"), "ZM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(260, "800123456")), Some("ZM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(260, "800123456")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(260, "630123456"), "ZM"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(260, "630123456")), Some("ZM"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(260, "630123456")), Some(Voip))
}

///|
test "plan examples: ZW Zimbabwe" {
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(263, "1312345"), "ZW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(263, "1312345")), Some("ZW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(263, "1312345")), FixedLine))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(263, "1312345"), "ZW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ZW"), Some(@dialnumber.PhoneNumber::new(263, "1312345")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(263, "712345678"), "ZW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(263, "712345678")), Some("ZW"))
  assert_true(matches_kind(@dialnumber.number_type(@dialnumber.PhoneNumber::new(263, "712345678")), Mobile))
  match @dialnumber.format_national(@dialnumber.PhoneNumber::new(263, "712345678"), "ZW") {
    Some(written) => assert_eq(@dialnumber.parse(written, "ZW"), Some(@dialnumber.PhoneNumber::new(263, "712345678")))
    None => assert_true(false)
  }
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(263, "8001234"), "ZW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(263, "8001234")), Some("ZW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(263, "8001234")), Some(TollFree))
  assert_true(@dialnumber.is_valid_in_region(@dialnumber.PhoneNumber::new(263, "8686123456"), "ZW"))
  assert_eq(@dialnumber.region_of_number(@dialnumber.PhoneNumber::new(263, "8686123456")), Some("ZW"))
  assert_eq(@dialnumber.number_type(@dialnumber.PhoneNumber::new(263, "8686123456")), Some(Voip))
}

///|
/// Fixed-line and mobile examples may be reported as either of the two, or
/// as the shared type, depending on how the plan's rules overlap.
fn matches_kind(actual : @dialnumber.NumberType?, expected : @dialnumber.NumberType) -> Bool {
  match actual {
    Some(@dialnumber.FixedLineOrMobile) => expected == @dialnumber.FixedLine || expected == @dialnumber.Mobile
    Some(t) => t == expected
    None => false
  }
}
