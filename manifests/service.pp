# Private
define eosserver::service(
  Enum['running', 'stopped'] $service_ensure,
  Boolean $service_manage,
) {

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
