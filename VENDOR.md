# Vendor provenance

The skill under `partner-account-tech-plan/skills/` is vendored from its canonical repo in
`~/.claude/skills/partner-account-tech-plan` via `scripts/sync-skill.sh` (`git archive HEAD`). Source commit at
vendor time:

| Skill | Source repo | Vendored @ commit | Date |
|-------|-------------|-------------------|------|
| `partner-account-tech-plan` | https://github.com/bstaubersalesforce/partner-account-tech-plan | `eb36eb6` | 2026-10-08 |

Re-run `scripts/sync-skill.sh` after committing changes in the source repo, then update this table + CHANGELOG and
bump the plugin version in `partner-account-tech-plan/.claude-plugin/plugin.json`.
