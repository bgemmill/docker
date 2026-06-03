# A disposable development environment for java, python, and c++

FROM project5/build
LABEL org.opencontainers.image.authors="benjamin.gemmill@gmail.com"

RUN apt-get update && apt-get install -yq \
      sudo \
      vim less bash-completion htop \
      iputils-ping lsof \
      openssh-client rsync curl telnet \
      cmake-curses-gui

# SQL IDE
#RUN curl "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x4a71b51882788fd2" | apt-key add - \
#  && echo "deb http://ppa.launchpad.net/serge-rider/dbeaver-ce/ubuntu $(lsb_release -cs) main" >> /etc/apt/sources.list \
#  && apt-get update && apt-get install -yq dbeaver-ce libswt-gtk-4-jni
#RUN curl -L "https://dbeaver.io/files/dbeaver-ce-latest-linux.gtk.x86_64.tar.gz" | tar xz \
#      && mv dbeaver /opt/dbeaver && chmod a+x /opt/dbeaver/dbeaver \
#      && chmod -R a+w /opt/dbeaver \
#      && apt-get install -yq libswt-gtk-4-jni

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
      && rm vscode.deb
      #&& apt-get install -yq gdb

# clion
#RUN curl -L "https://data.services.jetbrains.com/products/download?platform=linux&code=CL" | tar xz && mv clion* /opt/clion \
#      && chmod -R a+w /opt/clion \
#      && apt-get install -yq libgbm1

# Graphical Git diff
#RUN apt-get install -yq --no-install-recommends gnome-icon-theme meld

# llama.cpp
RUN llama_version=$(curl -ILs -o /dev/null -w %{url_effective} https://github.com/ggml-org/llama.cpp/releases/latest | awk -F/ '{print $NF}') \
  && curl -L https://github.com/ggml-org/llama.cpp/releases/download/${llama_version}/llama-${llama_version}-bin-ubuntu-vulkan-x64.tar.gz | tar xz \
  && mv llama-${llama_version} /opt/llama.cpp \
  && apt-get install -yq libgomp1 libvulkan1

# Start up the IDEs like this once you're in.
#/opt/idea/bin/idea.sh > /dev/null 2>&1
#/opt/pycharm/bin/pycharm.sh > /dev/null 2>&1
#/opt/clion/bin/clion.sh > /dev/null 2>&1
#/opt/dbeaver/dbeaver > /dev/null 2>&1

RUN apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*

