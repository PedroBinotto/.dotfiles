"        _                            __ _
" __   _(_)_ __ ___   ___ ___  _ __  / _(_) __ _
" \ \ / / | '_ ` _ \ / __/ _ \| '_ \| |_| |/ _` |
"  \ V /| | | | | | | (_| (_) | | | |  _| | (_| |
"   \_/ |_|_| |_| |_|\___\___/|_| |_|_| |_|\__, |
"                                          |___/

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/utils.vim
source $HOME/.config/nvim/app-context.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/latex.vim
source $HOME/.config/nvim/powerline.vim

luafile $HOME/.config/nvim/plug-config/cmp.lua
luafile $HOME/.config/nvim/plug-config/language-servers.lua
luafile $HOME/.config/nvim/plug-config/nvim-tree.lua
luafile $HOME/.config/nvim/plug-config/setup.lua

set secure

