# A disposable development environment for java, python, and c++

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8

RUN apt-get update && apt-get install -y \
      gksu \
      curl \
      vim gedit \
      git ssh rsync \
      default-jdk \
      python  python-dev  python-setuptools \
      python3 python3-dev python3-setuptools \
      cmake g++ g++-multilib \
      && rm -rf /var/lib/apt/lists/*
      
# Java IDE
RUN curl -L https://download.jetbrains.com/idea/ideaIC-2016.2.tar.gz | tar xz && mv idea* /opt/idea

# Python IDE
RUN curl -L https://download.jetbrains.com/python/pycharm-community-2016.2.tar.gz | tar xz && mv pycharm* /opt/pycharm

# C++ IDE
RUN curl -L https://download.jetbrains.com/cpp/CLion-2016.2.tar.gz | tar xz && mv clion* /opt/clion

ENV JAVA_HOME /usr/lib/jvm/default-java # to find the jdk
ENV QT_X11_NO_MITSHM 1 # for qt to work over a shared x socket with the docker host

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Start up the IDEs like this once you're in.
#/opt/idea/bin/idea.sh > /dev/null 2>&1
#/opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#/opt/clion/bin/clion.sh > /dev/null 2>&1
CMD bash
