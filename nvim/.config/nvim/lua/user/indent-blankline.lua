local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
  print("Failed to load module 'indent-blankline.nvim'.")
  return
end

indent_blankline.setup({})
