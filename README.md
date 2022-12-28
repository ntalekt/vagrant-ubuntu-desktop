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
* GCP CLI

## Requirements

1. vagrant installed: <https://vagrantup.com/downloads.html>
   * vagrant versions 2.2.x+
2. vagrant plugins installed and configured
   * vagrant-vmware-esxi: <https://github.com/josenk/vagrant-vmware-esxi>
   * vagrant-secret <https://github.com/tcnksm/vagrant-secret>
3. ovftool installed: <https://developer.vmware.com/web/tool/4.4.0/ovf>

    ```bash
    sudo ./VMware-ovftool-4.4.3-18663434-lin.x86_64.bundle --eulas-agreed
    ```

    ```bash
    $ ovftool --version
    VMware ovftool 4.4.3 (build-18663434)
    ```

4. network parameters example: `config\01-netcfg.yaml.example`

    ```bash
    mv 01-netcfg.yaml.example 01-netcfg.yaml
    ```

5. an ESXi server

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
