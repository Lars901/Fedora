#!/usr/bin/env bash
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
echo "installing Spotify"
sudo dnf install lpf-spotify-client -y
echo "Run lpf spotify-client from program menu"
echo "installing Steam"
sudo dnf install steam -y
echo "adding third party Github Desktop Repo GPG Key"
sudo rpm --import https://packagecloud.io/shiftkey/desktop/gpgkey
echo "adding Third party Github Desktop Repo"
sudo sh -c 'echo -e "[shiftkey]\nname=GitHub Desktop\nbaseurl=https://packagecloud.io/shiftkey/desktop/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/shiftkey/desktop/gpgkey" > /etc/yum.repos.d/shiftkey-desktop.repo'
sudo dnf upgrade -y
echo "installing Github Desktop Client"
sudo dnf install github-desktop -y
sudo dnf install google-noto-emoji-color-fonts -y
sudo mkdir ~/.config/fontconfig/conf.d/
sudo dnf install ibus-uniemoji -y
sudo cp /home/larsove/Fedora/01-emoji.conf ~/.config/fontconfig/conf.d/01-emoji.conf
 sudo dnf install python3-imaging -y
 sudo dnf install feh -y
cp /home/larsove/Fedora/Wallpapers/*.jpg /home/larsove/pictures/wallpapers
