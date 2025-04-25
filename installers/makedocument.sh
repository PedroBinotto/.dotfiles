#!/bin/bash

cd ~/projects

git clone git@github.com:PedroBinotto/makedocument.git
cd ~/.local/bin
ln -s ~/projects/makedocument/makedocument makedocument

cd ~
