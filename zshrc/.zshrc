
export XDG_CONFIG_HOME=$HOME/.config

export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

export PATH=$PATH:/usr/local/go/bin:/home/eeli/.local/bin:/home/eeli/.local/share/gem/ruby/3.0.0/bin

# Uncomment if node is installed (tbh I don't is this required... this some random shit I found and without all hell breaks loose)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="robbyrussell"

# eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/poshthemes/space.omp.json)"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions vi-mode)

source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

bindkey -r '^P'
bindkey -r '^N'

alias vim=nvim
alias arduino="cd /mnt/c/Users/eelir/Documents/Arduino/"
alias acli=arduino-cli

# If you want tmux to automatically open
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
# exec tmux
# fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Created by `pipx` on 2024-04-17 09:09:52
export PATH="$PATH:/home/eeli/.local/bin"
