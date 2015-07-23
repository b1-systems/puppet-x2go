# == Class x2go::params
#
# This class is meant to be called from x2go.
# It sets variables according to platform.
#
class x2go::params {
  case $::osfamily {
    'Ubuntu': {
      $package_name = 'x2go'
      $service_name = 'x2go'
    }
    'CentOS': {
      $package_name = 'x2go'
      $service_name = 'x2go'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
