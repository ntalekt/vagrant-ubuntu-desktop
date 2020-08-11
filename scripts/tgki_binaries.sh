#!/bin/bash

# Installing TKGI & Kubernetes CLI
# https://docs.pivotal.io/tkgi/1-8/installing-cli.html
# https://docs.pivotal.io/tkgi/1-8/installing-kubectl-cli.html
echo -e "\e[33m**********\e[39mBegin TKGI & kubectl CLI install\e[33m**********\e[39m"
if [ -d /vagrant/bin ]
then
    # om CLI
    OMVERSION=$(curl -s https://github.com/pivotal-cf/om/releases/latest/download 2>&1 | grep -Po [0-9]+\.[0-9]+\.[0-9]+)
    curl -s https://api.github.com/repos/pivotal-cf/om/releases/latest | grep browser_download_url | grep linux-$OMVERSION.tar.gz | cut -d '"' -f 4 | wget -qi -
    tar -xzf om-linux-$OMVERSION.tar.gz
    chmod +x om
    mv /home/vagrant/om /usr/local/bin/om
    # tkgi CLI
    chmod +x /vagrant/bin/tkgi-linux-amd64-1.8.0-build.75
    mv /vagrant/bin/tkgi-linux-amd64-1.8.0-build.75 /usr/local/bin/tkgi
    # kubectl CLI
    chmod +x /vagrant/bin/kubectl-linux-amd64-1.17.8
    mv /vagrant/bin/kubectl-linux-amd64-1.17.8 /usr/local/bin/kubectl
else
    echo "Cannot find binaries"
fi
echo -e "\e[33m**********\e[39mEnd TKGI & kubectl CLI install\e[33m**********\e[39m"