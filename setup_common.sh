#!/bin/sh

# install requirements
osname=$(cat /etc/issue)
requirements="./requirements_common.txt"
if [[ $osname =~ "Debian" ]] ;
then
  apt update && apt install "$requirements"
elif [[ $osname =~ "Arch Linux" ]] ; 
then
  pacman -Syy &&\
  	pacman -S --noconfirm --needed $(comm -12 <(pacman -Slq | sort) <(sort $requirements)) 
fi

## user config
username="nirarin"
shell="/bin/zsh"
password="nirarin"

useradd -m -G wheel -s "$shell" "$username" &&\
	echo "$username:$password" | chpasswd
echo "${username} ALL=(ALL) ALL" >> /etc/sudoers

## change user
su "$username" << EOF

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

### install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

EOF