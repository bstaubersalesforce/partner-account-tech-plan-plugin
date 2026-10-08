#!/usr/bin/env bash
# Re-vendor the partner-account-tech-plan skill from its canonical repo in
# ~/.claude/skills into this stand-alone plugin. The standalone repo is where you
# DEVELOP, test, and commit; this repo is the travelable distribution artifact.
#
# Uses `git archive HEAD` → only the committed, tracked tree (honors the skill's
# .gitignore, so .git/.notes/.superpowers never travel; docs/superpowers specs do).
# Run after committing changes in the source skill.
#
# Usage: scripts/sync-skill.sh
#        SKILL_SRC=/path scripts/sync-skill.sh   (override source)
set -euo pipefail

SRC="${SKILL_SRC:-$HOME/.claude/skills/partner-account-tech-plan}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEST="$HERE/partner-account-tech-plan/skills/partner-account-tech-plan"

[ -d "$SRC/.git" ] || { echo "ERROR: $SRC is not a git repo"; exit 1; }
rm -rf "${DEST:?}"
mkdir -p "$DEST"
git -C "$SRC" archive HEAD | tar -x -C "$DEST"
rev="$(git -C "$SRC" rev-parse --short HEAD)"
echo "vendored partner-account-tech-plan @ $rev"

# Guard: no dev-only dirs should ever land in the vendored tree.
if find "$DEST" -maxdepth 2 \( -name .git -o -name .notes -o -name .superpowers \) | grep -q .; then
  echo "ERROR: dev-only dir leaked into vendored tree"; exit 1
fi
echo "sync complete → $DEST"
