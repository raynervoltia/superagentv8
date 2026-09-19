#!/usr/bin/env bash
# SUPERAGENT v8.0 Agent Profile Installer
# Usage: bash scripts/install.sh opencode [target-dir]
# Editors: opencode, all (aliases: superagent)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PROFILES_DIR="$REPO_ROOT/profiles"

EDITOR="${1:-}"
TARGET_DIR="${2:-$PWD}"

if [[ -z "$EDITOR" ]]; then
  echo "Usage: bash scripts/install.sh <editor> [target-dir]"
  echo ""
  echo "Editors:"
  echo "  opencode      → AGENTS.md + opencode.json + .opencode/agent/superagent.md + .opencode/agent/researcher.md"
  echo "  superagent    → alias for opencode"
  echo "  all           → install every profile (currently only opencode)"
  echo ""
  echo "Examples:"
  echo "  bash scripts/install.sh opencode              # install to current project"
  echo "  bash scripts/install.sh opencode ~/.config/opencode  # install global"
  exit 1
fi

# normalize alias
if [[ "$EDITOR" == "superagent" ]]; then
  EDITOR="opencode"
fi

echo "🛡️⚡ SUPERAGENT v8.0 Profile Installer"
echo "Target: $TARGET_DIR"
echo "Editor: $EDITOR"
echo ""

install_profile() {
  local editor="$1"
  local src="$PROFILES_DIR/$editor"

  if [[ ! -d "$src" ]]; then
    echo "❌ Profile not found: $editor"
    return 1
  fi

  echo "📦 Installing: $editor"

  mkdir -p "$TARGET_DIR"

  # Backup existing opencode.json if exists
  if [[ -f "$TARGET_DIR/opencode.json" ]]; then
    echo "   ⚠️  Backing up existing opencode.json → opencode.json.bak"
    cp "$TARGET_DIR/opencode.json" "$TARGET_DIR/opencode.json.bak"
  fi
  if [[ -f "$TARGET_DIR/opencode.jsonc" ]]; then
    echo "   ⚠️  Backing up existing opencode.jsonc → opencode.jsonc.bak"
    cp "$TARGET_DIR/opencode.jsonc" "$TARGET_DIR/opencode.jsonc.bak"
  fi

  # Copy all files preserving structure
  if command -v rsync >/dev/null 2>&1; then
    rsync -a --exclude='.git' "$src/" "$TARGET_DIR/"
  else
    cp -R "$src/." "$TARGET_DIR/"
  fi

  # Also ensure root-level files are copied if src is opencode and target is different from repo root
  # For opencode, we want AGENTS.md at target root
  echo "   ✅ Done: $editor"
  echo "   → Files installed:"
  find "$src" -type f | sed "s|$src|   • |" | head -n 20
}

case "$EDITOR" in
  all)
    for e in opencode; do
      install_profile "$e"
    done
    ;;
  opencode)
    install_profile "$EDITOR"
    ;;
  *)
    echo "❌ Unknown editor: $EDITOR"
    echo "Run 'bash scripts/install.sh' with no args to see available options."
    exit 1
    ;;
esac

echo ""
echo "🎉 SUPERAGENT v8.0 profile installed to $TARGET_DIR!"
echo ""
case "$EDITOR" in
  opencode|all)
    echo "Next steps:"
    echo "  1. Set API keys:"
    echo "     export GLOO_API_KEY=\"sk_...\""
    echo "     export DEEPSEEK_API_KEY=\"sk-...\""
    echo "     # atau edit opencode.json: provider.*.options.apiKey"
    echo "  2. Restart opencode:"
    echo "     opencode"
    echo "  3. Pilih agent: superagent (Tab untuk switch)"
    echo "  4. Test: \"who are you\" → harus jawab SUPERAGENT v8.0"
    echo ""
    echo "Docs: docs/opencode.md"
    echo "Profile: .opencode/agent/superagent.md"
    ;;
esac

echo ""
echo "🛡️ Ship exploits, not excuses. ⚡"
