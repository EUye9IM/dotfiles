return {
	{
		"vim-test/vim-test",
		config = function()
			vim.g["test#strategy"] = "toggleterm"
			vim.g["test#go#gotest#options"] = "-v -count=1 -gcflags=all=-l"
		end,
		keys = {
			{ "<localleader>tt", "<cmd>TestNearest<CR>", desc = "运行光标处测试用例" },
			{ "<localleader>tl", "<cmd>TestLast<CR>", desc = "运行上一次测试用例" },
			{ "<localleader>tv", "<cmd>TestVisit<CR>", desc = "运行上一次测试用例" },
		},
	},
}
