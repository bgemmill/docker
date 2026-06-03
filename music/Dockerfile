# Manipulate audio files

FROM project5/base
LABEL org.opencontainers.image.authors="benjamin.gemmill@gmail.com"

# musicbrainz repository from https://launchpad.net/~musicbrainz-developers/+archive/ubuntu/stable
#RUN apt-get update && apt-get install -yq curl gpg lsb-release \
#      && curl "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xec282bb65cd954e72bb863887038b2dac2c64585" | gpg --dearmor -o /etc/apt/keyrings/musicbrainz.gpg \
#      && echo "deb [signed-by=/etc/apt/keyrings/musicbrainz.gpg] https://ppa.launchpadcontent.net/musicbrainz-developers/stable/ubuntu `lsb_release -cs` main" >> /etc/apt/sources.list

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      vim less \
      picard libchromaprint-tools \
      rsgain vorbisgain flac wavpack \
      curl
#rhythmbox rhythmbox-plugin-cdrecorder - ripping CDs

# Bring in our settings
RUN mkdir -p /usr/lib/picard/contrib/plugins
COPY Picard.conf /home/docker/.config/MusicBrainz/Picard.conf 
RUN chmod -R a+rw /home/docker/.config

#QT4 needs a hint to render properly
ENV QT_GRAPHICSSYSTEM="native"
ENV QT_X11_NO_MITSHM=1

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*
