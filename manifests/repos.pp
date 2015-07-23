# == Class: x2go::repos
#
# This class configures needed repositories in order to install x2go
#
# === Parameters
#
# [*ensure*]
#   
class x2go::repos(
  $ensure         = 'present',
  $nightly_builds = false,
  $extra_packages = false
) {
  validate_bool($nightly_builds)
  validate_bool($extra_packages)
  validate_string($ensure,'^(present|absent)','ensure must be either present or absent')
}
