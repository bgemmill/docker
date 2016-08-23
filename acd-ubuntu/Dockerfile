# Amazon Cloud Drive as an encrypted target for rsync

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8

RUN apt-get update && apt-get install -y software-properties-common \
  && add-apt-repository ppa:chazomaticus/minit

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      minit \
      python3 python3-setuptools \
      rsync \
      fuse \
      iproute2 \
      ca-certificates curl git
      # ecryptfs-utils for ecryptfs

RUN easy_install3 -U pip \
  && pip3 install --upgrade git+https://github.com/bgemmill/acd_cli.git \
  && mkdir -p /root/.cache/acd_cli

RUN curl -L https://github.com/rfjakob/gocryptfs/releases/download/v1.0/gocryptfs_v1.0_debian8_amd64.tar.gz | tar xz \
  && mv gocryptfs /usr/local/bin/

EXPOSE 873

COPY rsyncd.conf /root/rsyncd.conf
COPY remount.sh /root/remount.sh

COPY startup /etc/minit/startup
COPY shutdown /etc/minit/shutdown

#RUN apt-get purge -yq software-properties-common ca-certificates curl git \
#  && apt-get autoremove -yq \
#  && apt-get autoclean -yq \
#  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/sbin/minit"]
