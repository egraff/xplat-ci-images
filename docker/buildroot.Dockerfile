FROM ubuntu:focal AS base
WORKDIR /root/

RUN \
  apt-get update && \
  apt-get install -y coreutils wget software-properties-common && \
  apt-get install -y libc6-dev-i386 build-essential g++ && \
  apt-get install -y cpio unzip rsync bc openssh-client

RUN mkdir -p /root/buildroot-dl
COPY external/buildroot/*.gpg /root/buildroot-dl

RUN \
  cd /root/buildroot-dl && \
  wget https://buildroot.org/downloads/buildroot-2020.02.7.tar.gz && \
  wget https://buildroot.org/downloads/buildroot-2020.02.7.tar.gz.sign && \
  gpg --no-default-keyring --trust-model always --keyring ./B025BA8B59C36319.gpg --output ./buildroot-2020.02.7.checksum.txt --decrypt ./buildroot-2020.02.7.tar.gz.sign && \
  cat ./buildroot-2020.02.7.checksum.txt | sed -n -e 's/^SHA1:\W*//p' | sha1sum --check && \
  tar -xzf buildroot-2020.02.7.tar.gz -C /root && \
  cd /root && \
  mv buildroot-2020.02.7 buildroot && \
  rm -rf /root/buildroot-dl
