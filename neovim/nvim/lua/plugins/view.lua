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
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{
				"f-person/git-blame.nvim",
				opts = {
					message_template = "<sha> - <author> (<date>) <summary>", -- template for the blame message, check the Message template section for more options
					date_format = "%Y-%m-%d %H:%M:%S", -- template for the date, check Date format section for more options
					virtual_text_column = 0,
				},
			},
		},
		config = function()
			local git_blame = require("gitblame")
			vim.g.gitblame_display_virtual_text = 0
			vim.g.gitblame_delay = 10
			require("lualine").setup({
				sections = {
					lualine_c = {
						"filename",
						{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
					},
				},
			})
		end,
	},
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = true, -- if you want to enable the plugin
			-- message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			-- date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			-- virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
		},
	},
	{ "dstein64/nvim-scrollview", opts = {} },
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			---@type nvim_tree.config
			opt = {
				update_focused_file = {
					enable = true,
					update_root = true,
				},
			}
			require("nvim-tree").setup(opt)
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
	{
		"sindrets/diffview.nvim",
		opts = {},
	},
}
