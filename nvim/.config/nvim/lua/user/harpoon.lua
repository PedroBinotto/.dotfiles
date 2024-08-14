local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
	print("Failed to load module 'Harpoon'")
	return
end

-- REQUIRED
harpoon:setup()
-- REQUIRED

return harpoon
