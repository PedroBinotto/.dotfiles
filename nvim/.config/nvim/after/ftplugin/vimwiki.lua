local keymap = vim.keymap.set

local opts = { noremap = true, silent = true, buffer = true }

keymap("n", "<leader>wp", ":VimwikiAll2HTML<CR>", opts)

-- keymap("v", "<leader>b", function() toggle_wrap("**") end, {
--   silent = true,
--   noremap = true,
--   desc = "Make bold"
-- })
--
-- keymap("v", "<leader>i", function() toggle_wrap("_") end, {
--   silent = true,
--   noremap = true,
--   desc = "Make italic"
-- })
