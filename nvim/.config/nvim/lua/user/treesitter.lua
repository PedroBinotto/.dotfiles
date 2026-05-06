local ts_status_ok, treesitter = pcall(require, "nvim-treesitter")
if not ts_status_ok then
  print("Failed to load module 'nvim-treesitter'")
  return
end

local parsers = {
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
}

treesitter.install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(args.match)
    if lang and pcall(vim.treesitter.start, args.buf, lang) then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

return treesitter
