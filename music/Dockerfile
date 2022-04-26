# Manipulate audio files

FROM project5/base
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -yq \
      software-properties-common \
      && add-apt-repository ppa:musicbrainz-developers/stable

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      vim less \
      picard libchromaprint-tools \
      vorbisgain flac wavpack \
      python3 python3-pip python3-cairo
RUN python3 -m pip install rgain3
#rhythmbox rhythmbox-plugin-cdrecorder - ripping CDs
#bs1770gain - mp3gain replacement but takes different commands
#mp3gain - abandonware
#python-rgain - abandonware

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
