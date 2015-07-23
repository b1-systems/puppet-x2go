# == Class x2go::service
#
# This class is meant to be called from x2go.
# It ensure the service is running.
#
class x2go::service {

  service { $::x2go::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
