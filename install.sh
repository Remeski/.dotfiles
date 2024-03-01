#!/bin/bash

echo "Installing tmux.conf and .zshrc..."
if [ -f $HOME/.zshrc ]; then
	echo ".zshrc exists, remove it first (or backup), continue? (enter)"
	read
else
	ln -s $PWD/.zshrc $HOME/.zshrc
fi
if [ -f $HOME/.tmux.conf ]; then
	echo ".tmux.conf exists, remove it first (or backup), continue? (enter)"
	read
else
	ln -s $PWD/tmux.conf $HOME/.tmux.conf
fi

echo "Installing .config files..."
if [ ! -d $HOME/.config ]; then
	mkdir $HOME/.config
fi
echo "Creating symlinks..."
ln -s $PWD/.config/nvim $HOME/.config/nvim
ln -s $PWD/.config/poshthemes $HOME/.config/poshthemes
echo "Done!"
