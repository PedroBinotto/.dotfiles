local keymap = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = 0 }

keymap("n", "<ESC><ESC>", ":q <CR>", opts)
