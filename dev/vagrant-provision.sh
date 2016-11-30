#!/bin/bash

# Set up the vagrant box, these are run as root

echo "Updating package repositories..."
apt-get -y update >/dev/null 2>&1
echo "...done."

echo "Installing curl and git..."
apt-get -y install curl git >/dev/null 2>&1
echo "...done."

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y build-essential nodejs python

echo "Setting up user configuration..."
su -c "refresh/dev/vagrant-provision-as-user.sh" ubuntu

echo "Done"
cat ~ubuntu/refresh/dev/vagrant-setup/first-run.txt

