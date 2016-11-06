# A reasonable terminal environment for any NAS that can run docker

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8

RUN apt-get update && apt-get install -y \
  software-properties-common \
  && add-apt-repository ppa:chazomaticus/minit

RUN apt-get update && apt-get install -y \
  minit \
  openssh-server \
  vim less \
  rsync

RUN mkdir /var/run/sshd

ADD authorized_keys /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/* && chown -Rf root:root /root/.ssh

# configure sshd to block authentication via password
RUN sed 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

EXPOSE 22

COPY startup /etc/minit/startup
COPY shutdown /etc/minit/shutdown

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/sbin/minit"]