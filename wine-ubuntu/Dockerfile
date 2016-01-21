# Run windows programs like a champion

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8
RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y software-properties-common \
      && add-apt-repository -y ppa:ubuntu-wine/ppa

# wine and wine-mono: https://launchpad.net/~ubuntu-wine/+archive/ubuntu/ppa
RUN apt-get update && apt-get install -y \
      wine1.8 \
      wine-mono4.5.6 \
      wine-gecko2.40 \
      xvfb
      
# wine-gecko x68 from here: http://wiki.winehq.org/Gecko
# Note this is only because the published wine-gecko2.40 package only provides the x64 binaries
RUN wget http://dl.winehq.org/wine/wine-gecko/2.40//wine_gecko-2.40-x86.msi
RUN mv wine_gecko-2.40-x86.msi /usr/share/wine/gecko/ 

RUN useradd -m docker
USER docker

# Generate wine settings
RUN xvfb-run wine "wineboot"

# For reference, generate wine settings for 32 bit windows in a custom location
#RUN WINEPREFIX="/home/$(whoami)/.wine32" WINEARCH="win32" xvfb-run wine "wineboot"

CMD wine
#CMD wine "./.wine/drive_c/Program Files/Internet Explorer/iexplore.exe"
