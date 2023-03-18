-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]]

vim.cmd [[packadd packer.nvim]]

require('packer').init{
	display = {
		open_fn = function()
			return require("packer.util").
			float{ border = "rounded" }
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

	-- cmp plugins
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp" -- lsp completions
	-- snippets
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- theme
	use {
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			require('catppuccin').setup({
				custom_highlights = function(colors)
					return {
						LineNr = { fg = colors.overlay0 },
					}
				end,
				transparent_background = true,
			})
			vim.cmd("colorscheme catppuccin-frappe")
		end
	}
	use {
		"luochen1990/rainbow",
		config = function()
			vim.g["rainbow_active"] = 1
		end
	}
	-- statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = "require('lualine').setup()",
	}

end)




