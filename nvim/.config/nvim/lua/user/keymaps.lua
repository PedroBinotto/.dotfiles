local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local utils = require("user.utils")

keymap("", "<Bslash>", "<Nop>", opts)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

keymap("n", "<leader>:", "q:", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", utils.oil_find_file, { desc = "Open parent directory" })
keymap("n", "<leader>E", utils.oil_cwd, { desc = "Open CWD" })

keymap("n", "<leader>t", ':lua require("FTerm").toggle()<CR>', opts)

keymap("n", "<leader>=", ":10winc > <CR>", opts)
keymap("n", "<leader>-", ":10winc < <CR>", opts)
keymap("n", "<leader>+", ":10winc + <CR>", opts)
keymap("n", "<leader>_", ":10winc - <CR>", opts)

keymap("n", "<leader>[", ":cprev<CR>", opts)
keymap("n", "<leader>]", ":cnext<CR>", opts)

keymap("n", "Y", "y$", opts)

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("i", "<C-j>", "<Esc>:m .+1<CR>==", opts)
keymap("i", "<C-k>", "<Esc>:m .-2<CR>==", opts)

keymap("n", "<leader>k", ":m .-2<CR>==", opts)
keymap("n", "<leader>j", ":m .+1<CR>==", opts)

keymap("n", "<leader>F", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fe", ":Telescope grep_string<CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>\\", ":Telescope lsp_dynamic_workspace_symbols<CR>", opts)
keymap("n", "<leader>p", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>P", ":Telescope fd<CR>", opts)
keymap("n", "<leader>wk", ":Telescope keymaps<CR>", opts)
keymap("n", "<silent> <leader>d", ":Telescope diagnostics<CR>", opts)
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)

keymap("n", "<leader>z", ":ZenMode<CR>", opts)

keymap("n", "<C-_>", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<C-_>", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
keymap("v", "<C-_>", "<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

keymap("n", "<leader>cc", ":lua require('user.app-context').build_app()<CR>", opts)
keymap("n", "<leader>cf", ":lua require('user.app-context').run_frontend()<CR>", opts)
keymap("n", "<leader>cb", ":lua require('user.app-context').run_backend()<CR>", opts)
keymap("n", "<leader>ct", ":lua require('user.app-context').run_tests()<CR>", opts)

keymap("n", "<leader>ckb", ":lua require('user.app-context').kill_backend()<CR>", opts)
keymap("n", "<leader>ckf", ":lua require('user.app-context').kill_frontend()<CR>", opts)
keymap("n", "<leader>ckt", ":lua require('user.app-context').kill_tests()<CR>", opts)

keymap("n", "<leader>cr", ":lua require('user.app-context').run_all()<CR>", opts)
keymap("n", "<leader>cK", ":lua require('user.app-context').kill_all()<CR>", opts)

keymap("n", "<leader>mdp", ":lua require('user.utils').preview()<CR>", opts)
