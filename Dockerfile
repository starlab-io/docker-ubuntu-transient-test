FROM ubuntu:20.04
MAINTAINER Farhan Patwa <farhan.patwa@starlab.io>

ENV DEBIAN_FRONTEND=noninteractive
ENV USER root

# build depends. Please keep the package list sorted
RUN apt-get update && \
    apt-get --quiet --yes install --no-install-recommends \
        automake \
        build-essential \
        ca-certificates \
        gcc \
        git \
        libpython2.7-stdlib \
        libpython2.7-minimal \
        libvirt-daemon-system \
        locales \
        openssh-client \
        pkg-config \
        python \
        python2.7 \
        python3-dev \
        python3-pip \
        python3-venv \
        qemu-kvm \
        qemu-system-x86 \
        qemu-utils \
        software-properties-common \
        unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.utf8 && \
    dpkg-reconfigure locales && \
    python3 -m pip install --upgrade setuptools wheel && \
    usermod -aG kvm $(whoami)

WORKDIR /
