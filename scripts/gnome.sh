#!/bin/bash

# Install GNOME desktop
echo -e "\e[33m**********\e[39mBegin GNOME install\e[33m**********\e[39m"
sudo apt-get install -y --no-install-recommends ubuntu-desktop
sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y gnome-shell-extensions
echo -e "\e[33m**********\e[39mEnd GNOME install\e[33m**********\e[39m"

# Set favorites
echo -e "\e[33m**********\e[39mBegin setting GNOME favorites\e[33m**********\e[39m"
sudo -Hu vagrant dbus-launch dconf write /org/gnome/shell/favorite-apps "['google-chrome.desktop', 'code.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop']"
echo -e "\e[33m**********\e[39mEnd setting GNOME favorites\e[33m**********\e[39m"

# GNOME tweaks
echo -e "\e[33m**********\e[39mBegin GNOME tweaks\e[33m**********\e[39m"
sudo -Hu vagrant dbus-launch gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
sudo -Hu vagrant dbus-launch gsettings set org.gnome.desktop.interface clock-format 12h
echo -e "\e[33m**********\e[39mEnd GNOME tweaks\e[33m**********\e[39m"

# Set resolution
echo -e "\e[33m**********\e[39mBegin setting resolution\e[33m**********\e[39m"
echo 'xrandr --size 1440x900' >> /home/vagrant/.profile
echo -e "\e[33m**********\e[39mEnd setting resolution\e[33m**********\e[39m"
