return {
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = "VeryLazy",
		init = function()
			vim.g.VM_default_mappings = 0
			vim.g.VM_maps = {
				["Find Under"] = "gl",
				["Find Subword Under"] = "gl",
				["Select All"] = "ga",
				["Skip Region"] = "g>",
			}
		end,
	},
}
