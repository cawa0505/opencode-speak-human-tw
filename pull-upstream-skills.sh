#!/usr/bin/env bash
set -euo pipefail

# ── Config ──────────────────────────────────────────────
UPSTREAM_REMOTE="upstream"
UPSTREAM_BRANCH="master"
SKILL_DIR="$(dirname "$0")/skills/speak-human-tw"

# Map: upstream root file → our target path (relative to SKILL_DIR)
FILES=(
  "SKILL.md:SKILL.md"
  "CHANGELOG.md:CHANGELOG.md"
  "LICENSE:LICENSE"
  "references/examples.md:references/examples.md"
  "references/humanize.md:references/humanize.md"
  "references/patterns.md:references/patterns.md"
  "references/protected-list.md:references/protected-list.md"
  "references/scenes.md:references/scenes.md"
  "references/taiwan-localization.md:references/taiwan-localization.md"
)

# ── Helpers ─────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

info()  { echo -e "${CYAN}◆${NC} $*"; }
ok()    { echo -e "${GREEN}✓${NC} $*"; }
warn()  { echo -e "${YELLOW}⚠${NC} $*"; }
err()   { echo -e "${RED}✗${NC} $*"; }

# ── Step 1: fetch upstream ──────────────────────────────
cd "$(dirname "$0")"

if ! git remote get-url "$UPSTREAM_REMOTE" &>/dev/null; then
  err "Remote '$UPSTREAM_REMOTE' not found. Add it first:"
  err "  git remote add $UPSTREAM_REMOTE https://github.com/Raymondhou0917/speak-human-tw.git"
  exit 1
fi

info "Fetching $UPSTREAM_REMOTE/$UPSTREAM_BRANCH ..."
git fetch "$UPSTREAM_REMOTE" "$UPSTREAM_BRANCH" --quiet
ok "Fetched $(git rev-list --count HEAD.."$UPSTREAM_REMOTE/$UPSTREAM_BRANCH") new commit(s)"

# ── Step 2: compare & copy ──────────────────────────────
UPDATED=0
UNCHANGED=0
FAILED=0

for mapping in "${FILES[@]}"; do
  SRC_PATH="${mapping%%:*}"
  DST_PATH="${mapping##*:}"
  DEST="$SKILL_DIR/$DST_PATH"

  # Get upstream content hash
  UPSTREAM_HASH=$(git show "$UPSTREAM_REMOTE/$UPSTREAM_BRANCH:$SRC_PATH" 2>/dev/null | md5sum | cut -d' ' -f1 || echo "")

  if [ -z "$UPSTREAM_HASH" ]; then
    warn "$SRC_PATH — not found upstream, skipping"
    continue
  fi

  # Get local content hash (if exists)
  LOCAL_HASH=""
  [ -f "$DEST" ] && LOCAL_HASH=$(md5sum "$DEST" | cut -d' ' -f1)

  if [ "$UPSTREAM_HASH" = "$LOCAL_HASH" ]; then
    ok "$SRC_PATH → $DST_PATH (unchanged)"
    UNCHANGED=$((UNCHANGED + 1))
    continue
  fi

  # Show diff preview
  echo ""
  warn "$SRC_PATH has changed:"
  if [ -f "$DEST" ]; then
    git diff --no-index --color=always "$DEST" <(git show "$UPSTREAM_REMOTE/$UPSTREAM_BRANCH:$SRC_PATH" 2>/dev/null) 2>/dev/null | head -40 || true
  else
    info "  (new file)"
  fi
  echo ""

  # Confirm
  read -r -p "  Overwrite $DST_PATH? [Y/n] " REPLY </dev/tty
  case "$REPLY" in
    [Nn]*)
      warn "Skipped $DST_PATH"
      continue
      ;;
    *)
      mkdir -p "$(dirname "$DEST")"
      git show "$UPSTREAM_REMOTE/$UPSTREAM_BRANCH:$SRC_PATH" > "$DEST"
      ok "$SRC_PATH → $DST_PATH (updated)"
      UPDATED=$((UPDATED + 1))
      ;;
  esac
done

# ── Summary ──────────────────────────────────────────────
echo ""
info "Done — ${GREEN}$UPDATED updated${NC}, $UNCHANGED unchanged"
git diff --stat -- "$SKILL_DIR/" 2>/dev/null | tail -1
