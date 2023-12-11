local colorscheme = "onedark"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
else
	vim.cmd([[
		let g:onedark_config = {
				\ 'style': 'darker',
		\}
	]])
	vim.cmd("colorscheme " .. colorscheme)
end
