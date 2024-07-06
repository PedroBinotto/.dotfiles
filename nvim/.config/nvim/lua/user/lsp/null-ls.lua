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
		formatting.prettier,
		formatting.stylua,
		formatting.eslint,
		formatting.autopep8.with({
			extra_args = { "--ignore", "E402", "--max-line-length", "120" },
		}),
		diagnostics.mypy,
		diagnostics.pylint.with({ extra_args = { "--max-line-length", "120" } }),
		diagnostics.eslint,
		formatting.deno_fmt.with({
			filetypes = { "markdown" },
		}),
	},
})
