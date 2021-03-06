#!/bin/bash

#
# Installing TKGI & Kubernetes CLI
#
echo -e "\e[33m**********\e[39mBegin tkgi, bosh, om & kubectl CLI install\e[33m**********\e[39m"
if [ -d /vagrant/bin ]
then
    #
    # om CLI - https://github.com/pivotal-cf/om
    #
    OMVERSION=$(curl -s https://github.com/pivotal-cf/om/releases/latest/download 2>&1 | grep -Po [0-9]+\.[0-9]+\.[0-9]+)
    curl -s https://api.github.com/repos/pivotal-cf/om/releases/latest | grep browser_download_url | grep linux-$OMVERSION.tar.gz | cut -d '"' -f 4 | wget -qi -
    tar -xzf om-linux-$OMVERSION.tar.gz
    chmod +x om
    mv /home/vagrant/om /usr/local/bin/om
    rm -f om* CHANGELOG.md LICENSE README.md

    #
    # bosh CLI - https://bosh.io/docs/cli-v2-install/
    #
    BOSHVERSION=$(curl -s https://github.com/cloudfoundry/bosh-cli/releases/latest/download 2>&1 | grep -Po [0-9]+\.[0-9]+\.[0-9]+)
    curl -s https://api.github.com/repos/cloudfoundry/bosh-cli/releases/latest | grep browser_download_url | grep linux | cut -d '"' -f 4 | wget -qi -
    chmod +x bosh-cli-${BOSHVERSION}-linux-amd64
    mv /home/vagrant/bosh-cli-${BOSHVERSION}-linux-amd64 /usr/local/bin/bosh

    #
    # tkgi CLI - https://docs.pivotal.io/tkgi/1-8/installing-cli.html
    #
    TKGIFILE=$(ls /vagrant/bin/ | grep tkgi)
    chmod +x /vagrant/bin/${TKGIFILE}
    mv /vagrant/bin/${TKGIFILE} /usr/local/bin/tkgi

    #
    # kubectl CLI - https://docs.pivotal.io/tkgi/1-8/installing-kubectl-cli.html
    #
    KUBECTLFILE=$(ls /vagrant/bin/ | grep kube)
    chmod +x /vagrant/bin/${KUBECTLFILE}
    mv /vagrant/bin/${KUBECTLFILE} /usr/local/bin/kubectl

    #
    # kubectl autocompletion
    #
    echo -e "\e[33m**********\e[39mBegin kubectl autocompletion\e[33m**********\e[39m"
    echo 'source <(kubectl completion bash)' >> /home/vagrant/.dotfiles/.bashrc
    kubectl completion bash >/etc/bash_completion.d/kubectl
    echo -e "\e[33m**********\e[39mEnd kubectl autocompletion\e[33m**********\e[39m"

    #
    # Change perms on key
    #
    chmod 600 /vagrant/id_rsa

else
    echo "Cannot find binaries"
fi
echo -e "\e[33m**********\e[39mEnd tkgi, bosh, om & kubectl CLI install\e[33m**********\e[39m"
