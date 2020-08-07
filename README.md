# vagrant-ubuntu-desktop

A simple Vagrantfile to setup Ubuntu desktop environment with Google Chrome and a few other tools.

### Installs

-   Chrome
-   Chromium
-   Firefox
-   git
-   VS Code
-   gnome-shell-extensions
-   gnome-tweak-tool
-   gitkraken

### Usage

-   Requires VirtualBox
        vagrant up vagrant up --provider=virtualbox
        vagrant destroy -f

-   Requires <https://github.com/josenk/vagrant-vmware-esxi>
        vagrant up --provider=vmware_esxi
        vagrant destroy -f
