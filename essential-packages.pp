package { 'vim': ensure => present }
package { 'curl': ensure => present }
package { 'zsh': ensure => present }

exec { 'oh-my-zsh':
  command => 'curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo sh',
  require => [Package['zsh'], Package['curl']]
}
