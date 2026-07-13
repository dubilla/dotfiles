#!/bin/sh
#
# agents topic installer — recreate the symlinks that expose the shared
# doctrine + sync tool to each host. Run automatically by `script/install`
# and `bin/dot`. Idempotent.

set -e

mkdir -p "$HOME/.codex" "$HOME/.local/bin"
ln -sf "$HOME/.dotfiles/agents/AGENTS.md" "$HOME/.codex/AGENTS.md"
ln -sf "$HOME/.dotfiles/bin/agents-sync"  "$HOME/.local/bin/agents-sync"
echo "  agents: linked ~/.codex/AGENTS.md + ~/.local/bin/agents-sync"
