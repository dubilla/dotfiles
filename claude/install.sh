#!/bin/sh
#
# claude topic installer — symlink Claude Code config that lives here into
# ~/.claude. Run automatically by `script/install`. Idempotent.

set -e

mkdir -p "$HOME/.claude"
ln -sf "$HOME/.dotfiles/claude/statusline-command.sh" "$HOME/.claude/statusline-command.sh"
echo "  claude: linked ~/.claude/statusline-command.sh"
