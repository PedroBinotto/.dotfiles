require("zen-mode").setup()

require("harpoon").setup({
  menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
  }
})

require("indent_blankline").setup({
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
})

require'nvim-treesitter.configs'.setup({
  highlight = { enable = true },
  ensure_installed = "all",
  ignore_install = { "javascript", "markdown", "plaplus", "vim", "vala", "beancount" },
})

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = 'move_selection_next',
                ["<C-k>"] = 'move_selection_previous'
            }
        }
    }
})

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

require('mason-tool-installer').setup({
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
    auto_update = true,
})

require('renamer').setup()

vim.diagnostic.config({ virtual_text = false })
