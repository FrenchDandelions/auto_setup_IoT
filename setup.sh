#!/bin/sh


# Become root and give your user sudoers rights
# su
# sudo adduser $USER sudo
# exit


# install basic stuff
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y curl wget vim zsh


# Installing virtual box
sudo wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O /usr/share/keyrings/oracle.asc
sudo gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys A2F683C52980AECF
sudo gpg --armor --export A2F683C52980AECF | sudo tee /usr/share/keyrings/oracle.asc
echo 'deb [signed-by=/usr/share/keyrings/oracle.asc] http://download.virtualbox.org/virtualbox/debian bookworm contrib' | sudo tee -a /etc/apt/sources.list.d/virtualbox.list > /dev/null
sudo apt-get update -y && sudo apt-get install -y virtualbox-7.1


# Installing vagrant
sudo wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
sudo echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update -y && sudo apt-get install -y vagrant


# Installing vscode (not necessary and NOT TESTED BE CAREFUL)
# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
# sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# sudo apt-get update -y
# sudo apt-get install -y code


# Installing oh-my-zsh (not necessary)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh) $USER
