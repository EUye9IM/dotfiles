-- Plugin set for VS Code (vscode-neovim).
--
-- Inside VS Code the editor itself provides highlighting, LSP, completion,
-- diagnostics, file management and terminals, so those plugins are intentionally
-- skipped. Only editing helpers that do not fight VS Code are loaded here.
--
-- See `neovim/vscode/README.md` for the matching VS Code keybindings.

local textobjects = require("config.textobjects")

-- `mini.indentscope` would draw a scope guide; VS Code owns the rendering, so
-- keep the module for its range computation but turn the drawing off.
vim.g.miniindentscope_disable = true

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup()
			require("nvim-treesitter-textobjects").setup({
				select = { lookahead = true },
				move = { set_jumps = true },
			})
			-- Text objects/motions only: no `vim.treesitter.start`, no indentexpr.
			require("config.textobjects").setup_treesitter()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
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
	{
		"echasnovski/mini.ai",
		version = false,
		event = "VeryLazy",
		opts = textobjects.mini_ai,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		opts = textobjects.mini_indentscope,
	},
}
