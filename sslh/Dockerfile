# Protocol multiplexing in case some ports aren't available

FROM ubuntu:latest
LABEL org.opencontainers.image.authors="benjamin.gemmill@gmail.com"

RUN apt-get update && apt-get install -yq locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

# in case of archive.ubuntu.com outages, switch to constant.com
RUN sed -i -e 's#http://security.ubuntu.com#http://ubuntu.mirror.constant.com#' /etc/apt/sources.list.d/ubuntu.sources
RUN sed -i -e 's#http://archive.ubuntu.com#http://ubuntu.mirror.constant.com#' /etc/apt/sources.list.d/ubuntu.sources

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
  sslh iproute2
      
EXPOSE 443

COPY startup /etc/init/startup

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

CMD ["/etc/init/startup"]
