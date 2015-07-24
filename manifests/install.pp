# == Class x2go::install
#
# This class is called from x2go for install.
#
class x2go::install {

  if $::x2go::client {
    package { $::x2go::client_packages:
      ensure => $::x2go::ensure,
    }
  }
  if $::x2go::server {
    package { $::x2go::server_packages:
      ensure => $::x2go::ensure,
    }
  }

}
