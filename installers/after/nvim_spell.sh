#!/bin/bash

cd ~/.config/nvim/spell

curl https://ftp.nluug.nl/pub/vim/runtime/spell/pt.utf-8.spl -o pt.utf-8.spl
curl https://ftp.nluug.nl/pub/vim/runtime/spell/pt_br.utf-8.sug -o pt_br.utf-8.sug

cd ~
