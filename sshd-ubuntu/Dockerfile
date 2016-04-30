# A reasonable terminal environment for any NAS that can run docker

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8

RUN apt-get update && apt-get install -y \
      openssh-server \
      vim \
      rsync \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

ADD authorized_keys /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/* && chown -Rf root:root /root/.ssh

# configure sshd to block authentication via password
RUN sed 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
