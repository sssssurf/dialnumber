# Acceptance status

Updated: 2026-11-09. Current full audit release: 0.10.0.

- Application review: passed, as confirmed by the participant's organizer email.
- Formal acceptance of the October 0.8.1 submission: **rejected**. The organizer
  reported missing national-prefix transforms, skipped national round trips,
  repeat-count overflow and RFC3966 compatibility defects.
- The 0.9.0 repair was dated 2026-11-07. The current 0.10.0 full audit and further
  repairs are dated 2026-11-09. Neither is retrospective October completion or
  renewed organizer approval.
- Current engineering evidence: acceptance-results.json. All four targets pass
  776 tests each; the report also records generator, integrity, example,
  documentation, benchmark and package checks.
- Mooncakes 0.10.0 is published. An isolated consumer resolved exactly 0.10.0
  from the registry with no local override, and passed both the basic and
  formal-review examples. Evidence: published-consumer-results.json.
- Supplement/re-review: not submitted by this tool. The organizer must decide
  whether the post-deadline repairs may be considered; no final approval is claimed.

The current reference coverage has 121 original Google Java scenarios, including
109 phone workflows, six comparisons and six typing traces; 2,299 JavaScript
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
