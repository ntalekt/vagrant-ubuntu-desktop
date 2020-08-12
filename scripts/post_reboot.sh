#!/bin/bash

#
# Change nameserver (cheating way)
#
echo -e "\e[33m**********\e[39mBegin modding resolv.conf\e[33m**********\e[39m"
sudo sed -i_bak 's/nameserver.*/nameserver 192.168.1.2/' /etc/resolv.conf
echo -e "\e[33m**********\e[39mEnd modding resolv.conf\e[33m**********\e[39m"
