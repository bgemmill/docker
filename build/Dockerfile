# A disposable build environment for java, python, and c++

FROM project5/base
MAINTAINER benjamin.gemmill@gmail.com

ARG LLVM_VERSION=17
#ARG MOLD_VERSION=1.11.0

# clang repository from https://apt.llvm.org
# cmake repository from https://apt.kitware.com
# docker repository from https://docs.docker.com/install/linux/docker-ce/ubuntu
RUN apt-get update && apt-get install -yq curl gpg lsb-release \
      && curl https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
      && echo "deb http://apt.llvm.org/`lsb_release -cs`/ llvm-toolchain-`lsb_release -cs`-${LLVM_VERSION} main" >> /etc/apt/sources.list \
      && curl https://apt.kitware.com/keys/kitware-archive-latest.asc | apt-key add - \
      && echo "deb https://apt.kitware.com/ubuntu/ `lsb_release -cs` main" >> /etc/apt/sources.list
      #&& curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
      #&& echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" >> /etc/apt/sources.list

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq \
      git \
      #docker-ce \
      default-jdk \
      #python python-dev python-pip \
      python3 python3-dev python3-pip python3-venv \
      clang-${LLVM_VERSION} \
      lld-${LLVM_VERSION} \
      clangd-${LLVM_VERSION} \
      clang-tidy-${LLVM_VERSION} \
      lldb-${LLVM_VERSION} \
      cmake make ccache \
      pkg-config \
      flex bison \
      libssl-dev libz-dev libzstd-dev \
      unixodbc-dev odbc-postgresql libsqliteodbc

# Clang
RUN true \
  && update-alternatives --install /usr/bin/cc cc /usr/bin/clang-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/ld ld /usr/bin/ld.lld-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/ar ar /usr/bin/llvm-ar-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/ranlib ranlib /usr/bin/llvm-ranlib-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/clang-tidy clang-tidy /usr/bin/clang-tidy-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-${LLVM_VERSION} 1000 \
  && update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-${LLVM_VERSION} 1000

# Ninja
#RUN apt-get install -yq ninja-build
#ENV CMAKE_GENERATOR Ninja

# Python Poetry
ENV POETRY_HOME /opt/poetry
RUN python3 -m venv $POETRY_HOME \
  && $POETRY_HOME/bin/pip install poetry \
  && /opt/poetry/bin/poetry self add poetry-dotenv-plugin
ENV PATH $POETRY_HOME/bin:$PATH

# Mold
#ENV MOLD_HOME /opt/mold
#RUN mkdir -p "${MOLD_HOME}" \
#  && curl -sSL https://github.com/rui314/mold/releases/download/v${MOLD_VERSION}/mold-${MOLD_VERSION}-x86_64-linux.tar.gz > mold.tar.gz \
#  && tar -xzf mold.tar.gz --strip-components=1 -C "${MOLD_HOME}" \
#  && rm mold.tar.gz \
#  && update-alternatives --install /usr/bin/ld ld $MOLD_HOME/bin/mold 1001
#ENV PATH $MOLD_HOME/bin:$PATH

# For docker-in-docker, make sure that the inner filesystem is not on top of the outer
#VOLUME ["/var/lib/docker"]

RUN apt-get autoremove -yq \
  && apt-get autoclean -yq \
  && rm -rf /var/lib/apt/lists/*
