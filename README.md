# Partner Account Tech Plan — stand-alone Claude plugin + marketplace

A travelable Claude Code **marketplace** carrying a single skill: **partner-account-tech-plan**, the Tier-3
orchestrator that assembles a living, V2MOM-framed Partner Account Tech Plan for a strategic ISV/OEM partner.

> Prefer the whole deliverable-forge family? Install the **`partner-solutions`** suite instead — it bundles this
> orchestrator together with the five forge skills it runs as subagents. This stand-alone plugin is for sharing
> the orchestrator on its own.

## The skill

| Skill | Turns… | …into |
|-------|--------|-------|
| **partner-account-tech-plan** | a strategic ISV/OEM partner account | one living, V2MOM-framed account tech plan — orchestrates partner-blocker-forge + tech-strat-pov-forge (POV + commercial/red-team/readiness/architecture) + pie-poc-forge + workshop-forge as subagents, plus a built-in Org62 case scan and a trust-posture overlay |

## Install

```
/plugin marketplace add <this-repo-url-or-path>
/plugin install partner-account-tech-plan
```

Then invoke `/partner-account-tech-plan`.

### Subagent dependency (read this)

The orchestrator **runs the five forge skills as subagents** (partner-blocker-forge, tech-strat-pov-forge,
pie-poc-forge, workshop-forge). Installed stand-alone, those skills are **not** bundled. The skill is built to
**degrade gracefully** — when a subagent skill is unavailable, the matching section is noted as not-generated and
the plan still assembles from the orchestrator's own research/Org62 work. For the full-fidelity experience, also
install the forge skills (easiest via the `partner-solutions` suite).

## Layout

```
.claude-plugin/marketplace.json       # the marketplace (one plugin)
partner-account-tech-plan/
  .claude-plugin/plugin.json          # the plugin (version + changelog)
  skills/partner-account-tech-plan/   # the skill, vendored as real content
scripts/sync-skill.sh                 # re-vendor from the canonical skill repo
```

## How this is maintained (important)

- **The canonical skill repo lives at `~/.claude/skills/partner-account-tech-plan` (its own git repo).** That is
  where you **develop, test, and commit** — it keeps its own `tests/validate_skill.py`, pre-commit hook, and CI.
- **This repo is a distribution artifact.** `skills/partner-account-tech-plan/` is a **vendored copy** produced by
  `scripts/sync-skill.sh` (`git archive HEAD` → tracked files only; `.git`/`.notes`/`.superpowers` never travel).
  After committing a change in the source skill, run the sync script and commit the refresh here.
- **Do not hand-edit `partner-account-tech-plan/skills/**`** — edits there are overwritten on the next sync.
  Change the source skill, then sync.

## Versioning

A plugin version in `partner-account-tech-plan/.claude-plugin/plugin.json` (starts `0.1.0`) + a changelog. The
vendored source commit is recorded in `VENDOR.md`.
