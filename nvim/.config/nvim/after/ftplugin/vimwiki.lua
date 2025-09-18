local keymap = vim.keymap.set

keymap("n", "<leader>wp", ":VimwikiAll2HTML<CR>", { noremap = true, silent = true, buffer = true })
