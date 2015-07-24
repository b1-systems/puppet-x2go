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
# [*upstream_repos*]
#   Should we configure repos so that the latest release is available on the system?
#   Used with manage_repos. 
#
class x2go (
  $ensure          = 'present',
  $server          = true,
  $client          = false,
  $manage_repos    = true,
  $upstream_repos  = false,
  $server_packages = $::x2go::params::server_packages,
  $client_packages = $::x2go::params::client_packages
) inherits ::x2go::params {

  validate_string($ensure,'^(present|absent)','ensure must be either present or absent') 
  validate_bool($server)
  validate_bool($client)
  validate_bool($manage_repos)
  validate_bool($upstream_repos)
  validate_array($server_packages)
  validate_array($client_packages)

  class { '::x2go::install': }

  if $manage_repos {
    class { '::x2go::repos':
      ensure  => $ensure,
      before => Class['::x2go::install']
    }
  }
  Class['::x2go::install'] -> Class['::x2go']
}
