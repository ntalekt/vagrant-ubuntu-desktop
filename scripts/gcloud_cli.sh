#!/bin/bash

#
# apt-transport-https install
#
echo -e "\e[33m**********\e[39mBegin apt-transport-https install\e[33m**********\e[39m"
sudo apt-get install apt-transport-https ca-certificates gnupg -y
echo -e "\e[33m**********\e[39mEnd apt-transport-https install\e[33m**********\e[39m"

#
# Install code
#
echo -e "\e[33m**********\e[39mBegin gcloud CLI installation\e[33m**********\e[39m"
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-cli -y
echo -e "\e[33m**********\e[39mEnd gcloud CLI installation\e[33m**********\e[39m"
