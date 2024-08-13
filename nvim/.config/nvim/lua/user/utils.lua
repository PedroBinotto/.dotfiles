local M = {}

local harpoon = require("user.harpoon")
local telescope_conf = require("telescope.config").values
local finders = require("telescope.finders")

local harpoon_get_paths = function(files)
	local paths = {}
	for _, item in ipairs(files.items) do
		table.insert(paths, item.value)
	end

	return paths
end

local function harpoon_make_finder(paths)
	return finders.new_table({ results = paths })
end

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

function M.toggle_telescope(harpoon_files)
	local file_paths = harpoon_get_paths(harpoon_files)

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = harpoon_make_finder(file_paths),
			previewer = telescope_conf.file_previewer({}),
			sorter = telescope_conf.generic_sorter({}),
			attach_mappings = function(prompt_buffer_number, map)
				map(
					"i",
					"<M-d>", -- your mapping here
					function()
						local state = require("telescope.actions.state")
						local selected_entry = state.get_selected_entry()
						local current_picker = state.get_current_picker(prompt_buffer_number)
						harpoon:list():remove_at(selected_entry.index)
						current_picker:refresh(harpoon_make_finder(harpoon_get_paths(harpoon:list())))
					end
				)

				return true
			end,
		})
		:find()
end

return M
