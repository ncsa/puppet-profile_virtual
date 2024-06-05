# @summary Host customization if running on a VMware hypervisor
#
# Host customization if running on a VMware hypervisor
#
# @param files_remove_setuid
#   Hash of file resource paramters that need setuid removed from them
#
# @param packages
#   Array of packages to ensure installed for vmware
#
# @param services
#   Array of services to ensure running for vmware
#
# @example
#   include profile_virtual::vmware
class profile_virtual::vmware (
  Hash               $files_remove_setuid,
  Array[String[1]] $packages,
  Array[String[1]] $services,
) {
  # INSTALL VMWARE $packages
  ensure_packages(
    $packages,
    { 'notify' => Service[$services], }
  )

  # ENABLE VMWARE $services
  service { $services:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

  # Remove setuid/setgid from key files
  $file_remove_setuid_defaults = {
    mode    => 'ug-s',
  }
  ensure_resources('file', $files_remove_setuid, $file_remove_setuid_defaults )
}
