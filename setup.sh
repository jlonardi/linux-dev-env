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

