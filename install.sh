#!/bin/sh

# install requirements
osname=$(cat /etc/issue)
requirements="git expect"
if [[ $osname =~ "Debian" ]] ;
then
  apt update && apt install "$requirements"
elif [[ $osname =~ "Arch Linux" ]] ; 
then
  pacman -Syy && pacman -S "$requirements" --noconfirm
fi

## install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein

## set .vimrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc

## install zinit
: > ~/.zshrc && \
	wget https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh -O ./install_zinit.sh && \
	./zinit.exp && \
	cat ./zshrc_add >> ~/.zshrc && \
	rm ./install_zinit.sh
