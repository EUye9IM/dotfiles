return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
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
