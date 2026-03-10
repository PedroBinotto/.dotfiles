local keymap = vim.keymap.set

vim.o.foldenable = true
vim.o.foldmethod = 'marker'
keymap("n", "<leader>wp", ":VimwikiAll2HTML<CR>", { noremap = true, silent = true, buffer = true })
