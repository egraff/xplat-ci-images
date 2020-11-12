#
# Post-build script for buildroot
#

TARGET_ROOT_FS=$1

chmod 644 ${TARGET_ROOT_FS}/etc/ssh/moduli
chmod 644 ${TARGET_ROOT_FS}/etc/ssh/ssh_config
chmod 644 ${TARGET_ROOT_FS}/etc/ssh/sshd_config
chmod 644 ${TARGET_ROOT_FS}/etc/ssh/ssh_host_dsa_key.pub
chmod 644 ${TARGET_ROOT_FS}/etc/ssh/ssh_host_ecdsa_key.pub
chmod 644 ${TARGET_ROOT_FS}/etc/ssh/ssh_host_ed25519_key.pub
chmod 644 ${TARGET_ROOT_FS}/etc/ssh/ssh_host_rsa_key.pub
chmod 600 ${TARGET_ROOT_FS}/etc/ssh/ssh_host_dsa_key
chmod 600 ${TARGET_ROOT_FS}/etc/ssh/ssh_host_ecdsa_key
chmod 600 ${TARGET_ROOT_FS}/etc/ssh/ssh_host_ed25519_key
chmod 600 ${TARGET_ROOT_FS}/etc/ssh/ssh_host_rsa_key
