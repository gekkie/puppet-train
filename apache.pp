package { 'apache2':
  ensure => installed,
}

$MyName = 'Geordy'

file { '/var/www/index.html':
  ensure => file,
  mode => 644,
  content => "<html><body><h1>This is ${MyName}'s Webserver</h1>
<p>My FQDN is ${fqdn}, and my IP address is ${ipaddress}</p>
<p>And I run on this great Operating System called ${operatingsystem}</p>
</body></html>",
}
service { 'apache2':
  ensure => running,
  enable => true,
  subscribe => File['/var/www/index.html'],
} 

