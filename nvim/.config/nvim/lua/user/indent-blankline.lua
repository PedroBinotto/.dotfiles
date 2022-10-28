local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	print("Failed to load module 'indent-blankline.nvim'.")
	return
end

indent_blankline.setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})
