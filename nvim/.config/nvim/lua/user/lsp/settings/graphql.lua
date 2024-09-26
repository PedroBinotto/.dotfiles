local lspconfig = require("lspconfig")

return {
	root_dir = lspconfig.util.root_pattern(".graphqlconfig", ".graphqlrc.yml", "package.json"),
	flags = {
		debounce_text_changes = 150,
	},
}
