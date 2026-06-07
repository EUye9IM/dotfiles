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
		keys = {
			{ "<leader>to", "<cmd>Telescope hierarchy incoming_calls<cr>", desc = "查找调用树" },
			{ "<leader>tf", "<cmd>Telescope find_files<cr>", desc = "搜索文件名" },
			{ "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "搜索文件内容" },
			{ "<leader>ts", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "查找符号名" },
			{ "<leader>tr", "<cmd>Telescope lsp_references<cr>", desc = "查找引用" },
			{ "<leader>ti", "<cmd>Telescope lsp_implementations<cr>", desc = "查找实现" },
			{ "<leader>td", "<cmd>Telescope lsp_definitions<cr>", desc = "转到定义" },
			{ "<leader>tt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "转类型定义" },
		},
	},
}
