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
		opt = {
			extensions = {
				hierarchy = {},
			},
		},
		config = function(_, opts)
			local t = require("telescope")
			t.setup(opts)
			t.load_extension("hierarchy")
		end,
		keys = {},
	},
}
