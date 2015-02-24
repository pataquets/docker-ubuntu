FROM ubuntu:precise

# Use a local APT caching proxy, if available
ADD ./etc/apt/ /etc/apt/

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install apt-transport-https netcat && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      apt-utils \
      bash-completion \
      ssl-cert \
  && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y upgrade && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -v \
    /etc/ssl/certs/ssl-cert-snakeoil.pem \
    /etc/ssl/private/ssl-cert-snakeoil.key
