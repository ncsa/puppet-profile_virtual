# @summary Host customization depending on virtualization hypervisor type
#
# Host customization depending on virtualization hypervisor type
#
# @example
#   include profile_virtual
class profile_virtual {

  case $facts['virtual'] {
    'vmware': {
      include ::profile_virtual::vmware
    }
    'physical': {
      include ::profile_virtual::physical
    }
    default:  {
      ## DO NOT DO ANYTHING
    }
  }

  # OTHER POSSIBLE virtual FACT VALUES:
  # 'virtualbox', 'kvm', 'openstack', hyperv, qemu, xen, etc.

}
