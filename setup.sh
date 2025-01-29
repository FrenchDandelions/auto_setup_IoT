#!/bin/sh

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y curl wget


# installing virtual box
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O /usr/share/keyrings/oracle.asc
gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys A2F683C52980AECF
gpg --armor --export A2F683C52980AECF | sudo tee /usr/share/keyrings/oracle.asc
sudo echo 'deb [signed-by=/usr/share/keyrings/oracle.asc] http://download.virtualbox.org/virtualbox/debian bookworm contrib' >> /etc/apt/sources.list.d/virtualbox.list
sudo apt-get update && sudo apt-get install virtualbox-7.1


# Installing vagrant
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant

# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
# sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/keyrings/microsoft-archive-keyring.gpg
# sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# sudo apt-get update
# sudo apt-get install code
