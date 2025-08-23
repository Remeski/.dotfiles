#!/usr/bin/env bash
#
# Polite yoink from ThePrimeagen .dotfiles :)

if [[ $# -eq 1 ]]; then
        selected=$1
else
	zoxide query -l >> /tmp/search
	find ~/ ~/coding/ ~/projects ~/random ~/hacking -mindepth 1 -maxdepth 3 -type d >> /tmp/search
	selected=$(cat /tmp/search | sed "s|^$HOME/||" | fzf --reverse)
	rm /tmp/search
fi

if [[ -z $selected ]]; then
    exit 0
fi

if [[ ${selected:0:1} != "/" ]]; then
	selected=$HOME/$selected
fi

echo $selected
selected_name=$(basename $selected | tr . _)

tmux_running=$(pgrep tmux)

zoxide add $selected

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
		tmux new-session -s $selected_name -c $selected
		tmux send-keys -t $selected_name "source $HOME/.local/tmux-scripts/ready-up.sh" Enter
		exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
		tmux new-session -ds $selected_name -c $selected
		tmux send-keys -t $selected_name "source $HOME/.local/tmux-scripts/ready-up.sh" Enter
fi

tmux switch-client -t $selected_name
fi
