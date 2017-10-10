class eosserver (
  Enum['present', 'absent'] $ensure  = $::eosserver::params::ensure,
  Boolean $pkg_debuginfo            = $::eosserver::params::pkg_debuginfo,
) inherits eosserver::params {

  ## Actual work here
  Class['::eosserver::repo'] -> Class['::eosserver::install'] -> Class['::eosserver::environment']

  class { '::eosserver::repo': }
  class { '::eosserver::install': }
  class { '::eosserver::environment': }
}
