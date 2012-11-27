#!/bin/bash

DOTFILES="$HOME/.dotfiles"
CURRENT_DIR=`pwd`

if [ -d "$DOTFILES" ]; then
	echo "Updating $DOTFILES"
	cd "$DOTFILES"
	git pull
else
	echo "Creating $DOTFILES"
	git clone . "$DOTFILES"
fi

cd "$DOTFILES"

for dotfile in `ls -A $DOTFILES/ | grep -v .git | grep -v README* | grep -v .DS_Store`; do
	echo "$dotfile"
	ln -sf "$DOTFILES/$dotfile" "$HOME/.$dotfile"
done
unset dotfile

source "$HOME/.bash_profile"

cd "$CURRENT_DIR"
