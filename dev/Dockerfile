# A disposable development environment for java, python, and c++

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

RUN apt-get update && apt-get install -y \
      software-properties-common \
      && add-apt-repository ppa:chazomaticus/minit \
      && add-apt-repository universe

RUN apt-get update && apt-get install -y \
      minit gosu \
      gksu \
      curl \
      vim less \
      git ssh rsync \
      default-jdk \
      python  python-dev  python-pip \
      python3 python3-dev python3-pip \
      cmake g++ g++-multilib
      
# Python env
RUN pip3 install -U pip setuptools \
  && pip install -U pip setuptools

# Java IDE
RUN curl -L https://download.jetbrains.com/idea/ideaIC-2016.3.1-no-jdk.tar.gz | tar xz && mv idea* /opt/idea

# Python IDE
RUN curl -L https://download.jetbrains.com/python/pycharm-community-2016.3.1.tar.gz | tar xz && mv pycharm* /opt/pycharm \
      && "/usr/bin/python3.5" "/opt/pycharm/helpers/pydev/setup_cython.py" build_ext --inplace \
      && "/usr/bin/python" "/opt/pycharm/helpers/pydev/setup_cython.py" build_ext --inplace

# C++ IDE
RUN curl -L https://download.jetbrains.com/cpp/CLion-2016.3.1.tar.gz | tar xz && mv clion* /opt/clion

ENV JAVA_HOME /usr/lib/jvm/default-java # to find the jdk
ENV QT_X11_NO_MITSHM 1 # for qt to work over a shared x socket with the docker host

COPY startup /etc/minit/startup
COPY shutdown /etc/minit/shutdown

#RUN apt-get purge -yq software-properties-common \
#  && apt-get autoremove -yq \
#  && apt-get autoclean -yq \
#  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/sbin/minit"]

# Start up the IDEs like this once you're in.
#/opt/idea/bin/idea.sh > /dev/null 2>&1
#/opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#/opt/clion/bin/clion.sh > /dev/null 2>&1
