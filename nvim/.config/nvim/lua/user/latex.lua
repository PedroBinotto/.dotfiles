local tmux_status_ok, tmux = pcall(require, "user.tmux")
if not tmux_status_ok then
	print("Failed to load module 'user.tmux'.")
	return
end

local status_ok, utils = pcall(require, "user.utils")
if not status_ok then
	print("[latex.lua] Failed to load module 'user.utils'.")
	return
end

local latex_preview_window = "TeXPreview"
local latex_compile_window = "TeXCompile"

local M = {}

function M.get_main_file()
	if utils.is_empty(vim.g.LatexEntryPoint) then
		print("Entry point for LaTeX compiler not defined. Check project .exrc for 'g:LatexEntryPoint'")
		return
	end
	return vim.g.LatexEntryPoint
end

function M.latex_compile_document()
	local file_path = M.get_main_file()
	if file_path == nil then
		return
	end
	local tex_compile = "compileTex " .. file_path
	tmux.start_process(tex_compile, "Error while executing 'user.latex.latex_compile_document'", latex_compile_window)
end

function M.latex_start_preview()
	local truncated_file = M.get_main_file():match("(.+)%..+")
	local tex_preview = "zathura " .. truncated_file .. ".pdf"
	tmux.start_process(tex_preview, "Error while executing 'user.latex.latex_start_preview'", latex_preview_window)
end

function M.latex_stop_preview()
	tmux.kill_process(latex_preview_window)
end

return M
