# Manipulate audio files

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

RUN apt-get update && apt-get install -y \
      software-properties-common \
      && add-apt-repository ppa:chazomaticus/minit \
      && add-apt-repository ppa:musicbrainz-developers/stable

RUN apt-get update && apt-get install -y \
      minit gosu \
      gksu \
      curl \
      vim less \
      git ssh rsync \
      picard libchromaprint-tools \
      python-rgain vorbisgain flac wavpack \
      rhythmbox rhythmbox-plugin-cdrecorder
#bs1770gain - mp3gain replacement since python-rgain is not being maintained as of 2017-01-10

RUN mkdir -p /usr/lib/picard/contrib/plugins

COPY Picard.conf /home/docker/.config/MusicBrainz/Picard.conf 
RUN chmod -R a+rw /home/docker/.config

COPY startup /etc/minit/startup
COPY shutdown /etc/minit/shutdown

#RUN apt-get purge -yq software-properties-common \
#  && apt-get autoremove -yq \
#  && apt-get autoclean -yq \
#  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/sbin/minit"]
