FROM buildroot_with_dl_cache_build AS build
FROM buildroot
WORKDIR /root/
COPY --from=build /root/buildroot/dl/ /root/buildroot/dl/
