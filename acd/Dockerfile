# Amazon Cloud Drive as an encrypted borg backup target for diskstations

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8

RUN apt-get update && apt-get install -y \
  vim less \
  python3 python3-pip \
  fuse \
  ca-certificates curl git

RUN pip3 install -U pip setuptools \
  && pip3 install --upgrade git+https://github.com/bgemmill/acd_cli.git \
  && mkdir -p /root/.cache/acd_cli

RUN curl -L https://github.com/borgbackup/borg/releases/download/1.0.8/borg-linux64 > /usr/bin/borg \
  && chmod a+x /usr/bin/borg

COPY startup /usr/bin/startup
COPY backup /usr/bin/backup
COPY inspect /usr/bin/inspect

RUN apt-get purge -yq software-properties-common ca-certificates curl git \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/bin/startup"]
CMD bash
