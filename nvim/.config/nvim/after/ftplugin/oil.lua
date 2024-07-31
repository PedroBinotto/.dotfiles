local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<ESC><ESC>", ":q <CR>", opts)
