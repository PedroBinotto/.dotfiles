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
set laststatus=2
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

colorscheme one
set background=dark
let g:one_allow_italics=1

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
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
let g:NERDTreeIgnore = ['^node_modules$']
let NERDTreeMapActivateNode = 'l'

let g:NERDCreateDefaultMappings = 0

" let g:prettier#autoformat = 1
" let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat_require_pragma = 0

" set initial variables for tmux server session starters
let g:RunBackend = ''
let g:RunFrontend = ''
let g:BuildApp = ''
" g:KillAll = ''

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

