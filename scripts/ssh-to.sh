#!/bin/bash

if [[ ! -f $HOME/.local/scripts/servers.conf ]]; then
    echo "Supply a servers.conf file in $HOME/.local/scripts/"
    exit 1
fi

DEFAULT_USER=etremes

SELECTED=$(cat $HOME/.local/scripts/servers.conf | awk '{ print $1 }' | fzf)
LOCATION=$(cat $HOME/.local/scripts/servers.conf | grep $SELECTED | awk '{print $2}')

if [[ -z $LOCATION ]] || [[ -z $SELECTED ]]; then
    exit 0
fi

if [[ ! $LOCATION =~ "@" ]]; then
    LOCATION=$DEFAULT_USER@$LOCATION
fi

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $SELECTED ssh $LOCATION
    exit 0
fi

 if ! tmux has-session -t=$SELECTED 2> /dev/null; then
    tmux new-session -ds $SELECTED ssh $LOCATION
 fi

tmux switch-client -t $SELECTED
