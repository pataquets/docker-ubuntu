FROM ubuntu:focal

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install apt-transport-https && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      netcat-traditional \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Use a local APT caching proxy, if available
ADD ./etc/apt/ /etc/apt/

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y upgrade \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      bash-completion \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      ssl-cert \
  && \
  cat /etc/bash_completion | tee /etc/bash.bashrc && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* \
  && \
  rm -v \
    /etc/ssl/certs/ssl-cert-snakeoil.pem \
    /etc/ssl/private/ssl-cert-snakeoil.key \
  && \
  find -P /etc/ssl/ -xtype l -delete -print \
  && \
  mkdir -vp /var/log/symlinks/dev/ && \
  mkdir -vp /var/log/symlinks/proc/self/fd && \
  ln -vs /dev/stdout /var/log/symlinks/dev/stdout && \
  ln -vs /dev/stderr /var/log/symlinks/dev/stderr && \
  ln -vs /proc/self/fd/1 /var/log/symlinks/proc/self/fd/1 && \
  ln -vs /proc/self/fd/2 /var/log/symlinks/proc/self/fd/2
