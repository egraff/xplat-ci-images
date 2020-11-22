#!/bin/sh

exec qemu-system-ppc64 \
  -machine pseries,usb=off \
  -cpu POWER7 \
  -m 1024 \
  -vnc :0 \
  -no-reboot \
  -kernel /opt/xplat-ci-images/powerpc64/vmlinux \
  -initrd /opt/xplat-ci-images/powerpc64/rootfs.cpio.lz4 \
  -append "console=hvc0 rootwait ro modules_load=9pnet_virtio,9p rdinit=/init-custom" \
  -net user,hostfwd=tcp::10022-:22 \
  -net nic \
  -serial tcp:127.0.0.1:4321,server,nowait \
  -device virtio-rng-pci \
  -virtfs local,path=/hostoverlay,security_model=mapped,mount_tag=hostrootfsoverlay9p \
  -virtfs local,path=/mnt,security_model=mapped,mount_tag=hostmnt9p
