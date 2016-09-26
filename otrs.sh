#!/bin/sh

apt-get install -y libapache2-mod-perl2 libdbd-mysql-perl libtimedate-perl libnet-dns-perl libnet-ldap-perl \
                libio-socket-ssl-perl libpdf-api2-perl libdbd-mysql-perl libsoap-lite-perl libtext-csv-xs-perl \
                libjson-xs-perl libapache-dbi-perl libxml-libxml-perl libxml-libxslt-perl libyaml-perl \
                libarchive-zip-perl libcrypt-eksblowfish-perl libencode-hanextra-perl libmail-imapclient-perl \
                libtemplate-perl

wget -O /opt/otrs-5.0.13.tar.gz http://ftp.otrs.org/pub/otrs/otrs-5.0.13.tar.gz
cd /opt
tar -xzvf otrs-5.0.13.tar.gz
mv otrs-5.0.13 otrs

useradd -d /opt/otrs -c 'OTRS user' otrs
usermod -G www-data otrs

cd /opt/otrs
cp Kernel/Config.pm.dist Kernel/Config.pm

apt-get install -y apache2 libapache2-mod-perl2

a2enmod perl
a2enmod deflate
a2enmod filter
a2enmod headers
service apache2 restart

cd /etc/apache2/conf-available/
ln -s /opt/otrs/scripts/apache2-httpd.include.conf zzz_orts.conf
a2enconf zzz_orts
service apache2 reload

cd /opt/otrs
bin/otrs.SetPermissions.pl --web-group=www-data

# install mariadb
puppet module install puppetlabs-mysql
wget -O /tmp/mysql.pp https://raw.githubusercontent.com/ChinaShrimp/linode-stackscript/master/mysql.pp
/opt/puppetlabs/bin/puppet apply /tmp/mysql.pp
