local latex = require("user.latex")
local mkpreview = require("user.markdown-preview")

local M = {}

local function preview_markdown()
  mkpreview.setup()
  vim.cmd("MarkdownPreviewToggle")
end

local function preview_latex()
  latex.latex_start_preview()
end

function M.stop_preview() end

function M.preview()
  local function_map = {
    markdown = preview_markdown,
    vimwiki = preview_markdown,
    tex = preview_latex,
  }

  local filetype = vim.bo.filetype
  if function_map[filetype] then
    function_map[filetype]()
  else
    print("No preview method available for filetype '" .. filetype .. "'.")
  end
end

return M
