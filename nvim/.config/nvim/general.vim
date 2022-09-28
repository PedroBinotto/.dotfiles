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
set shortmess+=c
set signcolumn=yes
set exrc
highlight Comment cterm=bold
call matchadd('colorcolumn', '\%81v', 100)
filetype plugin on

colorscheme onedarkhc
set background=dark
let g:one_allow_italics=1
let g:vimwiki_global_ext = 0
let g:prettier#autoformat_require_pragma = 0

" set initial variables for tmux server session starters
let g:RunBackend = ''
let g:RunFrontend = ''
let g:RunTests = ''
let g:BuildApp = ''
let g:LatexPreviewWindow = 'TeXPreview'
let g:LatexCompileWindow = 'TeXCompile'

let loaded_netrwPlugin = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10

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

" hybrid line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

:command! RemoveQFItem :call RemoveQFItem()
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>
command -bang -nargs=? QFix call QFixToggle(<bang>0)

autocmd BufWritePre *.js lua vim.lsp.buf.format(nil)
autocmd BufWritePre *.jsx lua vim.lsp.buf.format(nil)
autocmd BufWritePre *.ts lua vim.lsp.buf.format(nil)
autocmd BufWritePre *.tsx lua vim.lsp.buf.format(nil)
autocmd BufWritePre *.py lua vim.lsp.buf.format(nil)

