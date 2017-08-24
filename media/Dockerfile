# envision the couch potato; be the couch potato

FROM project5/base
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -y \
      software-properties-common \
      && add-apt-repository -y ppa:libretro/stable \
      && add-apt-repository -y ppa:team-xbmc/ppa

RUN apt-get update && apt-get install -y \
      vim less \
      retroarch libretro-* libcg libcggl \
      kodi

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*
