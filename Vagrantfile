Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider :virtualbox do |v|
    v.gui = true
	  v.cpus = 2
    v.memory = 2048
	  v.name = "vagrant-ubuntu-desktop"
	  v.default_nic_type = "82543GC"
	  v.customize ['modifyvm', :id, '--clipboard-mode', 'bidirectional']
  end

  # Currently "ubuntu/bionic64" on VirtualBox requires `type: "virtualbox"`
  # to make synced folder works.
  config.vm.synced_folder ".", "/vagrant", type: "virtualbox"

  $script = <<-SHELL
  echo "\e[33m**********\e[37mSTUFF TO REMOVE dpkg-preconfigure WARNINGS\e[33m**********\e[0m"
  sudo ex +"%s@DPkg@//DPkg" -cwq /etc/apt/apt.conf.d/70debconf
  sudo dpkg-reconfigure debconf -f noninteractive -p critical

  echo "\e[33m**********\e[37mUPGRADING\e[33m**********\e[0m"
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get install gnupg2 -y

  echo "\e[33m**********\e[37mADDING M$ REPO\e[33m**********\e[0m"
  sudo curl --progress-bar https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo \"deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main\" > /etc/apt/sources.list.d/vscode.list'

  echo "\e[33m**********\e[37mINSTALLING VSCODE, GIT, GNOME TWEAKS, AND GITKRAKEN\e[33m**********\e[0m"
  sudo apt-get update -y
  sudo apt-get install -y code
  sudo apt-get install -y git
  sudo apt-get install -y gnome-tweak-tool
  sudo snap install gitkraken --classic

  echo "\e[33m**********\e[37mINSTALLING GNOME\e[33m**********\e[0m"
  sudo apt-get install -y --no-install-recommends ubuntu-desktop
  sudo apt-get install -y --no-install-recommends virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11

  sudo usermod -a -G sudo vagrant

  echo "\e[33m**********\e[37mINSTALLING CHROME\e[33m**********\e[0m"
  wget --progress=bar:force https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt-get install -y fonts-liberation xdg-utils
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  rm google-chrome-stable_current_amd64.deb

  echo "\e[33m**********\e[37mINSTALLING CHROMIUM\e[33m**********\e[0m"
  sudo apt-get install -y chromium-browser

  echo "\e[33m**********\e[37mINSTALLING FIREFOX\e[33m**********\e[0m"
  sudo apt-get install -y firefox

  sudo apt-get install -y gnome-shell-extensions
  echo "\e[33m**********\e[37mSETTING FAVORITES\e[33m**********\e[0m"
  dbus-launch dconf write /org/gnome/shell/favorite-apps \"['google-chrome.desktop', 'code.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop']\"

  echo "\e[33m**********\e[37mSETTING SOME GNOME TWEAKS\e[33m**********\e[0m"
  sudo -Hu vagrant dbus-launch gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
  sudo -Hu vagrant dbus-launch gsettings set org.gnome.desktop.interface clock-format 12h

  echo "\e[33m**********\e[37mSETTING LOCAL TIME ZONE\e[33m**********\e[0m"
  sudo rm /etc/localtime && sudo ln -s /usr/share/zoneinfo/US/Arizona /etc/localtime

  echo "\e[33m**********\e[37mDOTFILES\e[33m**********\e[0m"
  git clone https://github.com/ntalekt/dotfiles.git ~/.dotfiles

  function link_file() {
    echo "linking ~/.$1"
    ln -sf "$PWD/.dotfiles/.$1" "$HOME/.$1"
  }

  link_file bash_prompt
  link_file bashrc
  link_file dircolors
  link_file inputrc
  link_file vim
  link_file vimrc

  echo "\e[33m**********\e[37mREBOOTING\e[33m**********\e[0m"
  sudo shutdown -r now

  echo "\e[33m**********\e[37mDONE\e[33m**********\e[0m"
  SHELL
  config.vm.provision "shell", inline: $script, privileged: false

end
