Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

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
