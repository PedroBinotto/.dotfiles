local M = {}

function M.setup()
  vim.g.mkdp_auto_start = 0
  vim.g.mkdp_auto_close = 0
  vim.g.mkdp_refresh_slow = 0
  vim.g.mkdp_command_for_global = 0
  vim.g.mkdp_open_to_the_world = 1
  vim.g.mkdp_port = "9876"
  vim.g.mkdp_theme = "dark"
  vim.g.mkdp_browser = 'firefox'
end

return M
