# Private
class eosserver::environment (
  Enum['present', 'absent'] $ensure  = $::eosserver::params::ensure,
  String $environment_file           = $::eosserver::params::environment_file,
  Hash $environment                  = $::eosserver::params::environment,
  Optional[String] $custom_fragment = undef,
) inherits eosserver::params {
  if defined($caller_module_name) and $caller_module_name != '' and $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  file { $::eosserver::environment::environment_file:
    ensure  => $::eosserver::environment::ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template("${module_name}/eos-env.erb"),
  }
}
