#!/bin/bash

#
# Download and install the latest stable chrome browser
#
echo -e "\e[33m**********\e[39mBegin Chrome install\e[33m**********\e[39m"
wget --progress=bar:force https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt-get install -y fonts-liberation xdg-utils
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
echo -e "\e[33m**********\e[39mEnd Chrome install\e[33m**********\e[39m"
