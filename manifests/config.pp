# Private
define eosserver::config(
  String $config_file,
  Hash $config,
  Enum['present', 'absent'] $package_ensure,
  Optional[String] $custom_fragment = undef,
) {

  if $package_ensure == 'absent' {
    file { $config_file: ensure => absent }
  } else {
    # EOS Configuration file
    file { $config_file:
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content =>  template("${module_name}/eos-cfg.erb"),
    }
  }
}
