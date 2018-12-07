# Run docker inside docker to simulate a cluster on one machine
# run with --privileged

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update \
  && apt-get install -yq curl software-properties-common \
  && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
  && add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN apt-get update

# handle utf8
RUN apt-get install -yq locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

# universe and multiverse
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list

# dumb-init for signals and zombie process reaping
RUN apt-get install -yq \
  dumb-init docker-ce

VOLUME ["/var/lib/docker"]
#EXPOSE 2375

RUN apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["dumb-init"]
CMD ["dockerd"]
#CMD ["dockerd", "--host=unix:///var/run/docker.sock", "--host=tcp://0.0.0.0:2375"]
