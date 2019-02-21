# Private
class eosserver::environment (
  Enum['present', 'absent'] $ensure,
  String $environment_file,
  Hash $environment,
  Optional[String] $custom_fragment = undef,
) {

  file { $::eosserver::environment::environment_file:
    ensure  => $::eosserver::environment::ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template("${module_name}/eos-env.erb"),
  }
}
