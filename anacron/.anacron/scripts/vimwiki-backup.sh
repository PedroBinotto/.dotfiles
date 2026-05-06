#!/bin/bash

export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin"

cd "$HOME/vimwiki" || exit 1
git add -A
git commit -m "$(date -I)" || true
git push
