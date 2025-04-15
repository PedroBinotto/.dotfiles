#!/bin/bash

mkdir -p ~/Downloads/JetBrains
mkdir -p ~/.local/share/fonts
cd ~/Downloads

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mv JetBrainsMono.tar.xz JetBrains
cd ~/Downloads/JetBrains
tar -xvf JetBrainsMono.tar.xz
cd ~
mv JetBrains ~/.local/share/fonts
