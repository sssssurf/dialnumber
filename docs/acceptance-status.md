# Acceptance delivery status

Project: sssssurf/dialnumber 0.8.1. Updated: 2026-10-27.

- Application review: passed, as confirmed by the participant's organizer email.
- Final technical checks: run with scripts/acceptance.mjs; results are recorded
  in .cache/acceptance/report.json and the committed acceptance-results.json.
- Public source: GitHub main; full source history is retained.
- Mooncakes: 0.8.1 is published and was confirmed through the public registry.
  An isolated consumer resolved exactly 0.8.1 from the registry, without any
  local path dependency, and reproduced every public-API example output.
  Evidence: [published-consumer-results.json](published-consumer-results.json).
- Organizer's final acceptance decision: pending. Local checks and CI are
  engineering evidence, not an official approval notice.

Criteria, scope and submission-ready explanation:
[验收材料.md](验收材料.md). The October deadline is 2026-10-31 according to the
[current event page](https://moonbitlang.github.io/Hackathon2026/).

This is the already-approved application's final-delivery stage; it does not
request a new initial review or replace the accepted registration form.

One-command technical checks and the supplemental native check all passed:
632/632 tests on js, wasm, wasm-gc and native, documentation snapshots, the
public example, 12 benchmarks, six generation checks and packaged-source checks.
See [acceptance-results.json](acceptance-results.json). Native was verified with
the same toolchain in WSL/GCC; the scripted Windows report explicitly lists its
three selected targets instead of pretending to have run native there.
