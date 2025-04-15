#!/bin/bash

cd ~/projects

git clone https://github.com/kovidgoyal/kitty.git
sudo mv kitty /opt
cd /opt/kitty
./dev.sh build
sudo cp $SCRIPT_DIR/installers/kitty.desktop /usr/share/applications

cd ~
