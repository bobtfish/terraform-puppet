class profile_apt::basic_packages {
  package { ['nmap', 'traceroute', 'vim', 'lxc-docker', 'git']: ensure => latest }
}

