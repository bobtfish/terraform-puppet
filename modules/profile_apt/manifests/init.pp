class profile_apt {
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
      id     => '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30';
    'docker':
      ensure => 'present',
      id => '36A1D7869245C8950F966E92D8576A8BA88D21E9';
  }
  apt::source {
    'puppetlabs':
      location   => 'http://apt.puppetlabs.com',
      repos      => 'main',
      release    => 'trusty';
    'docker':
      location    => 'https://get.docker.io/ubuntu',
      repos       => 'main',
      release     => 'docker',
      include_src => false;
    'ubuntu':
      location => "http://${::ec2_placement_availability_zone}.clouds.archive.ubuntu.com/ubuntu/",
      release  => 'trusty',
      repos    => 'main universe';
    'ubuntu-updates':
      location => "http://${::ec2_placement_availability_zone}.clouds.archive.ubuntu.com/ubuntu/",
      release  => 'trusty-updates',
      repos    => 'main universe';
    'ubuntu-security':
      location => 'http://security.ubuntu.com/ubuntu',
      release  => 'trusty',
      repos    => 'main universe';
  }
  include profile_apt::basic_packages
}

