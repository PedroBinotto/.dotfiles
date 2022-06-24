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

" hybrid line numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

"prettier config
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html Prettier

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-prettier',
  \ 'coc-pairs',
  \ 'coc-html',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-sql',
  \ 'coc-rust-analyzer',
  \ 'coc-pyright',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-clangd',
  \ 'coc-graphql',
  \ 'coc-sh',
  \ 'coc-vimlsp',
  \ 'coc-emmet',
  \ ]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

source $HOME/.config/nvim/plug-config/coc.vim

command! -nargs=0 PreviewDefinition :call CocActionAsync('jumpDefinition', ':OpenAsPreview')
command! -nargs=* OpenAsPreview :call s:open_as_preview("<args>")
function! s:open_as_preview(callstr)
    let m = matchlist(a:callstr, '^+call cursor(\(\d\+\),\s*\(\d\+\))\s\+\(.*\)')
    if len(m) < 4   " TODO: more robust error handling
      echohl WarningMsg | echom "ERROR: Invalid callstr format" | echohl None
      return
    endif
    let linenr = m[1]
    let filename = expand(m[3])

    call quickui#preview#open(filename, {
          \ 'cursor': linenr,
          \ 'number' : 1,
          \ 'persist': 0,
          \ })
endfunction

fun! FormatOnSave()
    :call CocAction('runCommand', 'editor.action.organizeImport')
    :call CocAction('runCommand', 'eslint.executeAutoFix')
endfun

autocmd BufWritePre *.ts(x?) :call FormatOnSave()

lua << EOF
  require("zen-mode").setup {}
  require("harpoon").setup({
      menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
      }
  })
  require("indent_blankline").setup {
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,
  }
  require'nvim-treesitter.configs'.setup {
      highlight = { enable = true },
      ensure_installed = "all",
  }
EOF

set secure
