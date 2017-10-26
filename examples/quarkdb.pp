# Setup repos, environment etc...
class { '::eosserver':
  quarkdb_ensure   => 'present',
  debuginfo_ensure => 'present',
}

# Will not work out of the box, requires cluster initialization
# QuarkDB Instance
::eosserver::instance { 'quarkdb':
  instance_name => 'xrootd@quarkdb',
  config_file   => '/etc/xrootd/xrootd-quarkdb.cfg',
  config        => lookup({
    'name'  => 'eosserver_quarkdb_config',
    'merge' => {
      'strategy'        => 'deep',
      'knockout_prefix' => '--',
    },
  }),
}
