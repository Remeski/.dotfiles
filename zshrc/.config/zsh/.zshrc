# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugin manager stuff
PLUGINS_FOLDER=$ZDOTDIR/plugins
if [ ! -d $PLUGINS_FOLDER ]; then
	mkdir $PLUGINS_FOLDER
fi
if [ ! -d $PLUGINS_FOLDER/antidote ]; then
	git clone --depth=1 https://github.com/mattmc3/antidote.git $PLUGINS_FOLDER/antidote
fi
source $PLUGINS_FOLDER/antidote/antidote.zsh
antidote load $ZDOTDIR/.zsh_plugins.txt

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Binds
bindkey -v # vi mode
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# zsh-completions
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "$LS_COLORS"

# fzf integration
eval "$(fzf --zsh)"

# Aliases
alias vim=nvim
alias arduino="cd /mnt/c/Users/eelir/Documents/Arduino/"
alias acli=arduino-cli
alias ls="ls --color"

# Load local aliases and env files
[[ -f ~/.local-aliases.zsh ]] && source ~/.local-aliases.zsh
[[ -f ~/.local-env.zsh ]] && source ~/.local-env.zsh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
