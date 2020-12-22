#!/bin/sh

exec qemu-system-ppc \
  -machine g3beige,usb=off \
  -m 1024 \
  -vnc :0 \
  -no-reboot \
  -kernel /opt/xplat-ci-images/powerpc64/vmlinux \
  -initrd /opt/xplat-ci-images/powerpc64/rootfs.cpio.lz4 \
  -append "console=ttyS0 rootwait ro modules_load=9pnet_virtio,9p rdinit=/init-custom" \
  -net user,hostfwd=tcp::10022-:22 \
  -net nic,model=rtl8139 \
  -serial tcp:127.0.0.1:4321,server,nowait \
  -device virtio-rng-pci \
  -virtfs local,path=/hostoverlay,security_model=mapped,mount_tag=hostrootfsoverlay9p \
  -virtfs local,path=/mnt,security_model=mapped,mount_tag=hostmnt9p
