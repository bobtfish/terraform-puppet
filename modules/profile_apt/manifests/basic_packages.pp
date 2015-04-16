class profile_apt::basic_packages {
  package { ['nmap', 'traceroute', 'vim', 'git']: ensure => latest }
}

