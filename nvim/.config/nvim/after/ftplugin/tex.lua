local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("", "<Bslash>", "<Nop>", opts) -- TODO: Source from 'user.keymaps' or smth
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
vim.o.spell = true
vim.o.spelllang = "en,pt_br"
vim.o.textwidth = 120
vim.o.wrap = true

keymap("i", "<leader>bg", "\\begin{<>}<Enter>end{<>}<Esc>kT{vi{<C-n><C-n>", { noremap = false, silent = true })
keymap("i", "<leader>em", "\\emph{}<Space><><Esc>T{i", opts)
keymap("i", "<leader>bf", "\\textbf{}<Space><><Esc>T{i", opts)
keymap("i", "<leader>ul", "\\begin{itemize}<Enter><><Enter>\\end{itemize}<Esc>2k/<><Enter>cw", opts)
keymap("i", "<leader>ol", "\\begin{enumerate}<Enter>\\<><Enter>end{enumerate}<Esc>2k/<><Enter>cw", opts)
keymap("i", "<leader>it", "\\textit{}<Space><><Esc>T{i", opts)
keymap("i", "<leader>tt", "\\texttt{}<Space><><Esc>T{i", opts)
keymap("i", "<leader>tit", "\\title{}<Space><><Esc>T{i", opts)
keymap("i", "<leader>ct", "\\cite{}<Space><><Esc>T{i", opts)
keymap("i", "<leader>up", "\\usepackage{}<Esc>T{i", opts)
keymap("i", "<leader>sec", "\\section{}<Enter><Enter><><Esc>2kf{a", opts)
keymap("i", "<leader>ssec", "\\subsection{}<Enter><Enter><><Esc>2kf{a", opts)
keymap("i", "<leader>sssec", "\\subsubsection{}<Enter><Enter><><Esc>2kf{a", opts)
keymap("n", "<leader>wr", "/<><Enter>cw", opts)
