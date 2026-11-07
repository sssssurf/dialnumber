// Capture-aware evaluation of trusted numbering-plan prefix rules. Validation
// remains on the Thompson NFA; only prefix rewriting needs the captures. Ordered
// alternatives and greedy repeats retain the metadata's replacement semantics.

///|
priv struct PrefixMatch {
  end : Int32
  captures : Array[String?]
}

///|
fn prefix_eval(
  node : PatNode,
  src : Array[Char],
  state : PrefixMatch,
) -> Array[PrefixMatch] {
  match node {
    PatLit('$') => if state.end == src.length() { [state] } else { [] }
    PatLit(c) =>
      if state.end < src.length() && src[state.end] == c {
        [{ ..state, end: state.end + 1, }]
      } else {
        []
      }
    PatDigit =>
      if state.end < src.length() && is_digit(src[state.end]) {
        [{ ..state, end: state.end + 1, }]
      } else {
        []
      }
    PatClass(ranges) => {
      if state.end >= src.length() {
        return []
      }
      for (lo, hi) in ranges {
        if src[state.end] >= lo && src[state.end] <= hi {
          return [{ ..state, end: state.end + 1, }]
        }
      }
      []
    }
    PatCapture(id, inner) => {
      let out : Array[PrefixMatch] = []
      for result in prefix_eval(inner, src, state) {
        let captures = result.captures.copy()
        captures[id] = Some(slice(src, state.end, result.end - state.end))
        out.push({ ..result, captures, })
      }
      out
    }
    PatAlt(items) => {
      let out : Array[PrefixMatch] = []
      for item in items {
        for result in prefix_eval(item, src, state) {
          if out.length() >= 4096 {
            return []
          }
          out.push(result)
        }
      }
      out
    }
    PatSeq(items) => {
      let mut current = [state]
      for item in items {
        let next : Array[PrefixMatch] = []
        for prior in current {
          for result in prefix_eval(item, src, prior) {
            if next.length() >= 4096 {
              return []
            }
            next.push(result)
          }
        }
        current = next
        if current.length() == 0 {
          break
        }
      }
      current
    }
    PatRep(inner, min, max) => {
      let limit = if max < 0 { src.length() + 1 } else { max }
      let layers : Array[Array[PrefixMatch]] = []
      let mut current = [state]
      let mut count = 0
      let mut saved = 0
      while current.length() > 0 && count <= limit {
        if count >= min {
          saved = saved + current.length()
          if saved > 4096 {
            return []
          }
          layers.push(current)
        }
        if count == limit {
          break
        }
        let next : Array[PrefixMatch] = []
        for prior in current {
          for result in prefix_eval(inner, src, prior) {
            // Unbounded empty repetition cannot make progress.
            if max < 0 && result.end == prior.end {
              continue
            }
            if next.length() >= 4096 {
              return []
            }
            next.push(result)
          }
        }
        current = next
        count = count + 1
      }
      let out : Array[PrefixMatch] = []
      let mut i = layers.length()
      while i > 0 {
        i = i - 1
        for result in layers[i] {
          out.push(result)
        }
      }
      out
    }
  }
}

///|
fn match_national_prefix(pattern : String, digits : String) -> PrefixMatch? {
  if digits.length() > 250 {
    return None
  }
  let node = match parse_pattern(pattern) {
    None => return None
    Some(v) => v
  }
  let captures : Array[String?] = []
  for _ in 0..<(capture_count(chars_of(pattern), pattern.length()) + 1) {
    captures.push(None)
  }
  let results = prefix_eval(node, chars_of(digits), { end: 0, captures, })
  if results.length() == 0 {
    None
  } else {
    Some(results[0])
  }
}

///|
fn replace_prefix(
  rule : String,
  matched : PrefixMatch,
  digits : String,
) -> String {
  let buf = StringBuilder()
  let cs = chars_of(rule)
  let mut i = 0
  while i < cs.length() {
    if cs[i] == '$' &&
      i + 1 < cs.length() &&
      cs[i + 1] >= '1' &&
      cs[i + 1] <= '9' {
      let id = cs[i + 1].to_int() - '0'.to_int()
      if id < matched.captures.length() {
        match matched.captures[id] {
          Some(value) => buf.write_string(value)
          None => ()
        }
      }
      i = i + 2
    } else {
      buf.write_char(cs[i])
      i = i + 1
    }
  }
  buf.write_string(drop(digits, matched.end).unwrap())
  buf.to_string()
}
