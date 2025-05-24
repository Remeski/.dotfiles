#!/usr/bin/env bash
#
# Polite yoink from ThePrimeagen .dotfiles :)

if [[ $# -eq 1 ]]; then
        selected=$1
else
	output=$(find /mnt/storage ~/ ~/coding/ ~/coding/etremes -mindepth 1 -maxdepth 5 -type d | fzf --reverse --print-query)
	IFS=$'\n' read -r -d '' -a lines <<< "$output"  # Split output into lines

	query=${lines[0]}  # Access the first line
	selected=${lines[1]}  # Access the second line
fi

if [[ "${query:0:1}" == ">" ]]; then
    selected=${selected:1}
    selected_name=$selected
fi

if [[ -z $selected ]]; then
    exit 0
fi

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
