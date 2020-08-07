Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu1804"

  #
  #  Provider (virtualbox) settings
  #
  config.vm.provider :virtualbox do |v, override|
    v.gui = true
	  v.cpus = 2
    v.memory = 2048
	  v.name = "vagrant-ubuntu-desktop"
	  v.default_nic_type = "82543GC"
	  v.customize ['modifyvm', :id, '--clipboard-mode', 'bidirectional']
    override.vm.provision "virtualbox tools", type: "shell",
        path: "scripts/virtualbox_tools.sh"
  end

  #
  #  Provider (esxi) settings
  #
  config.vm.provider :vmware_esxi do |esxi, override|
    esxi.esxi_hostname = Secret.esxi_hostname
    esxi.esxi_username = Secret.esxi_username
    esxi.esxi_password = Secret.esxi_password
    esxi.esxi_virtual_network = ['VM Network']
    esxi.esxi_disk_store = 'datastore1'
    esxi.guest_name = 'vagrant-ubuntu-desktop'
    esxi.guest_memsize = '2048'
    esxi.guest_numvcpus = '2'
    esxi.guest_boot_disk_size = 30
    override.vm.provision "vmware tools", type: "shell",
        path: "scripts/vmware_tools.sh"
  end

  # Currently "ubuntu/bionic64" on VirtualBox requires `type: "virtualbox"`
  # to make synced folder works.
  config.vm.synced_folder '.', '/vagrant', type: 'virtualbox'

  config.vm.synced_folder '.', '/vagrant', type: 'nfs', disabled: true

  args = []
  config.vm.provision "apt-get update/upgrade script", type: "shell",
      path: "scripts/apt_update.sh",
      args: args

  args = []
  config.vm.provision "vscode install", type: "shell",
      path: "scripts/vscode.sh",
      args: args

  args = []
  config.vm.provision "gnome desktop install", type: "shell",
      path: "scripts/gnome.sh",
      args: args

  args = []
  config.vm.provision "chrome install", type: "shell",
      path: "scripts/chrome.sh",
      args: args

  args = []
  config.vm.provision "chromium install", type: "shell",
      path: "scripts/chromium.sh",
      args: args

  args = []
  config.vm.provision "firefox install", type: "shell",
      path: "scripts/firefox.sh",
      args: args

  args = []
  config.vm.provision "gitkraken install", type: "shell",
      path: "scripts/gitkraken.sh",
      args: args

  args = []
  config.vm.provision "dotfiles install", type: "shell",
      path: "scripts/dotfiles.sh",
      args: args

  args = []
  config.vm.provision "reboot", type: "shell",
      path: "scripts/reboot.sh",
      args: args
end
