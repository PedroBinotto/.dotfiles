#!/bin/bash

cd ~

curl -s "https://get.sdkman.io" | bash
source ~/.sdkman/bin/sdkman-init.sh
rm -f ~/.zshrc

cd ~
