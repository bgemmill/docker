# Minecraft

FROM project5/base
LABEL org.opencontainers.image.authors="benjamin.gemmill@gmail.com"

#RUN apt-get update && apt-get install -yq \
#      software-properties-common \
#      && add-apt-repository ppa:musicbrainz-developers/stable

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      libopengl0 \
      curl

RUN curl -o minecraft.deb -L "https://launcher.mojang.com/download/Minecraft.deb" \
      && dpkg -i minecraft.deb \
      ; apt-get -f -yq install \
      && rm minecraft.deb

#ENTRYPOINT ["minecraft-launcher"]

RUN apt-get purge -yq curl \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*
