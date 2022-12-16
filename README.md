# vagrant-ubuntu-desktop

A simple Vagrantfile to setup Ubuntu desktop environment with Google Chrome and a few other tools on ESXi.

## Installs

* Chrome
* Firefox
* git
* VSCode
* gnome-shell-extensions
* gnome-tweak-tool
* ansible
  * community.windows
  * ansible.windows
  * ansible.posix
* HashiCorp
  * packer
  * terraform

## Requirements

1. You'll need vagrant installed: <https://vagrantup.com/downloads.html>
2. You'll need the vagrant-vmware-esxi plugin installed & configured: <https://github.com/josenk/vagrant-vmware-esxi>
3. Update the desktops network parameters: `config\01-netcfg.yaml`

## Usage

```bash
vagrant up --provider=vmware_esxi
vagrant destroy -f
```

## Default credentials

The default credentials for this VM are:

| Username | Password |
| -------- | -------- |
| `vagrant` | `vagrant`|
