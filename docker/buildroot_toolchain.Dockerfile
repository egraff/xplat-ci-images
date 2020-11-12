FROM buildroot_toolchain_build AS build
FROM buildroot
WORKDIR /root/
COPY --from=build /root/buildroot/output/host/ /root/br2-tree/toolchain
