#!/bin/bash

echo '[INFO] Installing kitty (Building from source)...'

cd ~/projects

git clone https://github.com/kovidgoyal/kitty.git
sudo mv kitty /opt
cd /opt/kitty
./dev.sh build

# TODO: add .desktop entry

cd ~
