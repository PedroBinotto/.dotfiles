local keymap = vim.keymap.set

keymap('v', '<C-b>', ":lua require('markdowny').bold()<cr>", { buffer = true })
keymap('v', '<C-i>', ":lua require('markdowny').italic()<cr>", { buffer = true })
keymap('v', '<C-k>', ":lua require('markdowny').link()<cr>", { buffer = true })
keymap('v', '<C-e>', ":lua require('markdowny').code()<cr>", { buffer = true })

keymap("n", "<leader>wp", ":VimwikiAll2HTML<CR>", { noremap = true, silent = true, buffer = true })
