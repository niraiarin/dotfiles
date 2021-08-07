#!/bin/sh

# install requirements
osname=$(cat /etc/issue)
requirements="./requirements_common.txt"
requirements_arch="./requirements_archlinux.txt"
if [[ $osname =~ "Debian" ]] ;
then
  apt update && apt install "$requirements"
elif [[ $osname =~ "Arch Linux" ]] ; 
then
  pacman -Syu --noconfirm &&\
  	pacman -S --noconfirm --needed $(comm -12 <(pacman -Slq | sort) <(sort $requirements)) &&\
  	pacman -S --noconfirm --needed $(comm -12 <(pacman -Slq | sort) <(sort $requirements_arch))
fi

## user config
username=$ADDUSERNAME
shell=$ADDUSERSHELL
password=$ADDUSERPASS

echo "username:${username}"
echo "shell:${shell}"

useradd -m -G wheel -s "$shell" "$username" &&\
	echo "$username:$password" | chpasswd
echo "${username} ALL=(ALL) ALL" >> /etc/sudoers

## change user
su "${username}" << EOF
sh ./setup_user.sh
EOF