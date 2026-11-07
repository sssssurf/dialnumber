// A small pattern engine for numbering-plan rules.
//
// The numbering plans published by libphonenumber describe each number type with
// a regular expression over the national number, for example
//
//     (?:2(?:04|[23]6|[48]9)|3(?:06|43|54))\d{7}
//
// Those expressions are not arbitrary PCRE: the corpus uses only literals,
// `\d`, character classes with ranges, non-capturing groups, alternation and the
// `?`, `*`, `+`, `{n}`, `{n,}` and `{n,m}` quantifiers. This file implements
// exactly that grammar: a recursive-descent parser builds a syntax tree, the
// tree is compiled to a Thompson NFA, and matching simulates the NFA over a set
// of live states.
//
// The simulation matters: it is O(pattern size x input length) and cannot
// backtrack, so a hostile pattern cannot make a validation call explode. The
// engine is also deliberately total — a malformed pattern is a parse failure,
// not a panic.

// ---------------------------------------------------------------------------
// Syntax tree
// ---------------------------------------------------------------------------

///|
/// One node of a parsed pattern.
priv enum PatNode {
  PatLit(Char)
  PatDigit
  PatClass(Array[(Char, Char)])
  PatSeq(Array[PatNode])
  PatAlt(Array[PatNode])
  PatRep(PatNode, Int32, Int32) // minimum, maximum; -1 means unbounded
  PatCapture(Int32, PatNode)
}

// ---------------------------------------------------------------------------
// Parser
// ---------------------------------------------------------------------------

///|
/// Parse a whole pattern. None when the text is not a member of the grammar.
fn parse_pattern(text : String) -> PatNode? {
  let src = chars_of(text)
  if src.length() > 8192 {
    return None
  }
  let mut depth = 0
  let mut in_class = false
  for i = 0; i < src.length(); i = i + 1 {
    if src[i] == '[' {
      in_class = true
    }
    if src[i] == ']' {
      in_class = false
    }
    if !in_class && src[i] == '(' {
      depth = depth + 1
    }
    if !in_class && src[i] == ')' {
      depth = depth - 1
    }
    if depth > 64 {
      return None
    }
  }
  match parse_alt(src, 0) {
    None => None
    Some((node, end)) =>
      if end == src.length() && pattern_cost(node, 65536) is Some(_) {
        Some(node)
      } else {
        None
      }
  }
}

///|
/// `alt := seq ('|' seq)*`
fn parse_alt(src : Array[Char], pos : Int32) -> (PatNode, Int32)? {
  let branches : Array[PatNode] = []
  let mut p = pos
  let (first, np) = match parse_seq(src, p) {
    None => return None
    Some(v) => v
  }
  branches.push(first)
  p = np
  while p < src.length() && src[p] == '|' {
    let (next, np2) = match parse_seq(src, p + 1) {
      None => return None
      Some(v) => v
    }
    branches.push(next)
    p = np2
  }
  if branches.length() == 1 {
    Some((branches[0], p))
  } else {
    Some((PatAlt(branches), p))
  }
}

///|
/// `seq := atom*`, stopping at end of input, `|` or `)`.
fn parse_seq(src : Array[Char], pos : Int32) -> (PatNode, Int32)? {
  let items : Array[PatNode] = []
  let mut p = pos
  while p < src.length() && src[p] != '|' && src[p] != ')' {
    let (node, np) = match parse_atom(src, p) {
      None => return None
      Some(v) => v
    }
    items.push(node)
    p = np
  }
  if items.length() == 1 {
    Some((items[0], p))
  } else {
    Some((PatSeq(items), p))
  }
}

///|
/// `atom := base quantifier?`
fn parse_atom(src : Array[Char], pos : Int32) -> (PatNode, Int32)? {
  let (base, p) = match parse_base(src, pos) {
    None => return None
    Some(v) => v
  }
  if p >= src.length() {
    return Some((base, p))
  }
  match src[p] {
    '?' => Some((PatRep(base, 0, 1), p + 1))
    '*' => Some((PatRep(base, 0, -1), p + 1))
    '+' => Some((PatRep(base, 1, -1), p + 1))
    '{' => parse_braces(src, p, base)
    _ => Some((base, p))
  }
}

