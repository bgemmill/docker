# Manipulate audio files

FROM project5/base
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -y \
      software-properties-common \
      && add-apt-repository ppa:musicbrainz-developers/stable

RUN apt-get update && apt-get install -y \
      vim less \
      picard libchromaprint-tools \
      python-rgain vorbisgain flac wavpack
#rhythmbox rhythmbox-plugin-cdrecorder - ripping CDs
#bs1770gain - mp3gain replacement but takes different commands
#mp3gain - abandonware
#python-rgain - abandonware as of 2017-01-10 but still works on command line

# Bring in our settings
RUN mkdir -p /usr/lib/picard/contrib/plugins
COPY Picard.conf /home/docker/.config/MusicBrainz/Picard.conf 
RUN chmod -R a+rw /home/docker/.config

#QT4 needs a hint to render properly
ENV QT_GRAPHICSSYSTEM "native"
ENV QT_X11_NO_MITSHM=1

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*
