# An interactive base image that runs commands as users rather than root

FROM ubuntu:26.04
LABEL org.opencontainers.image.authors="benjamin.gemmill@gmail.com"

# in case of archive.ubuntu.com outages, switch to constant.com
RUN sed -i -e 's#http://security.ubuntu.com#http://ubuntu.mirror.constant.com#' /etc/apt/sources.list.d/ubuntu.sources
RUN sed -i -e 's#http://archive.ubuntu.com#http://ubuntu.mirror.constant.com#' /etc/apt/sources.list.d/ubuntu.sources

#enable amd64v3 - requires the upgrade below
#RUN echo 'APT::Architecture-Variants "amd64v3";' > /etc/apt/apt.conf.d/99-enable-amd64v3

RUN apt-get update #&& apt-get upgrade -yq

# handle utf8
RUN apt-get install -yq locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

# gosu for non-root execution
# dumb-init for signals and zombie process reaping
RUN apt-get install -yq \
  gosu dumb-init

COPY startup /etc/init/startup

RUN apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["dumb-init", "--", "/etc/init/startup"]
