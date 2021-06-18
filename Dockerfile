FROM ubuntu:18.04
MAINTAINER Farhan Patwa <farhan.patwa@starlab.io>

ENV DEBIAN_FRONTEND=noninteractive
ENV USER root

# build depends
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential software-properties-common ca-certificates libssl-dev \
        libvirt-dev libvirt-daemon-system automake gcc pkg-config qemu unzip \
        locales python-minimal python3.6-dev python3-pip python3-venv openssh-client git \
        python-minimal python2.7 python libpython-stdlib libpython2.7-stdlib && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN DEBIAN_FRONTEND=noninteractive usermod -aG kvm $(whoami) && \
    locale-gen en_US.utf8 && \
    dpkg-reconfigure locales && \
    python3 -m pip install --upgrade setuptools wheel

WORKDIR /
