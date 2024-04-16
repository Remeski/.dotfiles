#!/bin/bash

# TODO: make this more modular
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
	ln -s $PWD/.tmux.conf $HOME/.tmux.conf
fi

echo "Installing .config files..."
if [ ! -d $HOME/.config ]; then
	mkdir $HOME/.config
fi
if [ ! -d $HOME/.config/nvim ]; then
	ln -s $PWD/.config/nvim $HOME/.config/nvim
fi

echo "Installing custom scripts..."
if [ ! -d $HOME/.local/scripts ]; then
	mkdir $HOME/.local/scripts
fi

for script in $(ls $PWD/scripts | grep .sh); do
	ln -s $PWD/scripts/$script $HOME/.local/scripts/$script
done

echo "Alls good"