///|
/// `{n}`, `{n,}` and `{n,m}` after an atom.
fn parse_braces(
  src : Array[Char],
  pos : Int32,
  base : PatNode,
) -> (PatNode, Int32)? {
  let (min, p0) = match parse_int(src, pos + 1) {
    None => return None
    Some(v) => v
  }
  if min > 10000 {
    return None
  }
  if p0 >= src.length() {
    return None
  }
  if src[p0] == '}' {
    return Some((PatRep(base, min, min), p0 + 1))
  }
  if src[p0] != ',' {
    return None
  }
  if p0 + 1 < src.length() && src[p0 + 1] == '}' {
    return Some((PatRep(base, min, -1), p0 + 2))
  }
  let (max, p1) = match parse_int(src, p0 + 1) {
    None => return None
    Some(v) => v
  }
  if p1 >= src.length() || src[p1] != '}' || max < min || max > 10000 {
    return None
  }
  Some((PatRep(base, min, max), p1 + 1))
}

///|
/// A run of decimal digits.
fn parse_int(src : Array[Char], pos : Int32) -> (Int32, Int32)? {
  let mut p = pos
  let mut v = 0
  while p < src.length() && is_digit(src[p]) {
    let digit = src[p].to_int() - '0'.to_int()
    if v > (2147483647 - digit) / 10 {
      return None
    }
    v = v * 10 + digit
    p = p + 1
  }
  if p == pos {
    None
  } else {
    Some((v, p))
  }
}

///|
/// A literal, `\d`, a class, or a group.
fn parse_base(src : Array[Char], pos : Int32) -> (PatNode, Int32)? {
  if pos >= src.length() {
    return None
  }
  match src[pos] {
    '\\' =>
      if pos + 1 < src.length() && src[pos + 1] == 'd' {
        Some((PatDigit, pos + 2))
      } else {
        None
      }
    '[' => parse_class(src, pos)
    '(' => parse_group(src, pos)
    ')' | '|' | '?' | '*' | '+' | '{' => None
    c => Some((PatLit(c), pos + 1))
  }
}

///|
/// `(?:alt)` or `(alt)`.
fn parse_group(src : Array[Char], pos : Int32) -> (PatNode, Int32)? {
  let mut p = pos + 1
  let noncapturing = p + 1 < src.length() && src[p] == '?' && src[p + 1] == ':'
  if noncapturing {
    p = p + 2
  }
  let (inner, np) = match parse_alt(src, p) {
    None => return None
    Some(v) => v
  }
  if np >= src.length() || src[np] != ')' {
    return None
  }
  Some(
    (
      if noncapturing {
        inner
      } else {
        PatCapture(capture_count(src, pos) + 1, inner)
      },
      np + 1,
    ),
  )
}

///|
/// Capturing group numbers are lexical, including groups in unmatched branches.
fn capture_count(src : Array[Char], end : Int32) -> Int32 {
  let mut count = 0
  let mut in_class = false
  let mut i = 0
  while i < end {
    if src[i] == '\\' {
      i = i + 2
      continue
    }
    if src[i] == '[' {
      in_class = true
    }
    if src[i] == ']' {
      in_class = false
    }
    if !in_class &&
      src[i] == '(' &&
      !(i + 1 < src.length() && src[i + 1] == '?') {
      count = count + 1
    }
    i = i + 1
  }
  count
}

///|
/// Bound expanded NFA size before allocation; arithmetic is checked against
/// remaining budget before addition/multiplication, including nested repeats.
fn pattern_cost(node : PatNode, budget : Int32) -> Int32? {
  if budget < 4 {
    return None
  }
  match node {
    PatLit(_) | PatDigit | PatClass(_) => Some(1)
    PatCapture(_, inner) => pattern_cost(inner, budget)
    PatSeq(items) | PatAlt(items) => {
      let mut sum = 2
      for item in items {
        let cost = match pattern_cost(item, budget - sum) {
          None => return None
          Some(v) => v
        }
        if cost + 2 > budget - sum {
          return None
        }
        sum = sum + cost + 2
      }
      Some(sum)
    }
    PatRep(inner, min, max) => {
      let cost = match pattern_cost(inner, budget - 4) {
        None => return None
        Some(v) => v + 2
      }
      let copies = if max < 0 { min + 1 } else { max }
      if copies > (budget - 4) / cost {
        None
      } else {
        Some(4 + cost * copies)
      }
    }
  }
}

