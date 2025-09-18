local markdowny_status_ok, markdowny = pcall(require, "markdowny")
if not markdowny_status_ok then
  print("Failed to load module 'markdowny.nvim'.")
  return
end

markdowny.setup()

return markdowny
