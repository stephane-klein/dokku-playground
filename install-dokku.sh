#!/usr/bin/env bash
# Installation based on http://dokku.viewdocs.io/dokku/getting-started/install/debian/#unattended-installation

set -ev

# install prerequisites
sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y apt-transport-https

# install docker
wget -nv -O - https://get.docker.com/ | sh

# install dokku
echo "dokku dokku/web_config boolean true" | sudo debconf-set-selections
echo "dokku dokku/vhost_enable boolean true" | sudo debconf-set-selections
echo "dokku dokku/hostname string exampel.com" | sudo debconf-set-selections

wget -nv -O - https://packagecloud.io/dokku/dokku/gpgkey | apt-key add -
OS_ID="$(lsb_release -cs 2>/dev/null || echo "bionic")"
echo "xenial bionic focal" | grep -q "$OS_ID" || OS_ID="bionic"
echo "deb https://packagecloud.io/dokku/dokku/ubuntu/ ${OS_ID} main" | sudo tee /etc/apt/sources.list.d/dokku.list
sudo apt-get update -qq >/dev/null
sudo apt-get install -qq -y dokku
sudo dokku plugin:install-dependencies --core