return {
	format_on_save = {
		pattern = "*",
		timeout = 2000,
		filter = require("user.lsp.utils").format_filter,
	},
}