///|
/// `[...]` with single characters and `a-b` ranges.
fn parse_class(src : Array[Char], pos : Int32) -> (PatNode, Int32)? {
  let ranges : Array[(Char, Char)] = []
  let mut p = pos + 1
  if p < src.length() && src[p] == '^' {
    // Negation is outside the published grammar; reject rather than guess.
    return None
  }
  while p < src.length() && src[p] != ']' {
    let lo = src[p]
    if lo == '\\' {
      return None
    }
    if p + 2 < src.length() && src[p + 1] == '-' && src[p + 2] != ']' {
      let hi = src[p + 2]
      if hi < lo {
        return None
      }
      ranges.push((lo, hi))
      p = p + 3
    } else {
      ranges.push((lo, lo))
      p = p + 1
    }
  }
  if p >= src.length() || ranges.length() == 0 {
    return None
  }
  Some((PatClass(ranges), p + 1))
}

// ---------------------------------------------------------------------------
// Thompson NFA
// ---------------------------------------------------------------------------

///|
let st_char : Int32 = 0

///|
let st_split : Int32 = 1

///|
let st_match : Int32 = 2

///|
/// A character predicate: explicit ranges, and whether `\d` is included.
priv struct PatClassSet {
  ranges : Array[(Char, Char)]
  digits : Bool
}

///|
/// A compiled program: four integers per state (kind, class index, out1, out2).
priv struct PatProg {
  code : Array[Int32]
  classes : Array[PatClassSet]
}

///|
/// A fragment under construction: an entry state and the edges still dangling.
priv struct PatFrag {
  start : Int32
  holes : Array[(Int32, Int32)] // (state index, 0 = out1, 1 = out2)
}

///|
/// Append a state and return its index.
fn pat_emit(
  prog : PatProg,
  kind : Int32,
  cls : Int32,
  out1 : Int32,
  out2 : Int32,
) -> Int32 {
  let idx = prog.code.length() / 4
  prog.code.push(kind)
  prog.code.push(cls)
  prog.code.push(out1)
  prog.code.push(out2)
  idx
}

///|
/// Point every dangling edge at `target`.
fn pat_patch(
  prog : PatProg,
  holes : Array[(Int32, Int32)],
  target : Int32,
) -> Unit {
  for h in holes {
    let slot = h.0 * 4 + 2 + h.1
    prog.code[slot] = target
  }
}

///|
/// An empty fragment: a single epsilon edge that is still dangling.
fn pat_epsilon(prog : PatProg) -> PatFrag {
  let idx = pat_emit(prog, st_split, -1, -1, -1)
  { start: idx, holes: [(idx, 0)], }
}

///|
/// Compile a syntax tree into one fragment.
fn pat_compile(prog : PatProg, node : PatNode) -> PatFrag {
  match node {
    PatCapture(_, inner) => pat_compile(prog, inner)
    PatLit(c) => {
      let cls = prog.classes.length()
      prog.classes.push({ ranges: [(c, c)], digits: false, })
      let idx = pat_emit(prog, st_char, cls, -1, -1)
      { start: idx, holes: [(idx, 0)], }
    }
    PatDigit => {
      let cls = prog.classes.length()
      prog.classes.push({ ranges: [], digits: true, })
      let idx = pat_emit(prog, st_char, cls, -1, -1)
      { start: idx, holes: [(idx, 0)], }
    }
    PatClass(ranges) => {
      let cls = prog.classes.length()
      prog.classes.push({ ranges, digits: false, })
      let idx = pat_emit(prog, st_char, cls, -1, -1)
      { start: idx, holes: [(idx, 0)], }
    }
    PatSeq(items) => pat_compile_seq(prog, items)
    PatAlt(items) => pat_compile_alt(prog, items)
    PatRep(body, min, max) => pat_compile_rep(prog, body, min, max)
  }
}

///|
/// Concatenation: chain the fragments, patching each exit into the next entry.
fn pat_compile_seq(prog : PatProg, items : Array[PatNode]) -> PatFrag {
  if items.length() == 0 {
    return pat_epsilon(prog)
  }
  let mut frag = pat_compile(prog, items[0])
  let mut i = 1
  while i < items.length() {
    let next = pat_compile(prog, items[i])
    pat_patch(prog, frag.holes, next.start)
    frag = { start: frag.start, holes: next.holes, }
    i = i + 1
  }
  frag
}

