#!/bin/sh
echo Starting the setup...

# Update soruces
echo
echo --- Updating sources ---
echo
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

# Update system
echo
echo --- Updating system ---
echo
sudo apt-get update
sudo apt-get upgrade

# Monitoring tools
echo
echo --- Installing monitoring tools ---
echo
sudo apt-get -y install gnome-system-monitor
sudo apt-get -y install gparted

# Visual Studo Code
echo
echo --- Installing Visual Studio Code ---
echo
sudo apt-get -y install code

# GitKraken
echo
echo --- Installing GitKraken ---
echo
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo apt-get -y install gconf2
sudo dpkg -i gitkraken-amd64.deb
rm gitkraken-amd64.deb

# Chrome 
echo
echo --- Installing Chrome ---
echo
sudo apt-get -y install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
rm google-chrome-stable_current_amd64.deb

# Node
echo
echo --- Installing Node ---
echo
sudo apt-get -y install npm
sudo npm install -g n
sudo n lts

# Python
echo
echo --- Installing Python ---
echo
sudo apt-get -y install python-pip
pip install --upgrade pip

# Docker
echo
echo --- Installing Docker ---
echo
sudo pip install docker

# Docker Compose
echo
echo --- Installing Docker-Compose ---
echo
sudo pip install docker-compose

sudo usermod -a -G docker $USER

# Programs used only for bare metal installs
for i in "$@" ; do
    if [ $i = "--bare" ] ; then
        
        # Dropbox
        echo
        echo --- Installing Dropbox ---
        echo
        sudo apt-get -y install nautilus-dropbox

        # Spotify
        echo
        echo --- Installing Spotify ---
        echo
        # 1. Add the Spotify repository signing keys to be able to verify downloaded packages
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
        # 2. Add the Spotify repository
        echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
        # 3. Update list of available packages
        sudo apt-get update
        # 4. Install Spotify
        sudo apt-get -y install spotify-client

        # Libreoffice
        echo
        echo --- Installing LibreOffice ---
        echo
        sudo add-apt-repository ppa:libreoffice/ppa
        sudo apt-get update
        sudo apt-get -y install libreoffice

        # Gimp
        echo
        echo --- Installing Gimp ---
        echo
        sudo apt-get -y install gimp
        break
    fi
done