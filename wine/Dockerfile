# Run windows programs like a champion

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -yq locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

RUN apt-get update && apt-get install -yq curl gpg lsb-release \
      && curl "https://dl.winehq.org/wine-builds/winehq.key" > /usr/share/keyrings/winehq-archive.key \
      && curl "https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources" > /etc/apt/sources.list.d/winehq-$(lsb_release -cs).sources

RUN dpkg --add-architecture i386
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      winehq-stable
      #xvfb

RUN curl https://dl.winehq.org/wine/wine-mono/7.2.0/wine-mono-7.2.0-x86.msi > wine-mono.msi \
  && wine start wine-mono.msi \
  && rm wine-mono.msi

# possibly broken packaging
#RUN curl https://dl.winehq.org/wine/wine-gecko/2.47.2/wine-gecko-2.47.2-x86_64.msi > wine-gecko.msi \
#  && wine start wine-gecko.msi \
#  && rm wine-gecko.msi

# Generate wine settings, waiting for wineserver to finish
#RUN xvfb-run wine "wineboot" && while pgrep -u `whoami` wineserver > /dev/null; do sleep 1; done

# For reference, generate wine settings for 32 bit windows in a custom location
#RUN WINEPREFIX="/root/.wine32" WINEARCH="win32" xvfb-run wine "wineboot"

#CMD wine "/root/.wine/drive_c/Program Files/Internet Explorer/iexplore.exe"

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*
