# Envision the couch potato. Be the couch potato.

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8

RUN apt-get update && apt-get install -y software-properties-common \
      && add-apt-repository universe \       
      && add-apt-repository multiverse \
      && add-apt-repository -y ppa:libretro/stable \
      && add-apt-repository -y ppa:team-xbmc/ppa

RUN apt-get update && apt-get install -y \
      curl \
      vim gedit \
      ssh rsync \
      retroarch libretro-* libcg libcggl \
      kodi \
      && rm -rf /var/lib/apt/lists/*
      
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD bash
