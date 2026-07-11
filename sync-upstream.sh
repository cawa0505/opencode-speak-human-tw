#!/usr/bin/env bash
set -euo pipefail

UPSTREAM="https://github.com/Raymondhou0917/speak-human-tw.git"
DEST="$(dirname "$0")/skills/speak-human-tw"
TMPDIR=$(mktemp -d)

cleanup() { rm -rf "$TMPDIR"; }
trap cleanup EXIT

echo "Cloning $UPSTREAM ..."
git clone --depth 1 "$UPSTREAM" "$TMPDIR/repo"

echo "Syncing SKILL.md, references/, evals/, LICENSE, CHANGELOG.md ..."
for item in SKILL.md LICENSE CHANGELOG.md references evals; do
  rsync -av --delete "$TMPDIR/repo/$item" "$DEST/"
done

echo "Done. Check with: git diff"
