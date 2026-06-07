return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		keys = {
			{
				"]c",
				function()
					require("gitsigns").nav_hunk("next", { target = "all" })
				end,
				desc = "下一个变更",
			},
			{
				"[c",
				function()
					require("gitsigns").nav_hunk("prev", { target = "all" })
				end,
				desc = "上一个变更",
			},
			{ "do", "<cmd>Gitsigns preview_hunk<cr>", desc = "展开 hunk" },
			{ "dp", "<cmd>Gitsigns reset_hunk<cr>", desc = "恢复 hunk" },
			{ "dU", "<cmd>Gitsigns stage_hunk<cr>", desc = "暂存 hunk" },
			{
				"du",
				function()
					require("gitsigns").undo_stage_hunk()
				end,
				desc = "取消暂存 hunk",
			},
			{
				"dO",
				function()
					require("gitsigns").stage_hunk()
				end,
				desc = "切换暂存状态",
			},
		},
	},
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = true,
			message_template = "<sha> - <author> (<date>) <summary>",
			date_format = "%Y-%m-%d %H:%M:%S",
			virtual_text_column = 0,
		},
	},
	{
		"sindrets/diffview.nvim",
		opts = {},
	},
}
