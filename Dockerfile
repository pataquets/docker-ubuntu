FROM ubuntu:precise

# Use a local APT caching proxy, if available
ADD ./etc/apt/ /etc/apt/

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y install apt-transport-https && \
	apt-get clean

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y upgrade && \
	apt-get clean
