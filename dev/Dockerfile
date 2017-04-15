# A disposable development environment for java, python, and c++

FROM ubuntu:latest
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -y locales && locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LC_ALL='en_US.UTF-8'

RUN apt-get update && apt-get install -y \
      software-properties-common \
      && add-apt-repository ppa:chazomaticus/minit \
      && add-apt-repository ppa:ubuntu-desktop/ubuntu-make \
      && add-apt-repository universe

RUN apt-get update && apt-get install -y \
      minit gosu \
      gksu \
      vim less \
      git ssh rsync curl fuse \
      default-jdk \
      python  python-dev  python-pip \
      python3 python3-dev python3-pip \
      llvm libz-dev \
      cmake g++ g++-multilib \
      ubuntu-make
      
# Python env
RUN pip3 install -U pip setuptools \
  && pip install -U pip setuptools

# Java IDE
RUN echo "/opt/idea" | umake ide idea

# Python IDE
RUN echo "/opt/pycharm" | umake ide pycharm \
      && "/usr/bin/python3.5" "/opt/pycharm/helpers/pydev/setup_cython.py" build_ext --inplace \
      && "/usr/bin/python" "/opt/pycharm/helpers/pydev/setup_cython.py" build_ext --inplace

# C++ IDE
RUN echo "/opt/clion" | umake ide clion

# SQL IDE
RUN curl -L "http://dbeaver.jkiss.org/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz" | tar xz \
  && mv dbeaver /opt/dbeaver && chmod a+x /opt/dbeaver/dbeaver

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
#/opt/dbeaver/dbeaver > /dev/null 2>&1
