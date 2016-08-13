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
      git rsync wget \
      fuse \
      sudo \
      && wget -O - https://www.cryfs.org/install.sh | sudo bash \
      && SUDO_FORCE_REMOVE=yes apt-get purge -yq sudo \
      && rm -rf /var/lib/apt/lists/*
      # ecryptfs-utils instead of cryfs when they finish their file size bug:
      # https://bugs.launchpad.net/ecryptfs/+bug/1612492

RUN easy_install3 -U pip \
  && pip3 install --upgrade git+https://github.com/bgemmill/acd_cli.git \
  && mkdir -p /root/.cache/acd_cli

EXPOSE 873

COPY rsyncd.conf /root/rsyncd.conf
COPY remount.sh /root/remount.sh

COPY startup /etc/minit/startup
COPY shutdown /etc/minit/shutdown
ENTRYPOINT ["/sbin/minit"]
