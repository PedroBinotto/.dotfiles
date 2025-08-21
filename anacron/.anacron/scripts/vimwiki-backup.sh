#!/bin/bash

cd "$HOME/vimwiki" || exit 1
git add *
git commit -m "$(date --rfc-3339=date)" || true
