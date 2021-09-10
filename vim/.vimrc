" colorscheme monokai
set nocompatible
set number
set cursorline
set ruler
set laststatus=2
set shiftwidth=4
set tabstop=4
set noexpandtab
set autoindent
set smartindent
set list
set listchars=tab:»·,eol:¬,trail:·
set clipboard=unnamedplus
set colorcolumn=80
set noshowmode
set shell=/usr/bin/zsh
highlight Comment cterm=bold
highlight ColorColumn ctermbg=235
command SynID  echo synIDattr(synID(line("."), col("."), 1), "name")

call plug#begin('~/.vim/plugged')
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'preservim/nerdtree', {'branch': 'master'}
Plug 'scrooloose/nerdtree'
Plug 'mtth/scratch.vim', {'branch': 'master'}
Plug 'honza/vim-snippets', {'branch': 'master'}
Plug 'yegappan/greplace', {'branch': 'master'}
Plug 'tpope/vim-commentary', {'branch': 'master'}
Plug 'itchyny/lightline.vim', {'branch': 'master'}
Plug 'airblade/vim-gitgutter', {'branch': 'master'}
Plug 'tpope/vim-fugitive', {'branch': 'master'}
Plug 'ycm-core/YouCompleteMe', {'branch': 'master'}
Plug 'SirVer/ultisnips', {'branch': 'master'}
Plug 'dense-analysis/ale', {'branch': 'master'}
call plug#end()

" UltiSnips setup
let g:UltiSnipsExpandTrigger='<c-k>'
let g:UltiSnipsJumpForwardTrigger='<c-k>'
let g:UltiSnipsJumpBackwardTrigger='<c-s-k>'

noremap <Leader>y "+y
noremap <Leader>p "+p

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

map <C-l> :NERDTreeToggle<CR>
map <C-_> :Commentary<CR>
au VimEnter * source /home/pedro/.vimrc
autocmd FileType python setlocal noexpandtab
autocmd VimEnter * GitGutterEnable

