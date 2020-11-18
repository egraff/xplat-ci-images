#
# Post-build script for buildroot
#

TARGET_ROOT_FS=$1

if ! grep -q "hostmnt9p" "$[TARGET_ROOT_FS}/etc/fstab"; then
  #     <file system>   <mount pt>      <type>  <options>       <dump>  <pass>
  echo "hostmnt9p       /mnt            9p      trans=virtio,version=9p2000.L,rw,_netdev   0       0" >> "$[TARGET_ROOT_FS}/etc/fstab"
fi
