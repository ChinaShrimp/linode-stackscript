package { 'vim': ensure => present }
package { 'curl': ensure => present }
package { 'zsh': ensure => present }
package { 'git': ensure => present }

exec { 'oh-my-zsh':
  path => '/usr/bin:/usr/sbin:/bin',
  command => 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"',
  require => [Package['zsh'], Package['curl'], Package['git']]
}

# to avoid bad ssh pipe when using ssh login
exec { 'ssh-alive-interval':
  path => '/usr/bin:/usr/sbin:/bin',
  command => 'echo "ClientAliveInterval 30" >> /etc/ssh/sshd_config'
}
