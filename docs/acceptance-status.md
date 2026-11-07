# Acceptance status

Updated: 2026-11-07. Current repair version: 0.9.0.

- Application review: passed, as confirmed by the participant's organizer email.
- Formal acceptance of the October 0.8.1 submission: **rejected**. The organizer
  reported missing national-prefix transforms, skipped national round trips,
  repeat-count overflow and RFC3966 compatibility defects.
- 0.9.0 repairs are after that submission and are dated honestly. They do not
  establish retrospective October completion or renewed organizer approval.
- Current engineering evidence is recorded in acceptance-results.json; the
  public review regression example is examples/review.
- Publication and isolated consumer evidence: published-consumer-results.json.
- Supplement/re-review: not submitted by this tool; acceptance requires an
  explicit organizer decision about whether these post-deadline repairs may
  be considered. No re-review or final approval is claimed.

The old successful build/smoke results were incomplete coverage, not proof of
prefix-transform correctness. They are retained under docs/history/0.8.1-*.
The new coverage includes all 32 transform plans without skipping national
round trips, 102 original Java oracle scenarios, 1,872 independent prefix
capture cases and focused overflow/RFC regressions.

Read [正式验收修正说明.md](正式验收修正说明.md) for the exact root causes,
examples, scope and submission-ready explanation. The October deadline was
2026-10-31; this corrective work is dated 2026-11-07.
