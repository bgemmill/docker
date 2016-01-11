# Run windows programs like a champion

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8
RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y software-properties-common \
      && add-apt-repository -y ppa:ubuntu-wine/ppa

RUN apt-get update && apt-get install -y \
      wine1.8 winetricks

RUN useradd -m docker
USER docker
CMD wine
