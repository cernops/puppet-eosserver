class eosserver::install (
  Enum['present', 'absent'] $package_ensure = 'present',
  Enum['present', 'absent'] $quarkdb_ensure = 'absent',
  Enum['present', 'absent'] $debuginfo_ensure = 'absent',
){

  if defined($caller_module_name) and $caller_module_name != '' and $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  package{ ['xrootd', 'xrootd-libs', 'xrootd-client']:
    ensure => $package_ensure,
  }
  package{ ['eos-server', 'eos-client']:
    ensure => $package_ensure,
  }
  package{ ['quarkdb']:
    ensure => $quarkdb_ensure,
  }
  package{ ['xrootd-debuginfo', 'eos-debuginfo']:
    ensure => $debuginfo_ensure,
  }
  package{ ['quarkdb-debuginfo']:
    ensure =>  bool2str(
      ($quarkdb_ensure == 'present' and $debuginfo_ensure == 'present'),
      'present',
      'absent'
    ),
  }
}
