#!/bin/bash

conf_path=$HOME/.local/scripts/servers.conf

DEFAULT_USER=etremes

get_location () {
    SELECTED=$1
    LOCATION=$(cat $conf_path | grep $SELECTED | awk '{print $2}')
    if [[ ! $LOCATION =~ "@" ]]; then
	LOCATION=$DEFAULT_USER@$LOCATION
    fi
    echo $LOCATION
}

get_session_ssh () {
    SESSION=$(tmux display-message -p '#S')
    if [[ $SESSION =~ "SSH>" ]]; then
	echo ${SESSION#SSH\>}
    fi
    echo ""
}


if [[ ! -z "$1" ]]; then
    SSH=$(get_session_ssh)
    if [[ -z $SSH ]]; then
	tmux $1 -c "#{pane_current_path}"
	exit 0
    fi
    LOCATION=$(get_location $SSH)
    tmux $1 "ssh $LOCATION"

else

    if [[ ! -f $conf_path ]]; then
	echo "Supply a servers.conf file in $HOME/.local/scripts/"
	exit 1
    fi

    SELECTED=$(cat $conf_path | awk '{ print $1 }' | fzf)
    LOCATION=$(get_location $SELECTED)

    if [[ -z $LOCATION ]] || [[ -z $SELECTED ]]; then
    exit 0
    fi

    if [[ ! $LOCATION =~ "@" ]]; then
	LOCATION=$DEFAULT_USER@$LOCATION
    fi

    tmux_running=$(pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s SSH\>$SELECTED ssh $LOCATION
    exit 0
    fi

    if ! tmux has-session -t=SSH\>$SELECTED 2> /dev/null; then
    tmux new-session -ds SSH\>$SELECTED ssh $LOCATION
    fi

    tmux switch-client -t SSH\>$SELECTED
fi
