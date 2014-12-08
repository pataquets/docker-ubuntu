FROM ubuntu:trusty

# Use a local APT caching proxy, if available
ADD ./etc/apt/ /etc/apt/

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install apt-transport-https && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install bash-completion && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y upgrade && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
