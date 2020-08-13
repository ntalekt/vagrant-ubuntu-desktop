# vagrant-ubuntu-desktop

A simple Vagrantfile to setup Ubuntu desktop environment with Google Chrome and a few other tools.

### Installs

-   Chrome
-   Firefox
-   git
-   VS Code
-   gnome-shell-extensions
-   gnome-tweak-tool
-   Ops-Manager CLI - https://github.com/pivotal-cf/om
-   TKGI CLI - https://docs.pivotal.io/tkgi/1-8/installing-cli.html
-   kubectl-cli - https://docs.pivotal.io/tkgi/1-8/installing-kubectl-cli.html
-   bosh CLI - https://bosh.io/docs/cli-v2-install

### Usage
-   Requires - <https://github.com/josenk/vagrant-vmware-esxi>
```
vagrant up --provider=vmware_esxi
vagrant destroy -f
```
-   Requires VirtualBox
```
vagrant up --provider=virtualbox
vagrant destroy -f
```
