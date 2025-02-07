local status_comment_ok, comment = pcall(require, "Comment")
if not status_comment_ok then
  print("Failed to load module 'Comment'")
  return
end

local status_context_ok, context = pcall(require, "ts_context_commentstring")
if not status_context_ok then
  print("Failed to load module 'ts_context_commentstring'")
  return
end

context.setup({
  enable_autocmd = false,
  languages = {
    typescript = "// %s",
  },
})

comment.setup({
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  mappings = {
    basic = true,
  },
})

return comment
