local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  print("Failed to load module 'nvim-surround'.")
  return
end

surround.setup()
