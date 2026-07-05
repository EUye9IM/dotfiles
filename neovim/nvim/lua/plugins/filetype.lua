return {
	{
		"fei6409/log-highlight.nvim",
		ft = "log",
		opts = {},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
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
				textobject_field_inner = { "if", mode = { "o", "x" } },
				textobject_field_outer = { "af", mode = { "o", "x" } },
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
