#!/usr/bin/env bash
username=$(id -u -n 1000)
builddir=$(pwd)

sudo dnf install terminus-fonts -y
sudo dnf install github -y
echo "adding Brave Repo"
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
echo "adding Brave Repo keyring"
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf upgrade -y
echo "installing Brave Browser"
sudo dnf install brave-browser -y
echo "adding VSCodium GPG Key"
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
echo "adding VSCodium Repo"
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
echo "Enabling NON-FREE RPM Fusion Repo"
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
echo "Enabling FREE RPM Fusion Repo"
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf upgrade -y
echo "installing Steam"
sudo dnf install steam -y
sudo dnf upgrade -y
sudo dnf install google-noto-emoji-color-fonts -y
sudo mkdir ~/.config/fontconfig/
sudo mkdir ~/.config/fontconfig/conf.d/
sudo dnf install ibus-uniemoji -y
sudo cp /$HOME/$USER/Fedora/01-emoji.conf ~/.config/fontconfig/conf.d/01-emoji.conf
 sudo dnf install python3-imaging -y
 sudo dnf install feh -y
 mkdir /$HOME/$USER/Pictures/wallpapers
cd /Wallpapers
cp *.jpg /$HOME/$USER/Pictures/Wallpapers
sudo dnf install neofetch -y
sudo dnf install @virtualization -y
sudo dnf install virt-manager libvirt libvirt-python python-virtinst libvirt-client -y
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
lsmod | grep kvm
 sudo dnf install kde-print-manager.x86_64 -y
 sudo dnf install samba samba-common samba-client -y
 sudo systemctl start smbd nmbd
 sudo systemctl enable smbd nmbd
systemctl status smbd
sudo dnf install htop -y
echo "# Install fedy copr repository"
sudo dnf copr enable kwizart/fedy 
echo "Insalling Fedy" 
sudo dnf install fedy -y 
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Installing fonts
cd "$builddir" || exit
sudo nala install fonts-font-awesome -y
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d "/home/$username/.fonts"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d "/home/$username/.fonts"
mv dotfonts/fontawesome/otfs/*.otf "/home/$username/.fonts/"
chown "$username:$username" "/home/$username/.fonts/*"

# Install Nordzy cursor
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors || exit
chmod +x ./install.sh
./install.sh
cd "$builddir" || exit
rm -rf Nordzy-cursors

# Install  Layan Cursors
git clone https://github.com/vinceliuice/Layan-cursors
cd Layan-cursors || exit
chmod +x ./install.sh
./install.sh
cd "$builddir" || exit
rm -Layan-cursors 

# Reloading Font cache
fc-cache -vf
# Removing zip Files
rm ./FiraCode.zip ./Meslo.zip

#___________________________________#
#Flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#Spotify
flatpak install -y flathub com.spotify.Client
#Dolphin Emu
flatpak install -y flathub org.DolphinEmu.dolphin-emu
cd "/home/$username"
#wget https://downloads.romspedia.com/roms/Legend%20of%20Zelda%2C%20The%20-%20The%20Wind%20Waker%20%28USA%29.7z

#RPCS3 Emu
flatpak install -y flathub net.rpcs3.RPCS3
cd "$builddir" || exit
wget http://dus01.ps3.update.playstation.net/update/ps3/image/us/2023_0228_05fe32f5dc8c78acbcd84d36ee7fdc5b/PS3UPDAT.PUP

#Discord
flatpak install -y flathub com.discordapp.Discord

#Wallpaper downloader
flatpak install -y flathub es.estoes.wallpaperDownloader

#Bible applications
flatpak install -y flathub org.xiphos.Xiphos

#Github Desktop 
flatpak install -y flathub io.github.shiftey.Desktop
#_______________________________________________________________________#
