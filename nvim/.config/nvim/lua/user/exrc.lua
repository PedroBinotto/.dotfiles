local status_ok, exrc = pcall(require, "exrc")
if not status_ok then
	print("Failed to load module 'exrc'.")
	return
end

exrc.setup({
	files = {
		".nvimrc.lua",
		".nvimrc",
		".exrc.lua",
		".exrc",
	},
})

return exrc
