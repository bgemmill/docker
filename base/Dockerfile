# An interactive base image that runs commands as users rather than root

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update

# handle utf8
RUN apt-get install -yq locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

# universe and multiverse
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list

# gosu for non-root execution
# dumb-init for signals and zombie process reaping
RUN apt-get install -yq \
  gosu dumb-init

COPY startup /etc/init/startup

RUN apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["dumb-init", "--", "/etc/init/startup"]
