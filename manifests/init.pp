# == Class: x2go
#
# Full description of class x2go here.
#
# === Parameters
#
# [*ensure*]
#   How should x2go be managed? 
#   Valid values: present,absent
#   Default: present
# [*manage_repos*]
#   Should this module configure all needed repositories in order to install
#   x2go client/server? 
#   This needs apt/epel modules
#   Valid values: true, false
#   Default: true
# [*latest_release*]
#   Should we configure repos so that the latest release is available on the system?
#   Used with manage_repos. 
#
class x2go (
  $ensure         = 'present',
  $manage_repos   = true,
  $latest_release = false,
  $package_name   = $::x2go::params::package_name,
  $service_name   = $::x2go::params::service_name,
) inherits ::x2go::params {

  # validate parameters here

  class { '::x2go::install': } ->
  class { '::x2go::config': } ~>
  class { '::x2go::service': } ->
  Class['::x2go']
}
