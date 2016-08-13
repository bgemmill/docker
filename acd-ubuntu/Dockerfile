# Amazon Cloud Drive as an encrypted target for rsync

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8

RUN apt-get update && apt-get install -y software-properties-common \
  && add-apt-repository ppa:chazomaticus/minit

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      minit \
      python3 python3-setuptools \
      ca-certificates \
      git rsync \
      fuse ecryptfs-utils \
      && rm -rf /var/lib/apt/lists/*

RUN easy_install3 -U pip \
  && pip3 install --upgrade git+https://github.com/bgemmill/acd_cli.git \
  && mkdir -p /root/.cache/acd_cli

EXPOSE 873

COPY rsyncd.conf /root/rsyncd.conf
COPY remount.sh /root/remount.sh

COPY startup /etc/minit/startup
COPY shutdown /etc/minit/shutdown
ENTRYPOINT ["/sbin/minit"]
