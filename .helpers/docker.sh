#!/bin/bash

echo '[INFO] Configuring Docker...'

sudo groupadd docker
sudo usermod -aG docker $USER
