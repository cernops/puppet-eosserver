class eosserver (
  Enum['present', 'absent'] $ensure         = $::eosserver::params::ensure,
  Enum['present', 'absent'] $quarkdb_ensure = $::eosserver::params::quarkdb_ensure,
  Enum['present', 'absent'] $debuginfo_ensure = $::eosserver::params::debuginfo_ensure,
) inherits eosserver::params {

  ## Actual work here
  Class['::eosserver::repo'] -> Class['::eosserver::install'] -> Class['::eosserver::environment']

  class { '::eosserver::repo': }
  class { '::eosserver::install':
    package_ensure   => $ensure,
    quarkdb_ensure   => $quarkdb_ensure,
    debuginfo_ensure => $debuginfo_ensure,
  }
  class { '::eosserver::environment': }
}
