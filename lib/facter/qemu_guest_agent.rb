Facter.add('qemu_guest_agent') do
  setcode do
    File.exist?('/dev/virtio-ports/org.qemu.guest_agent.0')
  end
end
