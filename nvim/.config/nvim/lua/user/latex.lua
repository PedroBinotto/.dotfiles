local status_ok, tmux = pcall(require, "user.tmux")
if not status_ok then
	print("Failed to load module 'user.tmux'.")
	return
end

local latex_preview_window = "TeXPreview"
local latex_compile_window = "TeXCompile"

local M = {}

function M.latex_compile_document()
	local file_path = vim.fn.expand("%:p")
	local tex_compile = "compileTex " .. file_path
	tmux.start_process(tex_compile, "Error while executing 'user.latex.latex_compile_document'", latex_compile_window)
end

function M.latex_start_preview()
	local file_path = vim.fn.expand("%:p:r")
	local tex_preview = "zathura " .. file_path .. ".pdf"
	tmux.start_process(tex_preview, "Error while executing 'user.latex.latex_compile_document'", latex_preview_window)
end

function M.latex_stop_preview()
	tmux.kill_process(latex_preview_window)
end

return M
