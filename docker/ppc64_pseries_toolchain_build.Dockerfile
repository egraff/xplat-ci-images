FROM buildroot
WORKDIR /root/

COPY buildroot-tree/ /root/buildroot-tree/

RUN \
  apt-get update && \
  apt-get install -y libc6-dev-i386 build-essential g++ && \
  apt-get install -y cpio unzip rsync bc openssh-client

RUN \
  cd /root/buildroot-2020.02.7 && \
  make BR2_EXTERNAL=/root/buildroot-tree ppc64_pseries_toolchain_defconfig && \
  FORCE_UNSAFE_CONFIGURE=1 make toolchain
