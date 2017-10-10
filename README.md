# EOS Server module for Puppet

## Description

Puppet module for configuring EOS server components.
For general EOS configuration and documentation, see:
  https://cern.ch/eos-docs

## Prerequisites
 * RHEL7-like distribution
 * [puppetlabs/concat](https://forge.puppet.com/puppetlabs/concat)
 * [puppetlabs/stdlib](https://forge.puppet.com/puppetlabs/stdlib)

## Usage

```puppet
class { '::eosserver':}
```

This one-liner will setup repositories and system-wide environment files but NOT configure any EOS instance.

```puppet
::eosserver::instance { 'fst':
    config_file => '/etc/xrd.cf.fst',
    config      => lookup({
      'name'  => 'eosserver_fst_config',
      'merge' => {
        'strategy'        => 'deep',
        'knockout_prefix' => '--',
      },
    }),
  }
```

This snippet create an EOS daemon instance (not to be confused with a whole EOS instance) called FST.
The content of the daemon configuration is extracted by doing a `hiera` lookup.

```yaml
eosserver::environment::environment:
  XRD_ROLES: fst
  LD_PRELOAD: /usr/lib64/libjemalloc.so.1
  EOS_MGM_URL: root://eospps.cern.ch
  EOS_MGM_ALIAS: eospps.cern.ch
  EOS_BROKER_URL: root://eospps.cern.ch:1097//eos/
  EOS_HTTP_THREADPOOL: epoll
  EOS_HTTP_THREADPOOL_SIZE: 32
  EOS_HTTP_CONNECTION_MEMORY_LIMIT: 4194304

eoserver_fst_config:
  set: "MGM=%{lookup('eosserver::environment::environment.EOS_MGM_ALIAS')}"
  all.trace: none
  all.manager: localhost 2131
  all.export: / nolock
  fstofs.symkey: '%TEIGI__fstofs_symkey__%'
  fstofs.quotainterval: 10
  fstofs.metalog: /var/eos/md
  fstofs.broker: "%{lookup('eosserver::environment::environment.EOS_BROKER_URL')}"
  fstofs.autoboot: true
  sec.protocol:
    - unix
    - sss -c /etc/eos.keytab -s /etc/eos.keytab
  sec.protbind: '* only unix sss'
  xrootd.fslib: "-2 libXrdEosFst.so"
  xrootd.async: off nosf
  xrootd.redirect: '$(MGM):1094 chksum'
  xrootd.seclib: libXrdSec.so
  xrd.timeout: idle 86400
  xrd.port: 1095
  xrd.network: keepalive
  ofs.tpc: pgm /usr/bin/xrdcp
  ofs.persist: off
```

Hiera example in YAML of setting up a FST daemon instance and setting various system-wide environment variables.

All the standard settings can be set via hiera calls in the params.pp file. See that file for details.

### Authors
CERN EOS operations team - Hervé Rousseau <hroussea at cern.ch>
