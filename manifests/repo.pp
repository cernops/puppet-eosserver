class eosserver::repo (
  Enum['present', 'absent'] $ensure  = $::eosserver::params::ensure,
  String $xroot_repo_url             = $::eosserver::params::xroot_repo_url,
  String $xroot_gpgkey               = $::eosserver::params::xroot_gpgkey,
  Boolean $xroot_gpgcheck            = $::eosserver::params::xroot_gpgcheck,
  Integer $xroot_priority            = $::eosserver::params::xroot_priority,
  String $repo_main_url              = $::eosserver::params::repo_main_url,
  String $repo_main_gpgkey           = $::eosserver::params::repo_main_gpgkey,
  String $repo_deps_url              = $::eosserver::params::repo_deps_url,
  String $repo_deps_gpgkey           = $::eosserver::params::repo_deps_gpgkey,
  String $repo_quark_url             = $::eosserver::params::repo_quark_url,
  String $repo_quark_gpgkey          = $::eosserver::params::repo_quark_gpgkey,
  String $repo_dev_url               = $::eosserver::params::repo_dev_url,
  String $repo_dev_gpgkey            = $::eosserver::params::repo_dev_gpgkey,
  Boolean $repo_enable_dev           = $::eosserver::params::repo_enable_dev,
  Integer $repo_priority             = $::eosserver::params::repo_priority,
  Boolean $repo_gpgcheck             = $::eosserver::params::repo_gpgcheck,

) inherits eosserver::params {
  # Standard repos
  yumrepo { 'xroot-stable':
    ensure   => $::eosserver::repo::ensure,
    descr    => 'XRootD repository',
    baseurl  => $::eosserver::repo::xroot_repo_url,
    priority => $::eosserver::repo::xroot_priority,
    gpgkey   => $::eosserver::repo::xroot_gpgkey,
    gpgcheck => $::eosserver::repo::xroot_gpgcheck,
  }
  yumrepo { 'eos':
    ensure   => $::eosserver::repo::ensure,
    descr    => 'EOS Repository',
    baseurl  => $::eosserver::repo::repo_main_url,
    priority => $::eosserver::repo::repo_priority,
    gpgkey   => $::eosserver::repo::repo_main_gpgkey,
    gpgcheck => $::eosserver::repo::repo_gpgcheck,
  }
  yumrepo { 'eos-deps':
    ensure   => $::eosserver::repo::ensure,
    descr    => 'EOS Deps Repository',
    baseurl  => $::eosserver::repo::repo_deps_url,
    priority => $::eosserver::repo::repo_priority,
    gpgkey   => $::eosserver::repo::repo_deps_gpgkey,
    gpgcheck => $::eosserver::repo::repo_gpgcheck,
  }
  yumrepo { 'eos-quarkdb':
    ensure   => $::eosserver::repo::ensure,
    descr    => 'EOS QuarkDB Repository',
    baseurl  => $::eosserver::repo::repo_quark_url,
    priority => $::eosserver::repo::repo_priority,
    gpgkey   => $::eosserver::repo::repo_quark_gpgkey,
    gpgcheck => $::eosserver::repo::repo_gpgcheck,
  }

  # Dev repositories
  yumrepo { 'eos-dev':
    ensure   => $::eosserver::repo::ensure,
    descr    => 'EOS DEV Repository',
    baseurl  => $::eosserver::repo::repo_dev_url,
    enabled  => $::eosserver::repo::repo_enable_dev,
    priority => $::eosserver::repo::repo_priority,
    gpgkey   => $::eosserver::repo::repo_dev_gpgkey,
    gpgcheck => $::eosserver::repo::repo_gpgcheck,
  }
}
