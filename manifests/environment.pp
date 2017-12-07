# Private
class eosserver::environment (
  Enum['present', 'absent'] $ensure,
  String $environment_file,
  Hash $environment,
  Optional[String] $custom_fragment = undef,
) {
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
