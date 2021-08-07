#!/bin/sh

## install dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
rm installer.sh

## set .vimrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc

## install zinit
: > ~/.zshrc && \
	wget https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh -O ./install_zinit.sh && \
	./zinit.exp && \
	cat ./zshrc_add >> ~/.zshrc && \
	rm ./install_zinit.sh