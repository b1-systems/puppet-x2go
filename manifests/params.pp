# == Class x2go::params
#
# This class is meant to be called from x2go.
# It sets variables according to platform.
#
class x2go::params {
  $client_packages = ['x2goclient',]
  case $::osfamily {
    'Debian': {
      $server_packages = [ 'x2goserver', 'x2goserver-xsession' ]
    }
    'RedHat': {
      $server_packages = [ 'x2goserver', 'x2goserver-xsession' ]
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
