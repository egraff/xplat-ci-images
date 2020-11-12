FROM buildroot_toolchain
WORKDIR /root/

COPY .br2-tree/ /root/br2-tree/

RUN \
  apt-get update && \
  apt-get install -y libc6-dev-i386 build-essential g++ && \
  apt-get install -y cpio unzip rsync bc openssh-client

RUN \
  cd /root/buildroot && \
  make BR2_EXTERNAL=/root/br2-tree config_defconfig && \
  FORCE_UNSAFE_CONFIGURE=1 make
