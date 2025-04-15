#!/bin/bash

echo '[INFO] Installing Neovim (Building from source)...'

cd ~/projects

git clone https://github.com/neovim/neovim
cd neovim 
make CMAKE_BUILD_TYPE=RelWithDebInfo 
sudo make install 

cd ~
