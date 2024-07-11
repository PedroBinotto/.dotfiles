local M = {}

local function preview_markdown()
	require("user.markdown-preview").setup()
	vim.cmd("MarkdownPreviewToggle")
end

local function preview_latex()
	require("user.latex").latex_start_preview()
end

function M.preview()
	local function_map = {
		markdown = preview_markdown,
		tex = preview_latex,
	}

	local filetype = vim.bo.filetype
	if function_map[filetype] then
		function_map[filetype]()
	else
		print("No preview method available for filetype '" .. filetype .. "'.")
	end
end

function M.stop_preview() end

function M.oil_cwd()
	local oil = require("oil")
	oil.toggle_float(".")
end

function M.oil_find_file()
	local oil = require("oil")
	local path = vim.fn.expand("%:h")
	if vim.fn.findfile(path) then
		oil.toggle_float(path)
	else
		M.oil_cwd()
	end
end

return M
