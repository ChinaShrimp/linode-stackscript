package { 'vim': ensure => present }
package { 'curl': ensure => present }
package { 'zsh': ensure => present }
package { 'git': ensure => present }

file { 'oh-my-zsh-install.sh':
  ensure => 'file',
  source => 'https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh',
  path   => '/tmp/install.sh',
  owner  => 'root',
  mode   => '0744',
  notify => Exec['oh-my-zsh'],
  require => [Package['zsh'], Package['curl'], Package['git']]
}

exec { 'oh-my-zsh':
  path => '/usr/bin:/usr/sbin:/bin',
  command => 'bash /tmp/install.sh',
}

# to avoid bad ssh pipe when using ssh login
exec { 'ssh-alive-interval':
  path => '/usr/bin:/usr/sbin:/bin',
  command => 'echo "ClientAliveInterval 30" >> /etc/ssh/sshd_config'
}
