# @summary Host customization depending on virtualization hypervisor type
#
# Host customization depending on virtualization hypervisor type
#
# @example
#   include profile_virtual
class profile_virtual {
  case $facts['virtual'] {
    'kvm': {
      include profile_virtual::kvm
    }
    'physical': {
      include profile_virtual::physical
    }
    'qemu': {
      include profile_virtual::kvm
    }
    'vmware': {
      include profile_virtual::vmware
    }
    default:  {
      ## DO NOT DO ANYTHING
    }
  }

  # OTHER POSSIBLE virtual FACT VALUES:
  # 'virtualbox', 'openstack', hyperv, xen, etc.
}
