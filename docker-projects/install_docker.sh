#!/bin/bash

# installing docker CE

if [[ $(id -u) -ne 0 ]];then

echo "Run script as root"

fi

echo "Installing docker"

apt-get update

apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"


apt-get update

echo "installing Docker ce"
apt-get install docker-ce docker-ce-cli containerd.io -y

usermod -aG docker $USER
chmod 666 /var/run/docker.sock


echo "Docker in installed"

###### Installing Docker compose ######

echo "Installing docker Compose"

curl -L https://github.com/docker/compose/releases/download/1.24.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Done EXIT"
