local status_ok, utils = pcall(require, "user.utils")
if not status_ok then
  print("[ftplugin.vimwiki.lua] Failed to load module 'user.utils'.")
  return
end

local keymap = vim.keymap.set
local motion = "aW"
local normal = "n"

local function toggle_format(text_obj, opts)
  local delimiter = opts.delimiter
  local surround = opts.surround
  local remove = opts.remove

  local pattern = string.format("^%s.*%s$", vim.pesc(delimiter), vim.pesc(delimiter))

  local function input_command(command)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, false, true), "m", false)
  end

  if text_obj:match(pattern) then
    input_command(remove)
  else
    input_command(surround)
  end
end

keymap(normal, "<leader>wp", ":VimwikiAll2HTML<CR>", { noremap = true, silent = true, buffer = true })

keymap(normal, "<leader>mi", function()
    utils.run_on_motion(motion, toggle_format, {
      delimiter = "_",
      surround = "ysaW_",
      remove = "ds_"
    })
  end,
  { buffer = true }
)

keymap(normal, "<leader>mb", function()
    utils.run_on_motion(motion, toggle_format, {
      delimiter = "**",
      surround = "2ysaW*",
      remove = "2ds*"
    })
  end,
  { buffer = true }
)
