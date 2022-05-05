# A disposable development environment for java, python, and c++

FROM project5/build
MAINTAINER benjamin.gemmill@gmail.com

# x-swat from https://launchpad.net/~ubuntu-x-swat/+archive/ubuntu/updates
# conda repository from https://www.anaconda.com/rpm-and-debian-repositories-for-miniconda
#RUN apt-get update && apt-get install -yq curl gpg lsb-release \
      #&& curl "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x643dc6bd56580ceb1ab4a9f63b22ab97af1cdfa9" | apt-key add - \
      #&& echo "deb http://ppa.launchpad.net/ubuntu-x-swat/updates/ubuntu $(lsb_release -cs) main" >> /etc/apt/sources.list \
      #&& apt-get update && apt-get upgrade -y
      #&& curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | apt-key add - \
      #&& echo "deb https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -yq \
      sudo \
      vim less bash-completion htop \
      iputils-ping lsof \
      openssh-client rsync curl netcat telnet \
      cmake-curses-gui

# Python
#RUN /opt/conda/bin/conda update -n base -c defaults conda

# SQL IDE
#RUN curl "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x4a71b51882788fd2" | apt-key add - \
#  && echo "deb http://ppa.launchpad.net/serge-rider/dbeaver-ce/ubuntu $(lsb_release -cs) main" >> /etc/apt/sources.list \
#  && apt-get update && apt-get install -yq dbeaver-ce libswt-gtk-4-jni
RUN curl -L "http://dbeaver.jkiss.org/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz" | tar xz \
      && mv dbeaver /opt/dbeaver && chmod a+x /opt/dbeaver/dbeaver \
      && chmod -R a+w /opt/dbeaver \
      && apt-get install -yq libswt-gtk-4-jni

# Python IDE
#RUN curl -L "https://data.services.jetbrains.com/products/download?platform=linux&code=PCC" | tar xz && mv pycharm* /opt/pycharm \
#      && chmod -R a+w /opt/pycharm \
#      && apt-get install -yq libgbm1

# Java IDE
#platform=linuxWithoutJDK uses the system jdk for idea itself
#RUN curl -L "https://data.services.jetbrains.com/products/download?platform=linux&code=IIC" | tar xz && mv idea* /opt/idea \
#      && chmod -R a+w /opt/idea \
#      && apt-get install -yq libgbm1

# C++ IDE
# qtcreator
# the libraries here satisfy: ldd /opt/qtcreator/lib/Qt/plugins/platforms/libqxcb.so
#RUN apt-get install -yq p7zip \
#      libxkbcommon-x11-0 \
#      `apt list libxcb-* | cut -d '/' -f 1 | grep -v '\-doc$\|\-dev$' | grep libxcb-` \
#      && curl -LSs -o qtcreator.7z https://download.qt.io/online/qtsdkrepository/linux_x64/desktop/tools_qtcreator/qt.tools.qtcreator/`curl -LSs https://download.qt.io/online/qtsdkrepository/linux_x64/desktop/tools_qtcreator/Updates.xml | grep -oPm1 "(?<=<Version>)[^<]+"`qtcreator.7z \
#      && 7zr x *qtcreator.7z \
#      && mv Tools/QtCreator /opt/qtcreator \
#      && rm -r qtcreator.7z Tools \
#      && apt-get -yq purge p7zip

# vscode
RUN curl -o vscode.deb -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" \
      && dpkg -i vscode.deb \
      ; apt-get -f -yq install \
      && rm vscode.deb \
      && apt-get install -yq gdb

# clion
#RUN curl -L "https://data.services.jetbrains.com/products/download?platform=linux&code=CL" | tar xz && mv clion* /opt/clion \
#      && chmod -R a+w /opt/clion \
#      && apt-get install -yq libgbm1

# Graphical Git diff
#RUN apt-get install -yq --no-install-recommends gnome-icon-theme meld


# Start up the IDEs like this once you're in.
#/opt/idea/bin/idea.sh > /dev/null 2>&1
#/opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#/opt/clion/bin/clion.sh > /dev/null 2>&1
#/opt/dbeaver/dbeaver > /dev/null 2>&1

RUN apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

