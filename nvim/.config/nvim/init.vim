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

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

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

luafile $HOME/.config/nvim/plug-config/compe.lua
luafile $HOME/.config/nvim/plug-config/language-servers.lua

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
      ignore_install = { "javascript", "markdown", "plaplus", "vim", "vala", "beancount" },
  }
  require'treesitter-context'.setup {
      enable = false,
  }
  require('telescope').setup {}
  require('telescope').load_extension('fzf')
  require('mason').setup()
  require('mason-lspconfig').setup()
EOF

set secure

