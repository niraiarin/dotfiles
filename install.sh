#!/bin/sh

## set .vimrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc

## install zinit
wget https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh -O ./install_zinit.sh && \
	./zinit.exp && \
	cat ./zshrc_add >> ~/.zshrc && \
	rm ./install_zinit.sh
