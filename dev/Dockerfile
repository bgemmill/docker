# A disposable development environment for java, python, and c++

FROM project5/base
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -y \
      software-properties-common \
      && add-apt-repository ppa:ubuntu-desktop/ubuntu-make

RUN apt-get update && apt-get install -y \
      sudo gksu \
      vim less bash-completion \
      iputils-ping lsof \
      git openssh-client rsync curl \
      default-jdk \
      python  python-dev  python-pip \
      python3 python3-dev python3-pip \
      llvm libz-dev \
      cmake g++ g++-multilib gdb \
      ubuntu-make
      
# Git
RUN git config --global credential.helper "cache --timeout=3600" \
      && git config --global push.default simple \
      && git config --global core.editor "vim"

# Java IDE
RUN echo "/opt/idea" | umake ide idea

# Python IDE
RUN echo "/opt/pycharm" | umake ide pycharm \
      && "/usr/bin/python3" "/opt/pycharm/helpers/pydev/setup_cython.py" build_ext --inplace \
      && "/usr/bin/python" "/opt/pycharm/helpers/pydev/setup_cython.py" build_ext --inplace

# C++ IDE
RUN echo "/opt/clion" | umake ide clion

# SQL IDE
RUN curl -L "http://dbeaver.jkiss.org/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz" | tar xz \
  && mv dbeaver /opt/dbeaver && chmod a+x /opt/dbeaver/dbeaver

ENV JAVA_HOME /usr/lib/jvm/default-java # to find the jdk
#ENV QT_X11_NO_MITSHM 1 # for qt to work over a shared x socket with the docker host

# Start up the IDEs like this once you're in.
#/opt/idea/bin/idea.sh > /dev/null 2>&1
#/opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#/opt/clion/bin/clion.sh > /dev/null 2>&1
#/opt/dbeaver/dbeaver > /dev/null 2>&1
