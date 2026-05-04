# A reasonable terminal environment for any NAS that can run docker

FROM ubuntu:latest
LABEL org.opencontainers.image.authors="benjamin.gemmill@gmail.com"

# in case of archive.ubuntu.com outages, switch to constant.com
RUN sed -i -e 's#http://security.ubuntu.com#http://ubuntu.mirror.constant.com#' /etc/apt/sources.list.d/ubuntu.sources
RUN sed -i -e 's#http://archive.ubuntu.com#http://ubuntu.mirror.constant.com#' /etc/apt/sources.list.d/ubuntu.sources

RUN apt-get update && apt-get install -yq locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

RUN apt-get update && apt-get install -yq \
  openssh-server \
  vim less iputils-ping \
  rsync

RUN mkdir /var/run/sshd

ADD authorized_keys /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/* && chown -Rf root:root /root/.ssh

# configure sshd to block authentication via password
RUN sed 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

EXPOSE 22

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

CMD ["/usr/sbin/sshd", "-D"]
