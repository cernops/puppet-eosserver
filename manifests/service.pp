# Private
define eosserver::service(
  Enum['running', 'stopped'] $service_ensure,
  Boolean $service_manage,
) {

  if defined($caller_module_name) and $caller_module_name != '' and $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  $_service_enable = $service_ensure ? {
    'running' => true,
    'stopped' => false,
    default   => $service_ensure,
  }

  service { $title:
    ensure => $service_ensure,
    enable => $_service_enable,
    name   => $title,
  }

}
