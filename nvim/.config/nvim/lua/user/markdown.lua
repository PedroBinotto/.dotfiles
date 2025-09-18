local markdown_status_ok, markdown = pcall(require, "render-markdown")
if not markdown_status_ok then
  print("Failed to load module 'render-markdown.nvim'.")
  return
end

markdown.setup({
  file_types = { 'markdown', 'vimwiki' },
})

return markdown
