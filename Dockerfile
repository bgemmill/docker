# A disposable development environment for java, python, and c++

FROM ubuntu:14.04.3
RUN useradd -m docker
RUN apt-get update && apt-get install -y \
      curl wget p7zip-full \
      vim gedit \
      default-jdk \
      python \
      cmake gcc g++
      
# Java IDE
RUN curl -L http://download.jetbrains.com/idea/ideaIC-14.1.4.tar.gz | tar xz
RUN mv idea* /opt/idea

# Python IDE
RUN curl -L http://download.jetbrains.com/python/pycharm-community-4.5.3.tar.gz | tar xz
RUN mv pycharm* /opt/pycharm

# C++ IDE
# why does qtcreator make this harder than necessary?
RUN wget http://download.qt.io/official_releases/qtcreator/3.4/3.4.2/qt-creator-opensource-linux-x86_64-3.4.2.run
RUN mv qt-creator* qt-creator-installer.run
RUN chmod a+x qt-creator-installer.run
RUN ./qt-creator-installer.run --dump-binary-data -o dump
RUN 7z x dump/org.qtproject.qtcreator.application/*qt-creator-installer-archive.7z -o/opt/qtcreator
RUN rm -r dump qt-creator-installer.run
RUN chmod a+xr /opt/qtcreator

# non-root user for running things and x forwarding
USER docker
ENV JAVA_HOME /usr/lib/jvm/default-java # to find the jdk
ENV QT_X11_NO_MITSHM 1 # for qt to work over a shared x socket with the docker host

CMD /opt/idea/bin/idea.sh > /dev/null 2>&1
#CMD /opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#CMD /opt/qtcreator/bin/qtcreator > /dev/null 2>&1

