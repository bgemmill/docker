# An interactive base image that runs commands as users rather than root

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update

# handle utf8
RUN apt-get install -y locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

# universe and multiverse
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list

# gosu for non-root execution
RUN apt-get install -y \
  gosu

# tini for signals and zombie process reaping
ARG TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/local/bin/tini
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /usr/local/bin/tini.asc
#RUN gpg --batch --keyserver keyserver.ubuntu.com --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
#  && gpg --batch --verify /usr/local/bin/tini.asc /usr/local/bin/tini \ 
#  && rm -rf /root/.gnupg /usr/local/bin/tini.asc \ 
#  && chmod +x /usr/local/bin/tini
RUN chmod a+x /usr/local/bin/tini

COPY startup /etc/init/startup

RUN apt-get purge -yq gpg \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/tini", "--", "/etc/init/startup"]
