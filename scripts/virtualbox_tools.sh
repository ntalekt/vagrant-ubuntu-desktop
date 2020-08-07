#!/bin/bash

# Install guest tools for Virtualbox provider
echo -e "\e[33m**********\e[39mBegin VirtualBox tools\e[33m**********\e[39m"
sudo apt-get install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
echo -e "\e[33m**********\e[39mEnd VirtualBox tools\e[33m**********\e[39m"
