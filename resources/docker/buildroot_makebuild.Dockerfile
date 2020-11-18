ARG baseimage

FROM ${baseimage}
ARG make_target=

COPY .br2-tree/ /root/br2-tree/

RUN \
  cd /root/buildroot && \
  make BR2_EXTERNAL=/root/br2-tree config_defconfig && \
  FORCE_UNSAFE_CONFIGURE=1 make ${make_target}
