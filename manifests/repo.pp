class eosserver::repo (
  Enum['present', 'absent'] $ensure,
  String $xroot_repo_url,
  String $xroot_dev_repo_url,
  Integer $xroot_priority,
  String $repo_main_url,
  String $xroot_gpgkey,
  String $repo_deps_url,
  String $repo_quark_url,
  String $repo_dev_url,
  Boolean $repo_enable_dev,
  Integer $repo_priority,
  Optional[String] $repo_main_gpgkey = undef,
  Optional[String] $repo_deps_gpgkey = undef,
  Optional[String] $repo_quark_gpgkey = undef,
  Optional[String] $repo_dev_gpgkey = undef,
) {

  # Standard repos
  yumrepo { 'xroot-stable':
    ensure   => $ensure,
    descr    => 'XRootD repository',
    baseurl  => $xroot_repo_url,
    priority => $xroot_priority,
    gpgkey   => $xroot_gpgkey,
    gpgcheck => defined('$repo_main_gpgkey'),
  }
  yumrepo { 'eos':
    ensure   => $ensure,
    descr    => 'EOS Repository',
    baseurl  => $repo_main_url,
    priority => $repo_priority,
    gpgcheck => defined('$repo_main_gpgkey'),
  }
  yumrepo { 'eos-deps':
    ensure   => $ensure,
    descr    => 'EOS Deps Repository',
    baseurl  => $repo_deps_url,
    priority => $repo_priority,
    gpgkey   => $repo_deps_gpgkey,
    gpgcheck => defined('$repo_deps_gpgkey'),
  }
  yumrepo { 'eos-quarkdb':
    ensure   => $ensure,
    descr    => 'EOS QuarkDB Repository',
    baseurl  => $repo_quark_url,
    priority => $repo_priority,
    gpgkey   => $repo_quark_gpgkey,
    gpgcheck => defined('$repo_quark_gpgkey'),
  }

  # Dev repositories
  yumrepo { 'xrootd-testing':
    ensure   => $ensure,
    descr    => 'XRootD Test Repository',
    baseurl  => $xroot_dev_repo_url,
    enabled  => $repo_enable_dev,
    priority => $repo_priority,
    gpgkey   => $xroot_gpgkey,
    gpgcheck => defined('$repo_dev_gpgkey'),
  }
  yumrepo { 'eos-dev':
    ensure   => $ensure,
    descr    => 'EOS DEV Repository',
    baseurl  => $repo_dev_url,
    enabled  => $repo_enable_dev,
    priority => $repo_priority,
    gpgkey   => $repo_dev_gpgkey,
    gpgcheck => defined('$repo_dev_gpgkey'),
  }
}
