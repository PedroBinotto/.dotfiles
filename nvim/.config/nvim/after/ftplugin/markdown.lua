local keymap = vim.keymap.set

vim.o.spell = true
vim.o.spelllang = "en,pt_br"
vim.o.wrap = true

keymap('v', '<C-b>', ":lua require('markdowny').bold()<cr>", { buffer = true })
keymap('v', '<C-i>', ":lua require('markdowny').italic()<cr>", { buffer = true })
keymap('v', '<C-k>', ":lua require('markdowny').link()<cr>", { buffer = true })
keymap('v', '<C-e>', ":lua require('markdowny').code()<cr>", { buffer = true })
