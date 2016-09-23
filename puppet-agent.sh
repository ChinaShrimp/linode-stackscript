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

# download the foreman installer
apt-get update && apt-get -y install puppet-agent 

# use puppet to install&configure puppet server
