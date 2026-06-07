return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
					update_root = false,
				},
			})
		end,
	},
}
