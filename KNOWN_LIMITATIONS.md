# KNOWN_LIMITATIONS.md — Orchestrator V2

The build did not start. The controlling limitation is environmental:

1. This session was scoped to `pri8771/primandir-landing`, which does not
   contain `orchestrator-v2-master-spec.md` or `orchestrator-v2-source/`.
   Building without the authoritative spec would have required fabricating it,
   which the spec's own rules forbid.
2. The session runs in a Linux container with no Swift/Xcode toolchain, so the
   native macOS app could not have been built or launched even with the spec.

See `PREFLIGHT_RESULTS.md` and `NEXT_MILESTONES.md`.
