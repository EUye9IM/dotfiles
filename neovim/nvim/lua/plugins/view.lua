return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight-night]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{ "dstein64/nvim-scrollview", opts = {} },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{
		"karb94/neoscroll.nvim",
		opts = { easing = "sine" },
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {--[[ things you want to change go here]]
			open_mapping = [[<c-\>]],
		},
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"fei6409/log-highlight.nvim",
		ft = "log",
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		ft = "markdown",
		keys = {
			{
				"<localleader>vm",
				ft = "markdown",
				"<cmd>RenderMarkdown toggle<cr>",
				desc = "Markdown view toggle",
			},
		},
	},
	{
		"hat0uma/csvview.nvim",
		---@module "csvview"
		---@type CsvView.Options
		opts = {
			parser = { comments = { "#", "//" } },
			keymaps = {
				-- Text objects for selecting fields
				textobject_field_inner = { "if", mode = { "o", "x" } },
				textobject_field_outer = { "af", mode = { "o", "x" } },
				-- Excel-like navigation:
				-- Use <Tab> and <S-Tab> to move horizontally between fields.
				-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
				-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
				jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
				jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
				jump_next_row = { "<Enter>", mode = { "n", "v" } },
				jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
			},
		},
		ft = "csv",
		keys = {
			{
				"<localleader>vc",
				ft = "csv",
				"<cmd>CsvViewToggle<cr>",
				desc = "Csv view toggle",
			},
		},
		cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
	},
}
