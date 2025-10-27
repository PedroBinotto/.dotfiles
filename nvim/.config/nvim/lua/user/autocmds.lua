local function configure_format_on_save()
  local opts = require("user.config.defaults").format_on_save
  vim.api.nvim_create_augroup("lsp_format_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lsp_format_on_save",
    pattern = opts.pattern,
    callback = function()
      require("user.lsp.utils").format({ timeout_ms = opts.timeout, filter = opts.filter })
    end,
  })
end

local function enable_vimwiki_diary_template()
  vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*/vimwiki/diary/*.md",
    callback = function(_)
      vim.cmd("silent 0r !~/vimwiki/diary_template.py ")
    end,
  })
end


local function setup_dadbod_completion()
  local cmp = require('cmp')
  local autocomplete_group = vim.api.nvim_create_augroup('vimrc_autocompletion', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'sql', 'mysql', 'plsql' },
    callback = function()
      cmp.setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
    end,
    group = autocomplete_group,
  })
end

configure_format_on_save()
enable_vimwiki_diary_template()
setup_dadbod_completion()

-- TODO: autocmd numbertoggle
