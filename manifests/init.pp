class eosserver (
  Enum['present', 'absent'] $ensure,
  Enum['present', 'absent'] $quarkdb_ensure,
  Enum['present', 'absent'] $debuginfo_ensure,
) {

  ## Order is important
  Class['::eosserver::repo'] -> Class['::eosserver::install'] -> Class['::eosserver::environment']

  class { '::eosserver::repo': }
  class { '::eosserver::install':
    package_ensure   => $ensure,
    quarkdb_ensure   => $quarkdb_ensure,
    debuginfo_ensure => $debuginfo_ensure,
  }
  class { '::eosserver::environment': }

  # Make sure that require Class['::eoserver'] calls are instantiating child classes
  # in the correct order
  contain(['::eosserver::repo', '::eosserver::install', '::eosserver::environment'])
}
