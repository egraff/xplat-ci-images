ARG buildimage
ARG baseimage

FROM ${buildimage} AS build
FROM ${baseimage}
WORKDIR /root/
COPY --from=build /root/buildroot/dl/ /root/buildroot/dl/
