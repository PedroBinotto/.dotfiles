local comment = require("Comment.api")

local harpoon = require("user.harpoon")
local utils = require("user.utils")
local appcontext = require("user.app-context")
local fterm = require("user.fterm")

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

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

keymap("n", "<leader>t", function()
	fterm.toggle()
end, opts)

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

keymap("n", "<C-_>", function()
	comment.toggle.linewise.current()
end, opts)
keymap("x", "<C-_>", function()
	comment.toggle.linewise(vim.fn.visualmode())
end, opts)
keymap("v", "<C-_>", function()
	comment.toggle.linewise(vim.fn.visualmode())
end, opts)

keymap("n", "<leader>cc", function()
	appcontext.build_app()
end, opts)
keymap("n", "<leader>cf", function()
	appcontext.run_frontend()
end, opts)
keymap("n", "<leader>cb", function()
	appcontext.run_backend()
end, opts)
keymap("n", "<leader>ct", function()
	appcontext.run_tests()
end, opts)

keymap("n", "<leader>ckb", function()
	appcontext.kill_backend()
end, opts)
keymap("n", "<leader>ckf", function()
	appcontext.kill_frontend()
end, opts)
keymap("n", "<leader>ckt", function()
	appcontext.kill_tests()
end, opts)

keymap("n", "<leader>cr", function()
	appcontext.run_all()
end, opts)
keymap("n", "<leader>cK", function()
	appcontext.kill_all()
end, opts)

vim.keymap.set("n", "<leader>m", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>h", function()
	utils.toggle_telescope(harpoon:list())
end)

vim.keymap.set("n", "<M-1>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<M-2>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<M-3>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<M-4>", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<M-[>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<M-]>", function()
	harpoon:list():next()
end)

keymap("n", "<leader>mdp", function()
	appcontext.preview()
end, opts)
