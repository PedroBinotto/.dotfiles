local status_ok, fterm = pcall(require, "FTerm")
if not status_ok then
	print("Failed to load module 'FTerm.nvim'.")
	return
end

fterm.setup({
	ft = "fterm",
	border = "rounded",
	dimensions = {
		height = 0.65, -- Height of the terminal window
		width = 0.65, -- Width of the terminal window
	},
})
