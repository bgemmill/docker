FROM ubuntu:18.04
MAINTAINER Ben Gemmill <benjamin.gemmill@gmail.com>

# AWSCLI, JDK, and thrift
RUN apt-get update -qy && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    python-pip groff-base \
    default-jdk \
    nodejs npm \
    bzip2 unzip xz-utils curl git \
    thrift-compiler \
    && \
    pip install awscli && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# JDK
ENV JAVA_HOME /usr/lib/jvm/default-java

# Until ubuntu 18.04.1, we need to fix up java's certificates as per:
# https://stackoverflow.com/questions/6784463/error-trustanchors-parameter-must-be-non-empty
# 1. Save an empty JKS file with the default 'changeit' password for Java cacerts.
# 2. Re-add all the CA certs into the previously empty file.
RUN /usr/bin/printf '\xfe\xed\xfe\xed\x00\x00\x00\x02\x00\x00\x00\x00\xe2\x68\x6e\x45\xfb\x43\xdf\xa4\xd9\x92\xdd\x41\xce\xb6\xb2\x1c\x63\x30\xd7\x92' > /etc/ssl/certs/java/cacerts \
  && /var/lib/dpkg/info/ca-certificates-java.postinst configure

# Docker client
RUN curl -sSL https://get.docker.com/ | sh

# Tini
ADD https://github.com/krallin/tini/releases/download/v0.18.0/tini /tini
RUN chmod +x /tini

# Make sure that unicode works if it ends up on the terminal
RUN apt-get update && apt-get install -yq locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

# Jenkins
ENV HOME /home/jenkins
RUN useradd -c "Jenkins user" -d $HOME -u 10000 -g 999 -m jenkins
LABEL Description="This is a base image, which provides the Jenkins agent executable (slave.jar) and docker client" Vendor="KoreKontrol" Version="3.7"

ARG VERSION=3.7

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

USER jenkins
RUN mkdir /home/jenkins/.jenkins
VOLUME /home/jenkins/.jenkins
WORKDIR /home/jenkins

# jnlp slave
COPY jenkins-slave /usr/local/bin/jenkins-slave
ENTRYPOINT ["/tini", "--", "jenkins-slave"]
