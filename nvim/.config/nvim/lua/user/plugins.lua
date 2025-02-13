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
  use({ "wbthomason/packer.nvim" })
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "folke/zen-mode.nvim", commit = "863f150" })
  use({ "hrsh7th/nvim-cmp", commit = "1250990" })
  use({ "hrsh7th/cmp-buffer", commit = "3022dbc" })
  use({ "hrsh7th/cmp-path", commit = "91ff86c" })
  use({ "hrsh7th/cmp-cmdline", commit = "d250c63" })
  use({ "hrsh7th/cmp-nvim-lsp", commit = "99290b3" })
  use({ "hrsh7th/cmp-nvim-lua", commit = "f12408b" })
  use({ "saadparwaiz1/cmp_luasnip", commit = "98d9cb5" })
  use({ "L3MON4D3/LuaSnip", commit = "c9b9a22" })
  use({ "rafamadriz/friendly-snippets", commit = "efff286" })
  use({ "neovim/nvim-lspconfig", commit = "6c17f86" })
  use({ "williamboman/mason.nvim", commit = "e2f7f90" })
  use({ "williamboman/mason-lspconfig.nvim", commit = "805c31e" })
  use({ "nvim-tree/nvim-web-devicons", commit = "1020869" })
  use({ "stevearc/oil.nvim", commit = "32dd3e3" })
  use({ "nvim-telescope/telescope.nvim", commit = "78857db" })
  use({ "windwp/nvim-autopairs", commit = "3d02855" })
  use({ "numToStr/Comment.nvim", commit = "e30b7f2" })
  use({ "numToStr/FTerm.nvim", commit = "d132089" })
  use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "1b212c2" })
  use({ "lewis6991/gitsigns.nvim", commit = "2bc3b47" })
  use({ "nvimtools/none-ls.nvim", lazy = true, commit = "02f5275" })
  use({ "tpope/vim-fugitive", commit = "b068eaf" })
  use({ "nvim-lualine/lualine.nvim", commit = "f4f791f" })
  use({
    "PedroBinotto/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    commit = "0754d1c"
  })
  use({ "lukas-reineke/indent-blankline.nvim", commit = "e10626f" })
  use({ "MunifTanjim/exrc.nvim", commit = "0aae882" })
  use({ "mg979/vim-visual-multi", commit = "a6975e7" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({ "vimwiki/vimwiki", commit = "7279261" })
  use({ "kevinhwang91/nvim-bqf", ft = "qf", commit = "ebb6d26" })
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
    commit = "a923f5f"
  })
  use({ "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig", commit = "8649f69" })
  use({ "folke/tokyonight.nvim", commit = "84ea0b5" })
  use({ "tjdevries/colorbuddy.nvim", commit = "8b96858" })

  -- colorschemes

  use("folke/tokyonight.nvim")
  use({ "tjdevries/colorbuddy.nvim" })

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