///|
/// Alternation: a chain of splits, built from the right so each split can point
/// at the rest of the chain.
fn pat_compile_alt(prog : PatProg, items : Array[PatNode]) -> PatFrag {
  if items.length() == 0 {
    return pat_epsilon(prog)
  }
  let mut frag = pat_compile(prog, items[items.length() - 1])
  let mut i = items.length() - 1
  while i > 0 {
    i = i - 1
    let left = pat_compile(prog, items[i])
    let split = pat_emit(prog, st_split, -1, left.start, frag.start)
    let holes : Array[(Int32, Int32)] = []
    for h in left.holes {
      holes.push(h)
    }
    for h in frag.holes {
      holes.push(h)
    }
    frag = { start: split, holes, }
  }
  frag
}

///|
/// Repetition. `min` mandatory copies, then either a loop (unbounded) or
/// `max - min` optional copies. Bounded expansion is what the published corpus
/// needs: no quantifier in it is larger than fourteen.
fn pat_compile_rep(
  prog : PatProg,
  body : PatNode,
  min : Int32,
  max : Int32,
) -> PatFrag {
  if max == 0 {
    return pat_epsilon(prog)
  }
  // The tail: a loop when unbounded, otherwise a cascade of optional copies.
  let mut tail = pat_epsilon(prog)
  if max < 0 {
    let inner = pat_compile(prog, body)
    let split = pat_emit(prog, st_split, -1, inner.start, tail.start)
    pat_patch(prog, inner.holes, split)
    tail = { start: split, holes: tail.holes, }
  } else {
    let mut copies = max - min
    while copies > 0 {
      let inner = pat_compile(prog, body)
      let split = pat_emit(prog, st_split, -1, inner.start, tail.start)
      pat_patch(prog, inner.holes, tail.start)
      tail = { start: split, holes: tail.holes, }
      copies = copies - 1
    }
  }
  // The mandatory prefix.
  let mut head = pat_epsilon(prog)
  let mut made = 0
  while made < min {
    let copy = pat_compile(prog, body)
    pat_patch(prog, head.holes, copy.start)
    head = { start: head.start, holes: copy.holes, }
    made = made + 1
  }
  pat_patch(prog, head.holes, tail.start)
  { start: head.start, holes: tail.holes, }
}

///|
/// Compile a syntax tree and finish it with an accept state. The entry state is
/// not always the first emitted one (an alternation is a split emitted after its
/// branches, a repetition an epsilon emitted before its body), so it is returned
/// alongside the program.
fn pat_build(node : PatNode) -> (PatProg, Int32) {
  let prog : PatProg = { code: [], classes: [], }
  let frag = pat_compile(prog, node)
  let accept = pat_emit(prog, st_match, -1, -1, -1)
  pat_patch(prog, frag.holes, accept)
  (prog, frag.start)
}

// ---------------------------------------------------------------------------
// Simulation
// ---------------------------------------------------------------------------

///|
/// True when `c` is in the class.
fn pat_class_matches(cls : PatClassSet, c : Char) -> Bool {
  if cls.digits && is_digit(c) {
    return true
  }
  for r in cls.ranges {
    if c >= r.0 && c <= r.1 {
      return true
    }
  }
  false
}

///|
/// Add the epsilon closure of `state` to the active list, stamping each state
/// with the current generation so it is added at most once per step.
fn pat_closure(
  prog : PatProg,
  state : Int32,
  mark : Array[Int32],
  gen : Int32,
  out : Array[Int32],
) -> Unit {
  if state < 0 || mark[state] == gen {
    return
  }
  mark[state] = gen
  let work : Array[Int32] = [state]
  let mut head = 0
  while head < work.length() {
    let s = work[head]
    head = head + 1
    if prog.code[s * 4] == st_split {
      let a = prog.code[s * 4 + 2]
      let b = prog.code[s * 4 + 3]
      if a >= 0 && mark[a] != gen {
        mark[a] = gen
        work.push(a)
      }
      if b >= 0 && mark[b] != gen {
        mark[b] = gen
        work.push(b)
      }
    } else {
      out.push(s)
    }
  }
}

