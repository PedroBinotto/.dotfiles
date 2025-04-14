#!/bin/bash

cd ~/Downloads

mkdir ~/.local/share/fonts
mkdir JetBrains
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mv JetBrainsMono.tar.xz JetBrains
cd JetBrains
tar -xvf JetBrainsMono.tar.xz
cd ..
mv JetBrains ~/.local/share/fonts

cd ~
