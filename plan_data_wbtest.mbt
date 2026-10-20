// Whitebox checks on the generated table itself.
//
// These hold the data pipeline to its promises: every rule in the table
// must be in the engine's grammar, every region must be described, and the
// coverage counts must match the published metadata.

///|
test "the table covers the published metadata" {
  assert_eq(regions.length(), 245)
  assert_eq(count_plan_types(), 1132)
}

///|
test "every published rule is in the supported grammar" {
  for r in regions {
    assert_true(pattern_well_formed(r.general))
    for t in r.types {
      assert_true(pattern_well_formed(t.pattern))
    }
  }
}

///|
test "every region is named and reachable" {
  for r in regions {
    assert_true(r.name.length() > 0)
    match find_region(r.code) {
      Some(found) => assert_eq(found.code, r.code)
      None => assert_true(false)
    }
    assert_true(r.types.length() > 0)
  }
}

///|
test "the NANP is complete" {
  let nanp : Array[String] = []
  for r in regions {
    if r.calling_code == 1 {
      nanp.push(r.code)
    }
  }
  assert_eq(nanp.length(), 25)
  assert_true(nanp.contains("US"))
  assert_true(nanp.contains("CA"))
  assert_true(nanp.contains("PR"))
}

///|
fn count_plan_types() -> Int {
  let mut n = 0
  for r in regions {
    n = n + r.types.length()
  }
  n
}
