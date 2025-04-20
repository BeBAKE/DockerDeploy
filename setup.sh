#!/bin/bash

sudo apt update

sudo apt upgrade

sudo apt install curl apt-transport-https ca-certificates software-properties-common

sudo apt install docker.io -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt install docker-ce -y

sudo systemctl start docker

sudo apt install git

git clone https://github.com/BeBAKE/DockerDeploy.git

cd DockerDeploy

chmod +x init.sh
chmod +x restart.sh
chmod +x renew.sh

sudo groupadd docker

sudo gpasswd -a $USER docker

echo "server restart is required"
