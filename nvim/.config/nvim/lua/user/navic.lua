local navic_status_ok, navic = pcall(require, "nvim-navic")
if not navic_status_ok then
  print("Failed to load module 'navic.nvim'.")
  return
end

navic.setup()

return navic
