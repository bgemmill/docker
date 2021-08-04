# Run windows programs like a champion

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -y locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

RUN apt-get update && apt-get install -yq curl gpg lsb-release \
      #&& curl "https://dl.winehq.org/wine-builds/Release.key" | apt-key add - \
      && curl "https://dl.winehq.org/wine-builds/winehq.key" | apt-key add - \
      && echo "deb https://dl.winehq.org/wine-builds/ubuntu $(lsb_release -cs) main" >> /etc/apt/sources.list 

# versions for wine things here: https://launchpad.net/~ubuntu-wine/+archive/ubuntu/ppa
RUN dpkg --add-architecture i386
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      winehq-stable
      #xvfb

RUN curl https://dl.winehq.org/wine/wine-mono/6.3.0/wine-mono-6.3.0-x86.msi > wine-mono.msi \
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
