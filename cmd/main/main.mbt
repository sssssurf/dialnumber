// A small command-line front end for the dialnumber library.
//
// Each subcommand parses its argument the same way the library would and prints
// a short report. The output is the contract the README records, so it is kept
// stable and plain.

///|
fn main {
  let args = @env.args()
  if args.length() < 2 {
    print_usage()
    return
  }
  let sub = args[1]
  let arg = arg_at(args, 2)
  let region = arg_at(args, 3)
  match sub {
    "parse" => run_parse(arg, region)
    "info" => run_info(arg)
    "possible" => run_possible(arg, region)
    "format" => run_format(arg, region)
    "types" => run_types(arg, region)
    "region" => run_region(arg)
    "cc" => run_cc(arg)
    "tel" => run_tel(arg)
    "list" => run_list()
    _ => print_usage()
  }
}

///|
/// The argument at `i`, or "" when the command line is shorter.
fn arg_at(args : Array[String], i : Int) -> String {
  if i < args.length() {
    args[i]
  } else {
    ""
  }
}

///|
fn print_usage() -> Unit {
  println(
    "usage: dialnumber <command> [args]\n" +
    "  parse <number> [region]    parse and report the parts\n" +
    "  possible <number> [region]  length check against the region's plan\n" +
    "  format <number> [region]    the four renderings\n" +
    "  types <number> [region]     number types the length admits\n" +
    "  region <number>             the region a parsed number resolves to\n" +
    "  info <region>               calling code, prefixes and lengths\n" +
    "  cc <region>                 just the calling code\n" +
    "  tel <uri>                   parse an RFC 3966 tel: URI\n" +
    "  list                        every region code in the table",
  )
}

///|
fn run_parse(input : String, region : String) -> Unit {
  match @dialnumber.parse(input, region) {
    None => println("parse: invalid input")
    Some(pn) => {
      println("country_code: \{pn.country_code}")
      println("national_number: \{pn.national_number}")
      println("e164: \{@dialnumber.format_e164(pn)}")
      show_region(@dialnumber.region_of_number(pn))
    }
  }
}

///|
fn run_possible(input : String, region : String) -> Unit {
  match @dialnumber.parse(input, region) {
    None => println("possible: no (unreadable)")
    Some(pn) => {
      println("possible: \{yes_no(@dialnumber.is_possible(pn))}")
      show_region(@dialnumber.region_of_number(pn))
    }
  }
}

///|
fn run_format(input : String, region : String) -> Unit {
  match @dialnumber.parse(input, region) {
    None => println("format: invalid input")
    Some(pn) => {
      println("e164: \{@dialnumber.format_e164(pn)}")
      println("international: \{@dialnumber.format_international(pn)}")
      let nat = match @dialnumber.format_national(pn, region) {
        Some(v) => v
        None => "(need a region)"
      }
      println("national: " + nat)
      println("rfc3966: \{@dialnumber.format_rfc3966(pn)}")
    }
  }
}

///|
fn run_types(input : String, region : String) -> Unit {
  match @dialnumber.parse(input, region) {
    None => println("types: invalid input")
    Some(pn) => {
      let ts = @dialnumber.possible_types(pn)
      let names : Array[String] = []
      for t in ts {
        names.push(t.to_string())
      }
      println("types: \{join(names, ",")}")
    }
  }
}

///|
fn run_region(input : String) -> Unit {
  match @dialnumber.parse(input, "") {
    None =>
      match @dialnumber.parse(input, "US") {
        None => println("region: unresolved")
        Some(pn) => show_region(@dialnumber.region_of_number(pn))
      }
    Some(pn) => show_region(@dialnumber.region_of_number(pn))
  }
}

///|
fn show_region(code : String?) -> Unit {
  match code {
    Some(c) => println("region: \{c}")
    None => println("region: unresolved")
  }
}

///|
fn run_info(code : String) -> Unit {
  match @dialnumber.region_name(code) {
    None => println("region: unknown")
    Some(name) => {
      let canon = match @dialnumber.canonical_region_code(code) {
        Some(c) => c
        None => code
      }
      println("region: " + canon)
      println("name: \{name}")
      match @dialnumber.calling_code(code) {
        Some(v) => println("calling_code: \{v}")
        None => println("calling_code: (none)")
      }
      match @dialnumber.idd_prefix(code) {
        Some(v) => println("idd: \{v}")
        None => println("idd: (none)")
      }
      match @dialnumber.national_prefix(code) {
        Some(v) => println("national_prefix: \{v}")
        None => println("national_prefix: (none)")
      }
      match @dialnumber.possible_lengths(code) {
        Some(lens) => {
          let parts : Array[String] = []
          for n in lens {
            parts.push(n.to_string())
          }
          println("lengths: \{join(parts, ",")}")
        }
        None => println("lengths: (none)")
      }
    }
  }
}

///|
fn run_cc(code : String) -> Unit {
  match @dialnumber.calling_code(code) {
    Some(v) => println("cc: \{v}")
    None => println("cc: (unknown)")
  }
}

///|
fn run_tel(uri : String) -> Unit {
  match @dialnumber.parse_tel_uri(uri) {
    None => println("tel: invalid uri")
    Some(pn) => {
      println("e164: \{@dialnumber.format_e164(pn)}")
      println("extension: \{if pn.extension == "" { "(none)" } else { pn.extension }}")
    }
  }
}

///|
fn run_list() -> Unit {
  println(join(@dialnumber.region_codes(), " "))
}

///|
fn yes_no(b : Bool) -> String {
  if b { "yes" } else { "no" }
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
