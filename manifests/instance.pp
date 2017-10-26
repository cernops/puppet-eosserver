define eosserver::instance (
  Enum['present', 'absent'] $package_ensure = 'present',
  Enum['stopped', 'running'] $service_ensure = 'running',
  Boolean $service_manage = true,
  Hash $config = undef,
  Optional[String] $instance_name = "eos@${title}",
  Optional[String] $config_file = "/etc/xrd.cf.${title}",
  Optional[String] $custom_fragment = undef,
) {

  # Can't inherit in a define, so we include params
  include ::eosserver::params

  $_config = pick($config, $eosserver::params::config)
  validate_hash($_config)

  validate_absolute_path(dirname($config_file))

  eosserver::config { $instance_name:
    config_file     => $config_file,
    config          => $_config,
    package_ensure  => $package_ensure,
    custom_fragment => $custom_fragment,
  }
  -> eosserver::service { $instance_name:
    service_ensure => $service_ensure,
    service_manage => $service_manage,
  }
}
