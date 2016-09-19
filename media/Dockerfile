# envision the couch potato; be the couch potato

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8

RUN apt-get update && apt-get install -y software-properties-common \
      && add-apt-repository ppa:chazomaticus/minit \
	  && add-apt-repository universe \       
      && add-apt-repository multiverse \
      && add-apt-repository -y ppa:libretro/stable \
      && add-apt-repository -y ppa:team-xbmc/ppa

RUN apt-get update && apt-get install -y \
	  minit \
      curl \
      vim gedit \
      ssh rsync \
      retroarch libretro-* libcg libcggl \
      kodi

#gosu
RUN wget -O /usr/local/bin/gosu \
  "https://github.com/tianon/gosu/releases/download/1.9/gosu-$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
  && chmod a+x /usr/local/bin/gosu      

COPY startup /etc/minit/startup
COPY shutdown /etc/minit/shutdown

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/sbin/minit"]
