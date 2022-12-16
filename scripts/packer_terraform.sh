#!/bin/bash

#
# Add Hashicorp repo
#
echo -e "\e[33m**********\e[39mBegin Hashicorp repo add\e[33m**********\e[39m"
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
echo -e "\e[33m**********\e[39mEnd Hashicorp repo add\e[33m**********\e[39m"

#
# Install packer and terraform
#
echo -e "\e[33m**********\e[39mBegin packer and terraform install\e[33m**********\e[39m"
sudo apt-get update
sudo apt-get install terraform packer -y
echo -e "\e[33m**********\e[39mEnd packer and terraform install\e[33m**********\e[39m"
