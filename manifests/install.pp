# == Class x2go::install
#
# This class is called from x2go for install.
#
class x2go::install {

  package { $::x2go::package_name:
    ensure => present,
  }
}
