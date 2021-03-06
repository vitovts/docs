#!/usr/bin/env bash
apt update && \
#apt-get install dialog -y && \
# install curl
apt install -y curl  
#dialog --title "YES NO" --msgbox "\n YES" YES && \
apt install apt-transport-https ca-certificates gnupg2 gnupg-agent software-properties-common -y && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
apt-key fingerprint 0EBFCD88 && \
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable" && \
apt update && \
apt upgrade -y && \
apt install docker-ce docker-ce-cli containerd.io -y && \
# run and delete
docker run --rm hello-world
docker ps -a
# delete all images
docker image rm -f  $(docker image ls -aq)
docker images

