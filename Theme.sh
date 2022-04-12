#!/usr/bin/env bash

# Download Nordic Theme
cd /usr/share/plasma/desktoptheme/
git clone https://github.com/EliverLara/Nordic.git

# Fira Code Nerd Font variant needed
cd /home
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d ~/.fonts   
fc-cache -vf

#Ms-fonts
sudo dnf install curl cabextract xorg-x11-font-utils fontconfig -y
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

# Layan Cursors
cd /home
git clone https://github.com/vinceliuice/Layan-cursors
cd Layan-cursors
sudo ./install.sh