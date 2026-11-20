#!/usr/bin/env bash
# SUPERAGENT v8.0 Agent Profile Installer
# Usage:
#   bash scripts/install.sh               # install project-level (current dir)
#   bash scripts/install.sh project       # same as above
#   bash scripts/install.sh global        # install ke ~/.config/opencode
#   bash scripts/install.sh project /path # install ke project tertentu

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

MODE="${1:-project}"
TARGET_DIR="${2:-}"

backup_file() {
  if [[ -f "$1" ]]; then
    cp "$1" "$1.bak"
    echo "   ⚠️  Existing file dibackup → $1.bak"
  fi
}

case "$MODE" in
  project)
    TARGET_DIR="${TARGET_DIR:-$PWD}"
    AGENTS_DST="$TARGET_DIR/AGENTS.md"
    AGENT_DST_DIR="$TARGET_DIR/.opencode/agent"
    ;;
  global)
    TARGET_DIR="${TARGET_DIR:-$HOME/.config/opencode}"
    AGENTS_DST="$TARGET_DIR/AGENTS.md"
    AGENT_DST_DIR="$TARGET_DIR/agent"
    ;;
  *)
    echo "Usage: bash scripts/install.sh [project|global] [target-dir]"
    echo ""
    echo "  project  → AGENTS.md + .opencode/agent/*.md di folder project (default)"
    echo "  global   → AGENTS.md + agent/*.md di ~/.config/opencode"
    exit 1
    ;;
esac

echo "🛡️⚡ SUPERAGENT v8.0 Profile Installer"
echo "Mode:   $MODE"
echo "Target: $TARGET_DIR"
echo ""

mkdir -p "$AGENT_DST_DIR"

backup_file "$AGENTS_DST"
install -m 644 "$REPO_ROOT/AGENTS.md" "$AGENTS_DST"
echo "   ✅ AGENTS.md"

for src in "$REPO_ROOT"/agent/*.md; do
  name="$(basename "$src")"
  backup_file "$AGENT_DST_DIR/$name"
  install -m 644 "$src" "$AGENT_DST_DIR/$name"
  echo "   ✅ agent/$name"
done

echo ""
echo "🎉 Done!"
echo ""
echo "Next steps:"
echo "  1. Restart opencode (quit → opencode)"
echo "  2. Tekan Tab untuk switch agent: superagent / researcher"
echo "  3. Test: \"who are you\" → SUPERAGENT v8.0 / BREACH v4.0"
echo ""
echo "🛡️ Ship exploits, not excuses. ⚡"
