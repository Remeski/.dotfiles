if [[ -a "$PWD/.readyup" ]]; then
    source "$PWD/.readyup"
fi

if [[ ! -a "$PWD/.readyup" ]]; then
    tmux neww -dc $PWD 
    nvim .
fi
