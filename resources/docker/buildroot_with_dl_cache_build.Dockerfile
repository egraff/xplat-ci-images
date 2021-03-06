ARG baseimage

FROM ${baseimage}
WORKDIR /root/buildroot/

RUN \
echo $'\
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y\n\
BR2_LINUX_KERNEL=y\n\
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y\n\
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.152.tar.xz"\n\
BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y\n\
BR2_TOOLCHAIN_BUILDROOT_CXX=y\n\
BR2_TOOLCHAIN_GCC_AT_LEAST_9=y\n\
BR2_TOOLCHAIN_GCC_AT_LEAST="9"\n\
BR2_GCC_VERSION_9_X=y\n'\
> .defconfig

RUN make defconfig

RUN make bash-source
RUN make binutils-source
RUN make busybox-source
RUN make bzip2-source
RUN make cmake-source
RUN make coreutils-source
RUN make cppunit-source
RUN make cunit-source
RUN make diffutils-source
RUN make expat-source
RUN make findutils-source
RUN make gawk-source
RUN make glibc-source
RUN make grep-source
RUN make haveged-source
RUN make host-acl-source
RUN make host-attr-source
RUN make host-autoconf-source
RUN make host-automake-source
RUN make host-binutils-source
RUN make host-bison-source
RUN make host-cmake-source
RUN make host-fakeroot-source
RUN make host-flex-source
RUN make host-gawk-source
RUN make host-gcc-initial-source
RUN make host-gettext-tiny-source
RUN make host-gmp-source
RUN make host-gperf-source
RUN make host-kmod-source
RUN make host-libcap-source
RUN make host-libffi-source
RUN make host-libtool-source
RUN make host-libzlib-source
RUN make host-lz4-source
RUN make host-meson-source
RUN make host-mpc-source
RUN make host-mpfr-source
RUN make host-m4-source
RUN make host-ncurses-source
RUN make host-patchelf-source
RUN make host-pkgconf-source
RUN make host-python3-source
RUN make host-tar-source
RUN make jitterentropy-library-source
RUN make jsoncpp-source
RUN make libarchive-source
RUN make libcurl-source
RUN make libopenssl-source
RUN make libsysfs-source
RUN make libuv-source
RUN make libzlib-source
RUN make nano-source
RUN make ncurses-source
RUN make openssh-source
RUN make patch-source
RUN make rhash-source
RUN make rng-tools-source
RUN make sed-source
RUN make strace-source
RUN make valgrind-source
RUN make xz-source

RUN \
  echo "sha256  a5a6aa9c2c2810efa72b5d9723de86ccea3f965b2dd748d15e82d5fac23a055d  linux-4.19.152.tar.xz" >> package/linux-headers/linux-headers.hash && \
  make linux-headers-source
