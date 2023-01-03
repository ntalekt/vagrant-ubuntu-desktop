#!/bin/bash

#
# install instapy's prereqs and then install instapy
#
echo -e "\e[33m**********\e[39mBegin instapy install\e[33m**********\e[39m"
# https://github.com/InstaPy/instapy-docs/blob/master/How_Tos/How_To_DO_Ubuntu_on_Digital_Ocean.md
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y unzip python3-pip python3-dev build-essential libssl-dev libffi-dev xvfb
sudo pip3 install --upgrade pip
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales
pip3 install --upgrade pip
# https://stackoverflow.com/questions/73108683/getting-error-cannot-import-name-unicode-emoji-from-emoji-unicode-codes
pip uninstall emoji
pip install emoji==1.7
# install firefox geckodriver
sudo apt install firefox-geckodriver
# install instapy
pip3 install instapy
echo -e "\e[33m**********\e[39mEnd instapy install\e[33m**********\e[39m"
