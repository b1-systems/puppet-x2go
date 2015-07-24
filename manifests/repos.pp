# == Class: x2go::repos
#
# This class configures needed repositories in order to install x2go
#
# === Parameters
#
# [*ensure*]
#   
class x2go::repos(
  $ensure           = 'present',
  $upstream_repos   = true,
  $nightly_builds   = false,
  $current_packages = true,
  $el_repofile_path = '/etc/yum.repos.d/x2go.repo',
  $ubuntu_ppa       = 'ppa:x2go/stable',
  $extra_packages   = false
) {
  validate_bool($nightly_builds)
  validate_bool($extra_packages)
  validate_bool($upstream_repos)
  validate_bool($current_packages)
  validate_absolute_path($el_repofile_path)
  validate_string($ensure,'^(present|absent)','ensure must be either present or absent')
  
  case $ensure {
    'present': {
      $epel_enabled = true
    }
    'absent': {
      $epel_enabled = false
    }
  }
  if $::osfamily == 'RedHat' {
    if ! defined(Class['epel']) {
      class{'epel':
        epel_enabled => $epel_enabled,
      }
      if $upstream_repos {
        file{$el_repofile_path:
          ensure  => $ensure,
          content => template('x2go/x2go-rhel.repo.erb'),
          require => Class['epel'],
        }
      }
    }
  }
  if $::operatingsystem == 'Ubuntu' {
    apt::ppa{$ubuntu_ppa:}
  }
}
