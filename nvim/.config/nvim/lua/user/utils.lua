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

M.oil_is_git_ignored = setmetatable({}, {
	__index = function(self, key)
		local proc = vim.system({ "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" }, {
			cwd = key,
			text = true,
		})
		local result = proc:wait()
		local ret = {}
		if result.code == 0 then
			for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
				-- Remove trailing slash
				line = line:gsub("/$", "")
				table.insert(ret, line)
			end
		end

		rawset(self, key, ret)
		return ret
	end,
})

return M
