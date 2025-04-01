# @summary Host customization if running on a KVM hypervisor
#
# Host customization if running on a KVM hypervisor
# Currently this only makes changes for QEMU virtual hosts
#
# NOTE: For QEMU VMs qemu_guest_agent needs to be enabled for the VM in the hypervisor.
# Enabling the qemu_guest_agent option creates a special device that the VM host has access to.
#
# @param files_remove_setuid
#   Hash of file resource parameters that need setuid removed from them
#
# @param qemu_packages
#   Array of packages to ensure installed for qemu
#
# @param qemu_services
#   Array of services to ensure running for qemu
#
# @example
#   include profile_virtual::kvm
class profile_virtual::kvm (
  Hash             $files_remove_setuid,
  Array[String[1]] $qemu_packages,
  Array[String[1]] $qemu_services,
) {
  $hw_array = split($facts['dmi']['manufacturer'], Regexp['[\s,]'])
  $hardware = $hw_array[0]

  case $hardware {
    /(?i)qemu/: {
      # CAN ONLY RUN qemu_guest_agent IF 'QEMU Guest Agent' OPTION ENABLED ON THE VM
      # IN PROXMOX THIS REQUIRES ENABLING IT UNDER EACH VM'S OPTIONS
      if $facts['qemu_guest_agent'] {
        # INSTALL $qemu_packages
        ensure_packages(
          $qemu_packages,
          { 'notify' => Service[$qemu_services], }
        )

        # ENABLE $qemu_services
        service { $qemu_services:
          ensure     => running,
          enable     => true,
          hasstatus  => true,
          hasrestart => true,
        }
      } else {
        notify { 'QEMU guest agent device is not present in this VM. You should enable it in the VMs hypervisor.': }
      }
    }
    default:  {
      ## DO NOT DO ANYTHING
      ## CURRENTLY WE HAVE NO CONFIGURATION FOR OTHER TYPES OF KVM VMS
    }
  }

  # Remove setuid/setgid from key files
  $file_remove_setuid_defaults = {
    mode    => 'ug-s',
  }
  ensure_resources('file', $files_remove_setuid, $file_remove_setuid_defaults )
}
