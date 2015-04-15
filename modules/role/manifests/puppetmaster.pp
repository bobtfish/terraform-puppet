class role::puppetmaster {
  class { 'apt':
    purge_sources_list   => true,
    purge_sources_list_d => true,
    purge_preferences_d  => true,
  }
  class { 'apt::release':
    release_id => 'trusty',
  }
  apt_key {
    'puppetlabs':
      ensure => 'present',
      id     => '1054B7A24BD6EC30';
    'docker':
      ensure => 'present',
      id => '36A1D7869245C8950F966E92D8576A8BA88D21E9';
  }
  apt::source {
    'puppetlabs':
      location   => 'http://apt.puppetlabs.com',
      repos      => 'main';
    'docker':
      location => 'https://get.docker.io/ubuntu',
      repos    => 'main',
      release  => 'trusty';
  }
}

