#!/bin/bash

cd ~/projects

git clone git@github.com:junegunn/fzf.git
cd ~/projects/fzf
make
make install
sudo cp bin/fzf /bin

cd ~
