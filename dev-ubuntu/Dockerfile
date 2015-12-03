# A disposable development environment for java, python, and c++

FROM ubuntu:latest
RUN useradd -m docker
RUN apt-get update && apt-get install -y \
      curl \
      vim gedit \
      git ssh rsync \
      default-jdk \
      python \
      cmake gcc g++
      
# Java IDE
RUN curl -L https://download.jetbrains.com/idea/ideaIC-15.0.1.tar.gz | tar xz
RUN mv idea* /opt/idea

# Python IDE
RUN curl -L https://download.jetbrains.com/python/pycharm-community-5.0.1.tar.gz | tar xz
RUN mv pycharm* /opt/pycharm

# C++ IDE
RUN curl -L https://download.jetbrains.com/cpp/clion-1.2.1.tar.gz | tar xz
RUN mv clion* /opt/clion

# non-root user for running things and x forwarding
USER docker
ENV JAVA_HOME /usr/lib/jvm/default-java # to find the jdk
ENV QT_X11_NO_MITSHM 1 # for qt to work over a shared x socket with the docker host

#CMD /opt/idea/bin/idea.sh > /dev/null 2>&1
#CMD /opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#CMD /opt/clion/bin/clion.sh > /dev/null 2>&1
CMD bash
