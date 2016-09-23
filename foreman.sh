#!/bin/bash
# This block defines the variables the user of the script needs to input
# when deploying using this script.
#
#

source <ssinclude StackScriptID="40861">

# install puppet 4.x
apt-get -y install ca-certificates
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
dpkg -i puppetlabs-release-pc1-trusty.deb

# enable foreman repo
echo "deb http://deb.theforeman.org/ trusty 1.12" > /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.12" >> /etc/apt/sources.list.d/foreman.list
apt-get -y install ca-certificates
wget -q https://deb.theforeman.org/pubkey.gpg -O- | apt-key add -

# download the foreman installer
apt-get update && apt-get -y install foreman-installer

# install foreman
foreman-installer
