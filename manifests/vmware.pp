# @summary Host customization if running on a VMware hypervisor
#
# Host customization if running on a VMware hypervisor
#
# @example
#   include profile_virtual::vmware
class profile_virtual::vmware (
  Array[ String[1] ] $packages,
  Array[ String[1] ] $services,
) {

  # INSTALL VMWARE $packages
  ensure_packages(
    $packages,
    { 'notify' => Service[ $services ], }
  )

  # ENABLE VMWARE $services
  service { $services:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}
