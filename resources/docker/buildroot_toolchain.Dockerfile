ARG buildimage
ARG baseimage

FROM ${buildimage} AS build
FROM ${baseimage}
WORKDIR /root/
COPY --from=build /root/buildroot/output/host/ /root/br2-tree/toolchain
COPY --from=build /root/br2-tree/linux-5.4.config /root/br2-tree/linux-5.4.config
