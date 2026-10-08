// demo.mbt — a runnable tour of the public API.
//
// This exists because the acceptance criteria ask for a runnable example, not
// just a README snippet: something a reviewer can execute end to end and compare
// against the recorded output in docs/reproducible-demo.md.
//
// Run it with:
//   moon run cmd/demo
//
// Every value printed here comes from the library itself. Nothing is hard-coded
// to make the output look right, so if the library regresses this output changes.

///|
fn head(title : String) -> Unit {
  println("")
  println("== \{title} ==")
}

///|
fn show(label : String, value : String) -> Unit {
  println("\{label}: \{value}")
}

///|
fn join(items : Array[String], sep : String) -> String {
  let buf = StringBuilder()
  for i = 0; i < items.length(); i = i + 1 {
    if i > 0 {
      buf.write_string(sep)
    }
    buf.write_string(items[i])
  }
  buf.to_string()
}

///|
/// Parse one written number and print the useful facts about it.
fn tour(input : String, region : String) -> Unit {
  show(
    "input",
    input + (if region == "" { "" } else { "  [region " + region + "]" }),
  )
  match @dn.parse(input, region) {
    None => show("result", "unreadable")
    Some(pn) => {
      show("e164", @dn.format_e164(pn))
      show("international", @dn.format_international(pn))
      let reg = match @dn.region_of_number(pn) {
        Some(c) => c
        None => "unresolved"
      }
      show("region", reg)
      show("possible", if @dn.is_possible(pn) { "yes" } else { "no" })
    }
  }
}

///|
/// The number types a length admits, as a comma-separated list.
fn types_of(input : String, region : String) -> Unit {
  match @dn.parse(input, region) {
    None => show("types", "unreadable")
    Some(pn) => {
      let names : Array[String] = []
      for t in @dn.possible_types(pn) {
        names.push(t.to_string())
      }
      show(input, join(names, ","))
    }
  }
}

///|
/// One line of region metadata drawn straight from the table.
fn fact(code : String) -> Unit {
  let name = match @dn.region_name(code) {
    Some(n) => n
    None => "?"
  }
  let cc = match @dn.calling_code(code) {
    Some(c) => c.to_string()
    None => "?"
  }
  let lens : Array[String] = []
  match @dn.possible_lengths(code) {
    Some(ls) =>
      for n in ls {
        lens.push(n.to_string())
      }
    None => ()
  }
  show(code, name + " +" + cc + "  lengths {" + join(lens, ",") + "}")
}

///|
fn main {
  head("parse across the ways people write a number")
  tour("+1 201-555-0123", "")
  tour("011 44 20 7946 0958", "US")
  tour("090-1234-5678", "JP")
  tour("+86 (131) 2345-6789", "")
  tour("02 12345678", "IT")
  tour("+999 555 0000", "")

  head("length is what separates possible from impossible")
  tour("+1 201-555-012", "")
  tour("+1 201-555-01234", "")

  head("national rendering needs a region")
  match @dn.parse("090-1234-5678", "JP") {
    None => show("national", "unreadable")
    Some(pn) => {
      let nat = match @dn.format_national(pn, "JP") {
        Some(v) => v
        None => "(none)"
      }
      show("national", nat)
    }
  }

  head("a parsed number keeps its extension")
  match @dn.parse_tel_uri("tel:+1-201-555-0123;ext=42") {
    None => show("tel uri", "unreadable")
    Some(pn) => {
      show("e164", @dn.format_e164(pn))
      show("extension", pn.extension)
      show("rfc3966", @dn.format_rfc3966(pn))
    }
  }

  head("the number types a length admits")
  types_of("+86 131 2345 6789", "")
  types_of("+44 7400 123456", "")

  head("region facts come from the table")
  let facts : Array[String] = ["US", "JP", "DE", "IT"]
  for code in facts {
    fact(code)
  }
}
