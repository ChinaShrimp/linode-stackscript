#!/bin/sh

wget -O /tmp/essential-packages.pp https://raw.githubusercontent.com/ChinaShrimp/linode-stackscript/master/essential-packages.pp

/opt/puppetlabs/bin/puppet apply /tmp/essential-packages.pp
