# == Class x2go::install
#
# This class is called from x2go for install.
#
class x2go::install {

  if $::x2go::client {
    ensure_packages($::x2go::client_packages,{ensure => $::x2go::ensure})
  }
  if $::x2go::server {
    ensure_packages($::x2go::server_packages,{ensure => $::x2go::ensure})
  }

}
