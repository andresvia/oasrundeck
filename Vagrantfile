# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"
  config.vm.provision "shell", inline: "rm -rf /tmp/packages"
  config.vm.provision "file", source: "packages", destination: "/tmp/packages"
  config.vm.provision "shell", path: "installer.sh"
  config.vm.provision "shell", inline: "rm -rf /tmp/packages/"
  config.vm.network :forwarded_port, guest: 4443, host: 4443
end
