package { 'apache2':
  ensure => installed,
}

$MyName = 'Geordy'

file { '/var/www/index.html':
  ensure => file,
  mode => 644,
  content => template('/etc/puppet/manifests/html_index.erb'),
}
service { 'apache2':
  ensure => running,
  enable => true,
  subscribe => File['/var/www/index.html'],
} 


