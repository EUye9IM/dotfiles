-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost packer.lua source <afile> | PackerSync
-- augroup end
-- ]]

vim.cmd [[packadd packer.nvim]]

require('packer').init {
	display = {
		open_fn = function()
			return require("packer.util").
			float { border = "rounded" }
		end,
	},
}

return require('packer').startup(function(use)
	-- Packer itself
	use 'wbthomason/packer.nvim'
	-- lsp
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use "RRethy/vim-illuminate"
	use "jose-elias-alvarez/null-ls.nvim" -- formatters and linters

	-- cmp plugins
	use "hrsh7th/nvim-cmp"          -- The completion plugin
	use "hrsh7th/cmp-buffer"        -- buffer completions
	use "hrsh7th/cmp-path"          -- path completions
	use "hrsh7th/cmp-cmdline"       -- cmdline completions
	use "hrsh7th/cmp-nvim-lsp"      -- lsp completions
	use "saadparwaiz1/cmp_luasnip"  -- snippet completions
	-- snippets
	use "L3MON4D3/LuaSnip"          --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- theme
	use {
		"catppuccin/nvim",
		as = "catppuccin"
	}
	use "luochen1990/rainbow"
	use "windwp/nvim-autopairs"
	use "terrortylor/nvim-comment"
	-- statusline
	-- nerd fonts
	-- use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'kyazdani42/nvim-tree.lua'
	use { 'akinsho/bufferline.nvim', tag = "v3.*" }
	use { "akinsho/toggleterm.nvim", tag = '*' }

	use 'petertriho/nvim-scrollbar'
	use "lewis6991/gitsigns.nvim"


end)
