#!/bin/sh

wget -O /tmp/essential-packages.pp https://raw.githubusercontent.com/ChinaShrimp/linode-stackscript/master/essential-packages.pp

puppet apply /tmp/essential-packages.pp
