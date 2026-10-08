# Changelog — Partner Account Tech Plan (stand-alone plugin)

Plugin version in `partner-account-tech-plan/.claude-plugin/plugin.json`. Bump on any material skill change that
ships; record the source commit in `VENDOR.md`.

## 0.1.1 — 2026-10-08

Refreshes the skill to @51013ac — adds `refs/external-sources.md`, a catalog of external research sources
(LinkedIn execs, SEC 10-K risk factors, press/newsroom, events, analyst/review, funding/ownership) wired into the
profile and red-team/commercial stages. Vendored copy re-validates 13/13.

## 0.1.0 — 2026-10-08

Initial stand-alone release. Marketplace + single-skill plugin carrying **partner-account-tech-plan** (@eb36eb6),
the Tier-3 orchestrator that composes the deliverable-forge family (partner-blocker-forge, tech-strat-pov-forge +
its commercial/red-team/readiness/architecture stages, pie-poc-forge, workshop-forge) as subagents, with a
built-in Org62 case scan and a trust/relationship-posture overlay, into one living, V2MOM-framed Partner Account
Tech Plan. Dogfood-proven against Riskonnect. Vendored copy re-validates 13/13.

Note: installed stand-alone, the five subagent skills are not bundled; the orchestrator degrades gracefully when a
subagent is absent. For the full set, install the `partner-solutions` suite (which also carries this orchestrator).