///|
/// Run the program over the whole input.
///
/// The live states are kept as a list rather than a bitmap over every state: a
/// plan rule is a large alternation, and after the first digit only a handful of
/// its branches can still be alive. Walking those instead of the whole program is
/// what keeps a validation cheap even for the longest published rule.
fn pat_run(prog : PatProg, start : Int32, input : Array[Char]) -> Bool {
  let states = prog.code.length() / 4
  let mark = Array::make(states, 0)
  let mut gen = 1
  let mut cur : Array[Int32] = []
  pat_closure(prog, start, mark, gen, cur)
  for ch in input {
    if cur.length() == 0 {
      return false
    }
    gen = gen + 1
    let nxt : Array[Int32] = []
    for s in cur {
      if prog.code[s * 4] == st_char {
        let cls = prog.code[s * 4 + 1]
        if pat_class_matches(prog.classes[cls], ch) {
          pat_closure(prog, prog.code[s * 4 + 2], mark, gen, nxt)
        }
      }
    }
    cur = nxt
  }
  for s in cur {
    if prog.code[s * 4] == st_match {
      return true
    }
  }
  false
}

///|
/// Run the program and stop as soon as a prefix of the input has been accepted.
/// This is `lookingAt` semantics: the pattern has to match where the number
/// starts, not the whole of it.
fn pat_run_prefix(prog : PatProg, start : Int32, input : Array[Char]) -> Bool {
  let states = prog.code.length() / 4
  let mark = Array::make(states, 0)
  let mut gen = 1
  let mut cur : Array[Int32] = []
  pat_closure(prog, start, mark, gen, cur)
  let mut step = 0
  while step <= input.length() {
    let mut accepted = false
    for s in cur {
      if prog.code[s * 4] == st_match {
        accepted = true
      }
    }
    if accepted {
      return true
    }
    if step == input.length() || cur.length() == 0 {
      return false
    }
    gen = gen + 1
    let nxt : Array[Int32] = []
    for s in cur {
      if prog.code[s * 4] == st_char {
        let cls = prog.code[s * 4 + 1]
        if pat_class_matches(prog.classes[cls], input[step]) {
          pat_closure(prog, prog.code[s * 4 + 2], mark, gen, nxt)
        }
      }
    }
    cur = nxt
    step = step + 1
  }
  false
}

// ---------------------------------------------------------------------------
// Public surface
// ---------------------------------------------------------------------------

///|
/// A compiled pattern, ready to run: the program and its entry state.
priv struct CompiledPattern {
  prog : PatProg
  start : Int32
}

///|
/// Compile a pattern once. A pattern outside the grammar compiles to a program
/// that matches nothing, so the caller never has to carry the failure around.
fn compile_pattern(pattern : String) -> CompiledPattern {
  match parse_pattern(pattern) {
    None => { prog: { code: [], classes: [], }, start: -1, }
    Some(node) => {
      let (prog, start) = pat_build(node)
      { prog, start, }
    }
  }
}

///|
/// Run a compiled pattern over the whole text.
fn run_pattern(c : CompiledPattern, text : String) -> Bool {
  if c.start < 0 {
    return false
  }
  pat_run(c.prog, c.start, chars_of(text))
}

///|
/// True when the pattern matches some prefix of the text — the `lookingAt`
/// question the plan data asks of its leading-digit patterns. One pass over the
/// input, not one match per prefix.
fn run_pattern_prefix(c : CompiledPattern, text : String) -> Bool {
  if c.start < 0 {
    return false
  }
  pat_run_prefix(c.prog, c.start, chars_of(text))
}

///|
/// True when `text` matches `pattern` in full, under the numbering-plan grammar.
/// A pattern that does not parse matches nothing, so a bad data row can never
/// turn into a false positive.
pub fn matches_pattern(pattern : String, text : String) -> Bool {
  match parse_pattern(pattern) {
    None => false
    Some(node) => {
      let (prog, start) = pat_build(node)
      pat_run(prog, start, chars_of(text))
    }
  }
}

///|
/// True when the pattern is a member of the supported grammar. Used by the
/// data-pipeline tests to prove every published rule can be interpreted.
pub fn pattern_well_formed(pattern : String) -> Bool {
  parse_pattern(pattern) is Some(_)
}
