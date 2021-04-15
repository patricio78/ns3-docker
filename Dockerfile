FROM ubuntu:20.04

MAINTAINER Patricio Barletta <patricio78@gmail.com>

LABEL Description="Docker image for NS-3 Network Simulator"
ENV VERSION=3.33
ENV DEBIAN_FRONTEND=noninteractive

# Needed packages
RUN apt update && \
  apt-get install -y \
  git \
  mercurial \
  gcc \
  g++ \
  vim \
  python \
  python-dev \
  python-setuptools \
  qt5-default \
  python3-pygraphviz \
  autoconf \
  cvs \
  bzr \
  unrar \
  gdb \
  valgrind \
  uncrustify \
  flex \
  bison \
  libfl-dev \
  tcpdump \
  gsl-bin \
  libgsl23 \
  libgsl-dev \
  sqlite \
  sqlite3 \
  libsqlite3-dev \
  libxml2 \
  libxml2-dev \
  cmake \
  libc6-dev \
  libc6-dev-i386 \
  libclang-dev \
  llvm-dev \
  automake \
  libgtk2.0-0 \
  libgtk2.0-dev \
  vtun \
  lxc \
  libboost1.67-dev \
  libboost-signals1.67-dev \
  libboost-filesystem1.67-dev \
  python3-pip \
  gir1.2-goocanvas-2.0 \
  python3-gi \
  python3-gi-cairo \
  gir1.2-gtk-3.0 \
  wget \
  gnuplot \
  && \
  pip3 install ipython && \
  pip3 install kiwi && \
  pip3 install numpy && \
  pip3 install matplotlib && \
  apt-get clean && \
  rm -rf /var/lib/apt

# NS-3
# Create working directory
RUN mkdir -p /app/ns3
RUN chown 2020 /app
WORKDIR /app

USER 2020

RUN wget http://www.nsnam.org/release/ns-allinone-${VERSION}.tar.bz2
RUN tar -xf ns-allinone-${VERSION}.tar.bz2

# Configure and compile NS-3
RUN cd ns-allinone-${VERSION} && ./build.py --enable-examples --enable-tests
