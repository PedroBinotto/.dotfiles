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

autocmd BufWritePre *.js lua vim.lsp.buf.format(nil)
autocmd BufWritePre *.jsx lua vim.lsp.buf.format(nil)
autocmd BufWritePre *.ts lua vim.lsp.buf.format(nil)
autocmd BufWritePre *.tsx lua vim.lsp.buf.format(nil)
autocmd BufWritePre *.py lua vim.lsp.buf.format(nil)

luafile $HOME/.config/nvim/plug-config/cmp.lua
luafile $HOME/.config/nvim/plug-config/language-servers.lua
luafile $HOME/.config/nvim/plug-config/nvim-tree.lua

lua << EOF
  require("zen-mode").setup({
    window = {
      width = 200,
    }
  })
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
  require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = 'move_selection_next',
                ["<C-k>"] = 'move_selection_previous'
            }
        }
    }
  }
  require('nvim-tree').setup()
  require('null-ls').setup({
    sources = {
        require('null-ls').builtins.formatting.black,
        require('null-ls').builtins.diagnostics.eslint,
        require('null-ls').builtins.formatting.prettier,
        require('null-ls').builtins.diagnostics.flake8,
        require('null-ls').builtins.formatting.stylua,
    }
  })
  require('telescope').load_extension('fzf')
  require('mason').setup()
  require('pears').setup()
  require('mason-lspconfig').setup()
  require('mason-tool-installer').setup {
    ensure_installed = {
        'clangd',
        'css-lsp',
        'emmet-ls',
        'emmet-ls',
        'eslint-lsp',
        'eslint-lsp',
        'html-lsp',
        'json-lsp',
        'pyright',
        'rust-analyzer',
        'bash-language-server',
        'sqlls',
        'typescript-language-server',
        'vim-language-server',
        'black',
        'prettier',
        'flake8',
        'stylua',
    },
  }

  require('renamer').setup()
EOF


set secure

