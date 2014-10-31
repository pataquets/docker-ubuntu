FROM ubuntu:trusty

# Use a local APT caching proxy, if available
ADD ./etc/apt/ /etc/apt/

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	apt-get -y install apt-transport-https && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	apt-get -y install bash-completion && \
	apt-get -y upgrade && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*
