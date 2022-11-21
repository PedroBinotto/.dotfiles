local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	print("Failed to load module 'null-ls'.")
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.prettier,
		formatting.stylua,
		formatting.eslint,
		diagnostics.flake8.with({ extra_args = { "-extend-ignore=E501" } }),
		diagnostics.eslint,
	},
})
