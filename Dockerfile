FROM ubuntu:20.04
ENV TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en

RUN apt update && \
    ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone && \
    apt install -y autoconf libtool  build-essential && \
    apt install -y cmake gdb openssh-server && \
    apt install -y ccache cgdb vim wget dos2unix libpthread-stubs0-dev zlib1g zlib1g-dev && \
    apt install -y git clangd-12 && \
    update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100 && \
    apt install -y ninja-build libunwind-dev libboost-fiber-dev libssl-dev && \
    apt install -y autoconf-archive libtool cmake g++ libzstd-dev bison libxml2-dev

RUN git clone --recursive https://github.com/dragonflydb/dragonfly && \
    cd dragonfly && \
    ./helio/blaze.sh -release && \
    cd build-opt && ninja dragonfly





