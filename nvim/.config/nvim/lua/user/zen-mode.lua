local status_ok, zenmode = pcall(require, "zen-mode")
if not status_ok then
	print("Failed to load module 'zen-mode'")
	return
end

zenmode.setup({
	window = {
		width = 0.60,
	},
})
