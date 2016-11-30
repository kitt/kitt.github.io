# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder ".", "/home/ubuntu/refresh"
  config.vm.provision :shell, path: "dev/vagrant-provision.sh"
  config.vm.network "forwarded_port", guest: 4000, host: 4100
  config.vm.provider "virtualbox" do |vb|
    vb.name = "refreshpdx-kitt"
  end
end

# TODO: needed? config.vm.network 'private_network', type: 'dhcp'
# TODO: adjust memory?
