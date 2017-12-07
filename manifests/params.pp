class eosserver::params {
  $ensure            = 'present'
  $xroot_repo_url    = "http://xrootd.cern.ch/sw/repos/stable/slc/${::operatingsystemmajrelease}/\$basearch/"
  $xroot_gpgkey      = 'http://xrootd.cern.ch/sw/releases/RPM-GPG-KEY.txt'
  $xroot_gpgcheck    = true
  $xroot_priority    = 5
  $repo_main_url     = "http://storage-ci.web.cern.ch/storage-ci/eos/citrine/tag/el-${::operatingsystemmajrelease}/\$basearch/"
  $repo_main_gpgkey  = ''
  $repo_deps_url     = "http://storage-ci.web.cern.ch/storage-ci/eos/citrine-depend/el-${::operatingsystemmajrelease}/\$basearch/"
  $repo_deps_gpgkey  = ''
  $repo_quark_url    = "http://storage-ci.web.cern.ch/storage-ci/quarkdb/tag/el${::operatingsystemmajrelease}/\$basearch/"
  $repo_quark_gpgkey = ''
  $repo_dev_url      = "http://storage-ci.web.cern.ch/storage-ci/eos/citrine/commit/el-${::operatingsystemmajrelease}/\$basearch/"
  $repo_dev_gpgkey   = ''
  $repo_enable_dev   = false
  $repo_gpgcheck     = false
  $repo_priority     = 5
  $quarkdb_ensure    = 'absent'
  $debuginfo_ensure  = 'absent'
  $config            = {
    '# EMPTY' => 'CONFIGURATION',
  }
  $environment_file  = '/etc/sysconfig/eos_env'
  $environment       = lookup({
    'name'          => 'eosserver_environment',
    'value_type'    => Hash,
    'default_value' => {
      '# KEY' => 'VALUE',
    },
    'merge'         => {
      'strategy'        => 'deep',
      'knockout_prefix' => '--',
    },
  })
}
