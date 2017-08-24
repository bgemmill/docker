# Manipulate audio files

FROM project5/base
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -y \
      software-properties-common \
      && add-apt-repository ppa:musicbrainz-developers/stable

RUN apt-get update && apt-get install -y \
      gksu \
      vim less \
      picard libchromaprint-tools \
      python-rgain vorbisgain flac wavpack \
      rhythmbox rhythmbox-plugin-cdrecorder
#bs1770gain - mp3gain replacement since python-rgain is not being maintained as of 2017-01-10

RUN mkdir -p /usr/lib/picard/contrib/plugins

COPY Picard.conf /home/docker/.config/MusicBrainz/Picard.conf 
RUN chmod -R a+rw /home/docker/.config

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*
