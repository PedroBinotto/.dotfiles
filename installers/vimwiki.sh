#!/bin/bash

if [[ -d "$HOME/vimwiki" ]]; then
  echo "vimwiki already cloned at ~/vimwiki, skipping."
  exit 0
fi

git clone git@github.com:PedroBinotto/wiki.git "$HOME/vimwiki"
