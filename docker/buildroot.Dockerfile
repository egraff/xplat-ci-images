FROM ubuntu:focal AS base
WORKDIR /root/

RUN \
  apt-get update && \
  apt-get install -y coreutils wget software-properties-common


FROM base AS download_and_untar
WORKDIR /root/

RUN mkdir -p /root/buildroot-dl
COPY external/buildroot/*.gpg /root/buildroot-dl

RUN \
  cd /root/buildroot-dl && \
  wget https://buildroot.org/downloads/buildroot-2020.02.7.tar.gz && \
  wget https://buildroot.org/downloads/buildroot-2020.02.7.tar.gz.sign && \
  gpg --no-default-keyring --trust-model always --keyring ./B025BA8B59C36319.gpg --output ./buildroot-2020.02.7.checksum.txt --decrypt ./buildroot-2020.02.7.tar.gz.sign && \
  cat ./buildroot-2020.02.7.checksum.txt | sed -n -e 's/^SHA1:\W*//p' | sha1sum --check && \
  tar -xvf buildroot-2020.02.7.tar.gz -C /root && \
  cd /root && \
  rm -rf /root/buildroot-dl


FROM base
WORKDIR /root/
COPY --from=download_and_untar /root/buildroot-2020.02.7/ /root/buildroot-2020.02.7/
