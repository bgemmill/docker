# envision the couch potato; be the couch potato

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

RUN apt-get update && apt-get install -y \
      software-properties-common \
      && add-apt-repository ppa:chazomaticus/minit \
      && add-apt-repository universe \       
      && add-apt-repository multiverse \
      && add-apt-repository -y ppa:libretro/stable \
      && add-apt-repository -y ppa:team-xbmc/ppa

RUN apt-get update && apt-get install -y \
      minit gosu \
      curl \
      vim less \
      ssh rsync \
      retroarch libretro-* libcg libcggl \
      kodi

COPY startup /etc/minit/startup
COPY shutdown /etc/minit/shutdown

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/sbin/minit"]
