return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"f-person/git-blame.nvim",
		},
		config = function()
			local git_blame = require("gitblame")
			vim.g.gitblame_display_virtual_text = 0
			vim.g.gitblame_delay = 10
			require("lualine").setup({
				sections = {
					lualine_c = {
						{
							"filename",
							file_status = true,
							path = 1,
							shorting_target = 40,
						},
						{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
					},
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"dstein64/nvim-scrollview",
		opts = {},
	},
	{
		"karb94/neoscroll.nvim",
		opts = { easing = "sine" },
	},
}
