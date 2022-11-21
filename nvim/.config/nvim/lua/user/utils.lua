local M = {}

local function preview_markdown()
	require("user.markdown-preview").setup()
	vim.cmd("MarkdownPreviewToggle")
end

local function preview_latex()
	print("TODO: Port latex previews from old vimscript")
	-- vim.g.mkdp_auto_close = 0
	-- vim.cmd("MarkdownPreviewToggle")
end

function M.preview()
	local function_map = {
		markdown = preview_markdown,
		latex = preview_latex,
	}
	local filetype = vim.bo.filetype
	if function_map[filetype] then
		function_map[filetype]()
	else
		print("No preview method available for filetype '" .. filetype .. "'.")
	end
end

return M
