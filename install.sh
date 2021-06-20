#!/bin/sh

## set .vimrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc

## install zinit
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
source ~/.zshrc
zinit self-update
cat ./zshrc_add >> ~/.zshrc


