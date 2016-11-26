#!/bin/bash

# Installing a bunch of stuff as the vagrant user (easier than sudo -u vagrant on each line)

echo "Install ruby..."

# this is the correct command, but is failing during development, so switching to following line
#gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://rvm.io/mpapis.asc | gpg --import -

curl -sSL https://get.rvm.io | bash -s stable --ruby

# source this for this run, normally not needed
source /home/vagrant/.rvm/scripts/rvm

# default
rvm install "$(cat refresh/.ruby-version)"
rvm --default use "$(cat refresh/.ruby-version)"

echo "...done."

#echo "Install nvm..."
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
## and set up nvm for this shell
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
#echo "...done."
#
#echo "Installing node..."
#NODE_VERSION="$(cat ~/refresh/.nvmrc)"
#nvm install $NODE_VERSION
#nvm alias default $NODE_VERSION
##npm install -g bower
##npm install -g divshot-cli
#echo "...done."

echo "Setting up things..."

# set VAGRANT=true to enable scripts to detect whether they run on Vagrant VM
echo "export VAGRANT=true" >> /home/vagrant/.bash_profile
# set localization to en_US.UTF-8 to avoid character encoding errors in Liquid
echo "export LC_ALL=en_US.UTF-8" >> /home/vagrant/.bash_profile

echo "gem: --no-ri --no-rdoc" >> /home/vagrant/.gemrc

# cd to /refresh when logging in via "vagrant ssh"
echo "cd ~/refresh" >> /home/vagrant/.bash_profile

# set up vagrant login customizations
cp ~/refresh/dev/vagrant-setup/gitconfig ~/.gitconfig
ln -s ~/refresh/dev/vagrant-setup/bash_aliases ~/.bash_aliases

echo "...done settings up things."


echo "Installing the gems..."
gem install bundler --no-ri --no-rdoc
gem install jekyll

cd ~/refresh
bundle install
echo "...done installing the gems."

