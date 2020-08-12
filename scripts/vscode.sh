#!/bin/bash

#
# Add microsoft repo
#
echo -e "\e[33m**********\e[39mBegin Microsoft repo add\e[33m**********\e[39m"
sudo curl --progress-bar https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main > /etc/apt/sources.list.d/vscode.list'
echo -e "\e[33m**********\e[39mEnd Microsoft repo add\e[33m**********\e[39m"

#
# Install code
#
echo -e "\e[33m**********\e[39mBegin VScode install\e[33m**********\e[39m"
sudo apt-get update -y
sudo apt-get install -y code
echo -e "\e[33m**********\e[39mEnd VScode install\e[33m**********\e[39m"
