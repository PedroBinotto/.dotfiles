#!/bin/bash

cd ~/projects

git clone https://github.com/kovidgoyal/kitty.git && cd kitty
./dev.sh build

# TODO: add .desktop entry

cd ~
