#!/bin/bash

#
# Add Ansible repo
#
echo -e "\e[33m**********\e[39mBegin Ansible repo add\e[33m**********\e[39m"
sudo add-apt-repository --yes --update ppa:ansible/ansible
echo -e "\e[33m**********\e[39mEnd Ansible repo add\e[33m**********\e[39m"

#
# Install ansible
#
echo -e "\e[33m**********\e[39mBegin Ansible install\e[33m**********\e[39m"
sudo apt-get update -y
sudo apt-get install ansible -y
echo -e "\e[33m**********\e[39mEnd Ansible install\e[33m**********\e[39m"

#
# Install ansible collections
#
echo -e "\e[33m**********\e[39mBegin Ansible install collections\e[33m**********\e[39m"
sudo ansible-galaxy collection install community.windows community.vmware ansible.windows ansible.posix
echo -e "\e[33m**********\e[39mEnd Ansible install collections\e[33m**********\e[39m"
