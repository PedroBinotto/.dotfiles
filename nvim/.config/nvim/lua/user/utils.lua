local harpoon = require("user.harpoon")
local telescope_conf = require("telescope.config").values
local telescope_state = require("telescope.actions.state")
local telescope_finders = require("telescope.finders")
local telescope_pickers = require("telescope.pickers")
local oil = require("user.oil")

---@class Params
local Params = {}

local M = {}

local harpoon_get_paths = function(files)
  local paths = {}
  local items = files.items
  local len = files._length

  for i = 1, len do
    paths[i] = ''
    local item = items[i]
    if item ~= nil then
      paths[i] = item.value
    end
  end

  return paths
end

local function harpoon_make_finder(paths)
  return telescope_finders.new_table({ results = paths })
end

function M.oil_cwd()
  oil.toggle_float(".")
end

function M.oil_find_file()
  local path = vim.fn.expand("%:h")
  if vim.fn.findfile(path) then
    oil.toggle_float(path)
  else
    M.oil_cwd()
  end
end

function M.toggle_telescope(harpoon_files)
  local file_paths = harpoon_get_paths(harpoon_files)
  telescope_pickers
      .new({}, {
        prompt_title = "Harpoon",
        finder = harpoon_make_finder(file_paths),
        previewer = telescope_conf.file_previewer({}),
        sorter = telescope_conf.generic_sorter({}),
        attach_mappings = function(prompt_buffer_number, map)
          map("i", "<M-d>", function()
            local selected_entry = telescope_state.get_selected_entry()
            local current_picker = telescope_state.get_current_picker(prompt_buffer_number)
            harpoon:list():remove_at(selected_entry.index)
            current_picker:refresh(harpoon_make_finder(harpoon_get_paths(harpoon:list())))
          end)
          return true
        end,
      })
      :find()
end

function M.is_empty(string)
  return string == nil or string == ""
end

---@param motion string
---@param fn fun(text_obj: string, opts: Params)
---@param fn_opts Params
function M.run_on_motion(motion, fn, fn_opts)
  vim.cmd.normal({ args = { '"zy' .. motion }, bang = true })
  local text = vim.fn.getreg("z")
  fn(text, fn_opts)
end

return M
