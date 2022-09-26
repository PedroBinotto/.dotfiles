local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<C-l>', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>l', ':NvimTreeFindFile<CR>', opts)

