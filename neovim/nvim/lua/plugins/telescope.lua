return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-tree/nvim-web-devicons", opts = {} },
			"jmacadie/telescope-hierarchy.nvim",
		},
		opts = {
			extensions = {
				hierarchy = {},
			},
		},
		config = function(_, opts)
			local t = require("telescope")
			local actions = require("telescope.actions")
			t.setup(vim.tbl_deep_extend("force", opts or {}, {
				defaults = {
					mappings = {
						i = { ["<C-w><Space>"] = actions.select_vertical },
						n = { ["<C-w><Space>"] = actions.select_vertical },
					},
				},
				pickers = {
					resume = {
						mappings = {
							i = { ["<C-w><Space>"] = actions.select_vertical },
							n = { ["<C-w><Space>"] = actions.select_vertical },
						},
					},
				},
			}))
			t.load_extension("hierarchy")
		end,
		keys = {},
	},
}
