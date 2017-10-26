# EOS Server module for Puppet

[![Build Status](https://travis-ci.org/cernops/puppet-eosserver.png?branch=master)](https://travis-ci.org/cernops/puppet-eosserver)
[![Coverage Status](https://coveralls.io/repos/github/cernops/puppet-eosserver/badge.svg?branch=master)](https://coveralls.io/github/cernops/puppet-eosserver?branch=master)

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

Examples for the following components can be found in the `examples/` folder:
 * Storage node (diskserver)
 * QuarkDB backend

All the standard settings can be set via hiera calls in the params.pp file. See that file for details.

### Authors
CERN EOS operations team - Hervé Rousseau hroussea at cern.ch
