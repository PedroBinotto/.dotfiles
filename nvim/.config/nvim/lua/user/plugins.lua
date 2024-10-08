local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer... please restart Neovim for changes to take effect")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("Failed to load module 'packer'")
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "double" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim")
	use("folke/zen-mode.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("stevearc/oil.nvim")
	use("nvim-telescope/telescope.nvim")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("numToStr/FTerm.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("lewis6991/gitsigns.nvim")
	use({ "nvimtools/none-ls.nvim", lazy = true })
	use("tpope/vim-fugitive")
	use("nvim-lualine/lualine.nvim")
	use({
		"PedroBinotto/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	})
	use("lukas-reineke/indent-blankline.nvim")
	use("MunifTanjim/exrc.nvim")
	use("mg979/vim-visual-multi")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "vimwiki/vimwiki" })
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- colorschemes
	--
	--
	use("folke/tokyonight.nvim")
	use({ "tjdevries/colorbuddy.nvim" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
