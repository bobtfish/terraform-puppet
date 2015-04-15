class role::puppetmaster inherits role::base {
  host { 'puppet':
    ensure => 'present',
    ip     => $::ipaddress_eth0,
  }
  package { 'puppetmaster-passenger': ensure => latest } ~>
  service { 'apache2':
    enable => true,
    ensure => running,
  }
}

