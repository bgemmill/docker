# A disposable development environment for java, python, and c++

FROM project5/build
MAINTAINER benjamin.gemmill@gmail.com

RUN apt-get update && apt-get install -y \
      sudo \
      software-properties-common \
      vim less bash-completion \
      iputils-ping lsof \
      openssh-client rsync curl netcat

# SQL IDE
RUN add-apt-repository ppa:serge-rider/dbeaver-ce \
  && apt-get update \
  && apt-get install -yq dbeaver-ce libswt-gtk-4-jni
#RUN curl -L "http://dbeaver.jkiss.org/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz" | tar xz \
#      && mv dbeaver /opt/dbeaver && chmod a+x /opt/dbeaver/dbeaver \
#      && chmod -R a+w /opt/dbeaver

# C++ IDE
RUN curl -L "https://data.services.jetbrains.com/products/download?platform=linux&code=CL" | tar xz && mv clion* /opt/clion \
      && chmod -R a+w /opt/clion

# Python IDE
RUN curl -L "https://data.services.jetbrains.com/products/download?platform=linux&code=PCC" | tar xz && mv pycharm* /opt/pycharm \
      && chmod -R a+w /opt/pycharm

# Java IDE
#platform=linuxWithoutJDK uses the system jdk for idea itself
RUN curl -L "https://data.services.jetbrains.com/products/download?platform=linux&code=IIC" | tar xz && mv idea* /opt/idea \
      && chmod -R a+w /opt/idea

# qtcreator
# from: https://download.qt.io/online/qtsdkrepository/linux_x64/desktop/tools_qtcreator/qt.tools.qtcreator/
#RUN apt-get install -yq p7zip \
#      && curl -LSs -o qtcreator.7z https://download.qt.io/online/qtsdkrepository/linux_x64/desktop/tools_qtcreator/qt.tools.qtcreator/`curl -LSs https://download.qt.io/online/qtsdkrepository/linux_x64/desktop/tools_qtcreator/Updates.xml | grep -oPm1 "(?<=<Version>)[^<]+"`qtcreator.7z \
#      && 7zr x *qtcreator.7z \
#      && mv Tools/QtCreator /opt/ \
#      && rm -r qtcreator.7z Tools \
#      && apt-get -yq purge p7zip

# JDK
#ENV JAVA_HOME /usr/lib/jvm/default-java
#ENV PYCHARM_JDK=/usr/lib/jvm/default-java
#ENV IDEA_JDK=/usr/lib/jvm/default-java
#ENV CL_JDK=/usr/lib/jvm/default-java

# Start up the IDEs like this once you're in.
#/opt/idea/bin/idea.sh > /dev/null 2>&1
#/opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#/opt/clion/bin/clion.sh > /dev/null 2>&1
#/opt/dbeaver/dbeaver > /dev/null 2>&1

RUN apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

