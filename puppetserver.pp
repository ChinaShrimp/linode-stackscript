package { 'puppetserver':
  ensure => installed
}

# modify memory allocation parameters to 512MB
# TODO: this should be one configured parameter
# /etc/default/puppetserver JAVA_ARGS="-Xms512m -Xmx512m"

# ensure service is running
#service { 'pupperserver':
#  ensure => 
#}
