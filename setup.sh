#!/usr/bin/env bash
:'
This is the explaination for what each command is doing .

# Make sure you have up‑to‑date package lists
sudo apt update -y # refresh APT’s package index
sudo apt upgrade

# Install the tools needed to add Docker’s repo and verify its packages
sudo apt install -y \
  ca-certificates \  # trusted CAs for HTTPS
  curl \   # download files from the web
  gnupg \   # decrypt/verify GPG keys
  lsb-release   #  Ubuntu codename (e.g. “focal”)

# Fetch Docker’s official GPG key and store it in a keyring
sudo mkdir -p /etc/apt/keyrings   # ensure the directory exists
curl -fsSL https://download.docker.com/linux/ubuntu/gpg  \
  | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg # convert to binary keyring

# Add the Docker APT repository to your sources list
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null  # point APT at Docker’s repo

# Refresh again so APT knows about Docker’s packages
sudo apt update -y  # re‑index with the new repo

# Install the latest Docker Engine + CLI from Docker’s repo
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin  

# Enable Docker to start on boot **and** start it right now
sudo systemctl enable --now docker  # one command to enable + start

# Install git 
sudo apt install git

# Clone the git repo
git clone https://github.com/BeBAKE/DockerDeploy.git

cd DockerDeploy

chmod +x init.sh
chmod +x restart.sh
chmod +x renew.sh

# Add your user to the “docker” group so you can run ‘docker’ without sudo
sudo groupadd docker || true  # create the group if it’s missing
sudo usermod -aG docker $USER  # append your user to that group

# Activate the new group immediately in this shell
newgrp docker # so you don’t have to log out/log in

# the exit in the last is because the newgrp creates a new shell environment so we need to exit it
exit
'

# copy paste the following set of commands in the EC2 server

sudo apt update -y
sudo apt upgrade -y
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker
sudo apt install git
git clone https://github.com/BeBAKE/DockerDeploy.git
cd DockerDeploy
chmod +x init.sh
chmod +x restart.sh
chmod +x renew.sh
sudo groupadd docker || true
sudo usermod -aG docker $USER
newgrp docker
exit
