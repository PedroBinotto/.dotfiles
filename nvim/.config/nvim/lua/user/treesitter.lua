local ts_status_ok, _ = pcall(require, "nvim-treesitter")
if not ts_status_ok then
	print("Failed to load module 'nvim-treesitter'")
	return
end

local config_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not config_status_ok then
	print("Failed to load module 'nvim-treesitter.configs'")
	return
end

configs.setup({
	auto_install = true,
	ensure_intalled = {
		"bash",
		"c",
		"c_sharp",
		"clojure",
		"cpp",
		"css",
		"diff",
		"go",
		"graphql",
		"html",
		"java",
		"javascript",
		"json",
		"julia",
		"kotlin",
		"latex",
		"make",
		"python",
		"r",
		"rust",
		"scss",
		"sql",
		"tsx",
		"typescript",
		"yaml",
	},
	sync_install = false,
	ignore_install = { "" },
	highlight = {
		enable = true,
		disable = { "" },
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "yaml" } },
})
