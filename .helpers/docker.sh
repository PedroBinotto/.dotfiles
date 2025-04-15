#!/bin/bash

echo '[INFO] Installing Docker...'

mkdir ~/Downloads
cd ~/Downloads

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh 
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

cd ~
