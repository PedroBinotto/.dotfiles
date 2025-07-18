#!/bin/bash

cd ~/projects

git clone https://github.com/kovidgoyal/kitty.git
sudo mv kitty /opt
cd /opt/kitty
./dev.sh build
cd ~/.dotfiles
sudo cp ./installers/kitty.desktop /usr/share/applications

cd ~
