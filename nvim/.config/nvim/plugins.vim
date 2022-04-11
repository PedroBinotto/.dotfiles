let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'itchyny/lightline.vim', {'branch': 'master'}
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'prettier/vim-prettier'
Plug 'mtth/scratch.vim', {'branch': 'master'}
Plug 'szw/vim-maximizer'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'ying17zi/vim-live-latex-preview'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for':['markdown', 'vim-plug'] }
Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nixon/vim-vmath'

" Colorschemes
Plug 'terroo/terroo-colors'
Plug 'srcery-colors/srcery-vim'
Plug 'pacokwon/onedarkpaco.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'sainnhe/sonokai'
Plug 'joshdick/onedark.vim'
Plug 'yassinebridi/vim-purpura'
Plug 'lifepillar/vim-wwdc16-theme'
Plug 'tckmn/hotdog.vim'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'folke/zen-mode.nvim'
call plug#end()

