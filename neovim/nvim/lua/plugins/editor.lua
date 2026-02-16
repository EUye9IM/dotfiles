return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{ "folke/ts-comments.nvim", event = "VeryLazy", opts = {} },
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			vim.o.foldcolumn = "1"
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			require("ufo").setup()
		end,
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		dependencies = { "nvim-telescope/telescope.nvim" },
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~", "/" },
			bypass_save_filetypes = { "alpha" },
			session_lens = {
				picker = "telescope", -- "telescope"|"snacks"|"fzf"|"select"|nil Pickers are detected automatically but you can also manually choose one. Falls back to vim.ui.select
				load_on_setup = true,
			},
		},
		keys = {
			{ "<leader>ss", "<cmd>AutoSession search<cr>", desc = "查找会话" },
		},
	},
	-- {
	-- 	"goolord/alpha-nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		local startify = require("alpha.themes.startify")
	-- 		-- available: devicons, mini, default is mini
	-- 		-- if provider not loaded and enabled is true, it will try to use another provider
	-- 		startify.file_icons.provider = "devicons"
	-- 		require("alpha").setup(startify.config)
	-- 	end,
	-- },
}
