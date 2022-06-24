set nocompatible
set noerrorbells
set incsearch
set noswapfile
set nowrap
set number
set ruler
set cursorline
set smarttab
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set laststatus=3
set expandtab
set list
set listchars=tab:»·,eol:¬,trail:·
set noshowmode
set termguicolors
set guifont=FiraCodeNerdFont:h12
set shell=/usr/bin/zsh
set clipboard+=unnamedplus
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
set exrc
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
highlight Comment cterm=bold
call matchadd('colorcolumn', '\%81v', 100)
filetype plugin on

colorscheme one
set background=dark
let g:one_allow_italics=1
let g:vimwiki_global_ext = 0

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeMapActivateNode = 'l'
let g:NERDCreateDefaultMappings = 0
let g:prettier#autoformat_require_pragma = 0
let g:coc_filetype_map = {'tex': 'latex'}

" set initial variables for tmux server session starters
let g:RunBackend = ''
let g:RunFrontend = ''
let g:RunTests = ''
let g:BuildApp = ''

autocmd FileType typescript setlocal tabstop=2
autocmd FileType typescript setlocal softtabstop=2
autocmd FileType typescript setlocal shiftwidth=2
autocmd FileType typescriptreact setlocal tabstop=2
autocmd FileType typescriptreact setlocal softtabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2
autocmd FileType html setlocal tabstop=2
autocmd FileType html setlocal softtabstop=2
autocmd FileType html setlocal shiftwidth=2
autocmd FileType python setlocal tabstop=4
autocmd FileType scss setl iskeyword+=@-@
autocmd FileType make setlocal noexpandtab
autocmd FileType markdown setlocal spell spelllang=pt_br
autocmd FileType markdown setlocal tw=100
autocmd FileType tex setlocal spell spelllang=pt_br
autocmd FileType tex setlocal tw=80

" let g:NERDTreeColorMapCustom = {
"     \ "Staged"    : "#0ee375",
"     \ "Modified"  : "#d9bf91",
"     \ "Renamed"   : "#51C9FC",
"     \ "Untracked" : "#FCE77C",
"     \ "Unmerged"  : "#FC51E6",
"     \ "Dirty"     : "#FFBD61",
"     \ "Clean"     : "#87939A",
"     \ "Ignored"   : "#808080"
"     \ }
"
