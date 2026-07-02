# NEXT_MILESTONES.md — Orchestrator V2

**Status: no milestones completed. All work remains.**

Milestone 0 (preflight) was run and failed — see `PREFLIGHT_RESULTS.md`. The
blockers are environmental, not technical:

1. **Wrong repository.** This session was launched against
   `pri8771/primandir-landing` (a static landing site). The spec
   (`orchestrator-v2-master-spec.md`) and working code (`orchestrator-v2-source/`)
   live in the `ios-app-factory` repository, which is not accessible from this
   session.
2. **Wrong platform.** This is a Linux container with no Swift/Xcode toolchain;
   the deliverable is a native macOS SwiftUI app.

## To restart correctly

Run Claude Code locally on the Mac, from
`/Users/pchordia/Documents/Github/ios-app-factory`, with the same task prompt.
From there the full Section 28 milestone order applies, starting again at
Milestone 0 (preflight will then be able to check Xcode and the real agent
CLIs) and proceeding to the Milestone 1 vertical slice.

No partial work needs to be carried over from this branch — nothing beyond
these status files was produced here.
