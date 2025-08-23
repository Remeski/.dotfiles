#!/usr/bin/env bash
$HOME/.local/tmux-scripts/tmux-sessionizer.sh $(gum filter --indicator=">" --indicator.foreground='#7940ff' --match.foreground='#7940ff' --limit=1 --prompt='⚡ ' --placeholder="Quick switch (esc to fzf)" $(_ZO_ECHO=1 zoxide query -l | sed "s|$HOME/||")
