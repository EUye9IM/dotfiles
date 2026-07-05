return {
	{
		"tommcdo/vim-exchange",
		event = "VeryLazy",
	},
	{
		"vim-scripts/ReplaceWithRegister",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "gR", "gr", { remap = true, desc = "替换不覆盖寄存器" })
			vim.keymap.set("x", "gR", "gr", { remap = true, desc = "替换不覆盖寄存器" })
		end,
	},
}
