ARG buildimage

FROM ${buildimage} as build
FROM phusion/baseimage:bionic-1.0.0

ARG arch

WORKDIR /root/
CMD ["/sbin/my_init"]

COPY resources/runimage/overlay/ /
COPY resources/runimage/qemu_run_scripts/qemu_run_${arch}.sh /etc/service/qemu/run

RUN chmod 700 /root/.ssh && chmod 644 /root/.ssh/known_hosts && chmod +x /root/run.sh && chmod +x /etc/service/qemu/run
RUN mkdir -m 755 /hostoverlay

COPY --from=build /root/buildroot/output/images/ /opt/xplat-ci-images/${arch}/

RUN \
  apt-get update && \
  apt-get install -y qemu-system && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
