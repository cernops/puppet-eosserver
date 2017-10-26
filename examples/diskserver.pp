# Setup repos, environment etc...
class { '::eosserver': }

# FST Daemon Instance
::eosserver::instance { 'fst':
  config_file => '/etc/xrd.cf.fst.withoutsecrets',
  config      => lookup({
    'name'  => 'eosserver_fst_config',
    'merge' => {
      'strategy'        => 'deep',
      'knockout_prefix' => '--',
    },
  }),
}
