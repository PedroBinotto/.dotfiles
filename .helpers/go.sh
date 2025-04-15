#!/bin/bash

mkdir ~/Downloads
cd ~/Downloads

sudo rm -rf /usr/local/go
curl -OL https://go.dev/dl/go1.24.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.24.2.linux-amd64.tar.gz

cd ~
