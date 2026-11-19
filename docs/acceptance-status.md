# Acceptance status

Updated: 2026-11-19. Current version: 0.13.0.

The November submission materials are in 十一月验收.md. They identify the
current maintenance work against the 0.12.0 baseline and link measured
verification and publication results. Organizer review is pending.

- Application review: passed, as confirmed by the participant's organizer email.
- Formal acceptance of the October 0.8.1 submission: **rejected**. The organizer
  reported missing national-prefix transforms, skipped national round trips,
  repeat-count overflow and RFC3966 compatibility defects.
- Versions 0.9.0, 0.10.0 and 0.11.0 record work after the October deadline.
  Version 0.11.0 separates URI resolution from human-input normalization and
  exercises three round trips for all 1,132 plan examples.
- Current engineering evidence: acceptance-results.json. All four targets pass
  799 tests per target. The report records generator, integrity, example,
  documentation, benchmark and package checks.
- Publication, registry dependency and example output are recorded in
  published-consumer-results.json for the current version.
- Supplement/re-review: not submitted by this tool. The organizer must decide
  whether the post-deadline repairs may be considered; no final approval is claimed.

The current reference coverage has 134 original Google Java scenarios, including
119 phone workflows, three rejected inputs, six comparisons and six typing traces; 2,299 JavaScript
inputs and six typing traces; and 1,872 independent capture cases across all
32 transform plans. The corpus integrity check uses two passing controls and
seven corruptions that must fail for their specific integrity error.

The JavaScript corpus retains 15 differing cases / 28 fields. The CA local-only
UAN possibility difference is an explicit choice to follow original Google Java
IS_POSSIBLE_LOCAL_ONLY semantics; its validity, region and type have no exceptions.

Read [完整复核.md](完整复核.md) for current findings, coverage and scope.
[正式验收修正说明.md](正式验收修正说明.md) describes the earlier 0.9.0 repair.
Earlier engineering results are retained under docs/history; successful build
and smoke checks did not prove the then-missing core behavior. The original
October deadline was 2026-10-31.
