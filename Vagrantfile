# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'virtualbox'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.synced_folder ".", "/home/vagrant/refresh"
  config.vm.provision :shell, path: "dev/vagrant-provision.sh"
  config.vm.network "forwarded_port", guest: 4000, host: 4000
  config.vm.provider "virtualbox" do |vb|
    vb.name = "refreshpdx-kitt"
  end
end

# TODO: needed? config.vm.network 'private_network', type: 'dhcp'
# TODO: adjust memory?
