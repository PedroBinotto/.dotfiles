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
    diagnostics.mypy,
    formatting.clang_format,
    formatting.gofmt,
    formatting.goimports_reviser,
    formatting.golines,
    formatting.prettier,
    formatting.stylua,
  },
})
