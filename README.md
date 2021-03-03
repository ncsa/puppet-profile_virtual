# profile_virtual

![pdk-validate](https://github.com/ncsa/puppet-profile_virtual/workflows/pdk-validate/badge.svg)
![yamllint](https://github.com/ncsa/puppet-profile_virtual/workflows/yamllint/badge.svg)

NCSA Common Puppet Profiles - configure depending on virtualization hypervisor type

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with profile_virtual](#setup)
    * [What profile_virtual affects](#what-profile_virtual-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with profile_virtual](#beginning-with-profile_virtual)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

This puppet profile customizes a host depending on the virtualization hypervisor type in use.

## Setup

Include profile_virtual in a puppet profile file:
```
include ::profile_virtual
```

## Usage

The goal is that no paramters are required to be set. The default paramters should work for most NCSA deployments out of the box.

## Reference

See: [REFERENCE.md](REFERENCE.md)

## Limitations

n/a

## Development

This Common Puppet Profile is managed by NCSA for internal usage.
