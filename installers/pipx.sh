#!/bin/bash

cd ~/projects

# FIXME: Solucao provisoria, ver https://github.com/pypa/pipx/issues/1524
# Quando resolvido, reverter:
# 1.:
# ```diff
# + sudo pipx ensurepath --global
# ```
# 2.: Readicionar `pipx` em `../packagefile.json.apt`

git clone git@github.com:zinc75/pipx-1.6.0-backport-ubuntu-2404-lts.git pipx
cd pipx
sudo dpkg -i pipx_1.6.0-1_all.deb
sudo apt -f install
sudo pipx ensurepath --global

cd ~
