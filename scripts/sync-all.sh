#!/usr/bin/env bash
# Regenerate/sync all editor profiles from universal source
# Placeholder — profiles are hand-tuned for opencode

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "🔄 Sync placeholder — edit profiles/<editor>/ manually for best results."
echo ""
echo "Universal source: $REPO_ROOT/AGENTS.md + $REPO_ROOT/opencode.json"
echo ""
echo "Available profiles:"
ls -1 "$REPO_ROOT/profiles/"
echo ""
echo "SUPERAGENT v8.0 — hand-tuned for opencode (source of truth: .opencode/agent/superagent.md)"
