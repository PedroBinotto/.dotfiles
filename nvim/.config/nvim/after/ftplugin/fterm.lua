local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("t", "<ESC><ESC>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
keymap("t", "<leader>t", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
