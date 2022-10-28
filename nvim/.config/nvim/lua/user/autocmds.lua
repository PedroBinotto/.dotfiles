local function configure_format_on_save()
	local opts = require("user.config.defaults").format_on_save
	vim.api.nvim_create_augroup("lsp_format_on_save", {})
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = "lsp_format_on_save",
		pattern = opts.pattern,
		callback = function()
			require("user.lsp.utils").format({ timeout_ms = opts.timeout, filter = opts.filter })
		end,
	})
end

configure_format_on_save()

-- TODO: autocmd numbertoggle
