class eosserver::repo (
  Enum['present', 'absent'] $ensure,
  String $repo_xroot_url,
  String $repo_xroot_dev_url,
  Integer $repo_xroot_priority,
  String $repo_main_url,
  String $repo_deps_url,
  String $repo_quark_url,
  String $repo_dev_url,
  Boolean $repo_enable_dev,
  Integer $repo_priority,
  Optional[String] $repo_xroot_gpgkey = undef,
  Optional[String] $repo_main_gpgkey = undef,
  Optional[String] $repo_deps_gpgkey = undef,
  Optional[String] $repo_quark_gpgkey = undef,
  Optional[String] $repo_dev_gpgkey = undef,
) {

  # Standard repos
  yumrepo { 'xroot-stable':
    ensure   => $ensure,
    descr    => 'XRootD repository',
    baseurl  => $repo_xroot_url,
    priority => $repo_xroot_priority,
    gpgkey   => $repo_xroot_gpgkey,
    gpgcheck => eosserver::str2bool($repo_xroot_gpgkey),
  }
  yumrepo { 'eos':
    ensure   => $ensure,
    descr    => 'EOS Repository',
    baseurl  => $repo_main_url,
    priority => $repo_priority,
    gpgkey   => $repo_main_gpgkey,
    gpgcheck => eosserver::str2bool($repo_main_gpgkey),
  }
  yumrepo { 'eos-deps':
    ensure   => $ensure,
    descr    => 'EOS Deps Repository',
    baseurl  => $repo_deps_url,
    priority => $repo_priority,
    gpgkey   => $repo_deps_gpgkey,
    gpgcheck => eosserver::str2bool($repo_deps_gpgkey),
  }
  yumrepo { 'eos-quarkdb':
    ensure   => $ensure,
    descr    => 'EOS QuarkDB Repository',
    baseurl  => $repo_quark_url,
    priority => $repo_priority,
    gpgkey   => $repo_quark_gpgkey,
    gpgcheck => eosserver::str2bool($repo_quark_gpgkey),
  }

  # Dev repositories
  yumrepo { 'xrootd-testing':
    ensure   => $ensure,
    descr    => 'XRootD Test Repository',
    baseurl  => $repo_xroot_dev_url,
    enabled  => $repo_enable_dev,
    priority => $repo_priority,
    gpgkey   => $repo_xroot_gpgkey,
    gpgcheck => eosserver::str2bool($repo_xroot_gpgkey),
  }
  yumrepo { 'eos-dev':
    ensure   => $ensure,
    descr    => 'EOS DEV Repository',
    baseurl  => $repo_dev_url,
    enabled  => $repo_enable_dev,
    priority => $repo_priority,
    gpgkey   => $repo_dev_gpgkey,
    gpgcheck => eosserver::str2bool($repo_dev_gpgkey),
  }
}
