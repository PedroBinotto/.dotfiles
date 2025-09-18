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

local function restrict_markdowny()
  vim.api.nvim_create_autocmd('FileType', {
    desc = 'markdowny.nvim keymaps',
    pattern = { 'markdown', 'vimwiki' },
    callback = function()
      vim.keymap.set('v', '<C-b>', ":lua require('markdowny').bold()<cr>", { buffer = 0 })
      vim.keymap.set('v', '<C-i>', ":lua require('markdowny').italic()<cr>", { buffer = 0 })
      vim.keymap.set('v', '<C-k>', ":lua require('markdowny').link()<cr>", { buffer = 0 })
      vim.keymap.set('v', '<C-e>', ":lua require('markdowny').code()<cr>", { buffer = 0 })
    end,
  })
end

configure_format_on_save()
enable_vimwiki_diary_template()
restrict_markdowny()

-- TODO: autocmd numbertoggle
