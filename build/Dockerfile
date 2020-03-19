# A disposable build environment for java, python, and c++

FROM project5/base
MAINTAINER benjamin.gemmill@gmail.com

ARG LLVM_VERSION=9

# clang repository from https://apt.llvm.org
# cmake repository from https://apt.kitware.com
# conda repository from https://www.anaconda.com/rpm-and-debian-repositories-for-miniconda
# docker repository from https://docs.docker.com/install/linux/docker-ce/ubuntu
RUN apt-get update && apt-get install -yq \
      software-properties-common curl \
      && curl https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
      && apt-add-repository \
      "deb http://apt.llvm.org/`lsb_release -cs`/ llvm-toolchain-`lsb_release -cs`-${LLVM_VERSION} main" \
      && curl https://apt.kitware.com/keys/kitware-archive-latest.asc | apt-key add - \
      && apt-add-repository \
      "deb https://apt.kitware.com/ubuntu/ `lsb_release -cs` main" \
      && curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | apt-key add - \
      && apt-add-repository "deb https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main"
      #&& curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
      #&& add-apt-repository \
      #"deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

RUN apt-get update && apt-get install -y \
      git \
      #docker-ce \
      default-jdk \
      conda \
      #python python-dev python-pip \
      #python3 python3-dev python3-pip \
      clang-${LLVM_VERSION} \
      lld-${LLVM_VERSION} \
      clang-tidy-${LLVM_VERSION} \
      lldb-${LLVM_VERSION} \
      cmake make ccache \
      flex bison \
      libssl-dev libz-dev libzstd-dev \
      unixodbc-dev odbc-postgresql libsqliteodbc

# Clang
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-${LLVM_VERSION} 1000
ENV CC=clang
ENV CXX=clang++

# Python
RUN /opt/conda/bin/conda update -n base -c defaults conda

# Until ubuntu 18.04.1, we need to fix up java's certificates as per:
# https://stackoverflow.com/questions/6784463/error-trustanchors-parameter-must-be-non-empty
# 1. Save an empty JKS file with the default 'changeit' password for Java cacerts.
# 2. Re-add all the CA certs into the previously empty file.
#RUN /usr/bin/printf '\xfe\xed\xfe\xed\x00\x00\x00\x02\x00\x00\x00\x00\xe2\x68\x6e\x45\xfb\x43\xdf\xa4\xd9\x92\xdd\x41\xce\xb6\xb2\x1c\x63\x30\xd7\x92' > /etc/ssl/certs/java/cacerts \
#  && /var/lib/dpkg/info/ca-certificates-java.postinst configure

# For docker-in-docker, make sure that the inner filesystem is not on top of the outer
#VOLUME ["/var/lib/docker"]

RUN apt-get purge -yq software-properties-common \
  && apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*
