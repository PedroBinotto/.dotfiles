local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  print("Failed to load module 'gitsigns.nvim'.")
  return
end

gitsigns.setup()

return gitsigns
