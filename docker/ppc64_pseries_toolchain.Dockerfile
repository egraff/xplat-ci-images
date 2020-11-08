FROM ppc64_pseries_toolchain_build AS build
FROM buildroot
WORKDIR /root/
COPY --from=build /root/buildroot-2020.02.7/output/host/ /root/toolchain/ppc64_pseries/
