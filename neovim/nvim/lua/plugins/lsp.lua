return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			indent = { enable = true },
			folds = { enable = true },
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"MysticalDevil/inlay-hints.nvim",
		-- event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" }, -- optional
		config = function()
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						hints = {
							rangeVariableTypes = true,
							parameterNames = true,
							constantValues = true,
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							functionTypeParameters = true,
						},
					},
				},
			})
			-- vim.lsp.inlay_hint.enable()
			require("inlay-hints").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-tree/nvim-web-devicons", opts = {} },
		},
		opt = {},
		keys = {
			{
				"<leader>tf",
				"<cmd>Telescope find_files<cr>",
				desc = "搜索文件名",
			},
			{
				"<leader>tg",
				"<cmd>Telescope live_grep<cr>",
				desc = "搜索文件内容",
			},
			{
				"<leader>ts",
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				desc = "查找符号名",
			},
			{
				"<leader>tr",
				"<cmd>Telescope lsp_references<cr>",
				desc = "查找引用",
			},
			{
				"<leader>ti",
				"<cmd>Telescope lsp_implementations<cr>",
				desc = "查找实现",
			},
			{
				"<leader>td",
				"<cmd>Telescope lsp_definitions<cr>",
				desc = "转到定义",
			},
			{
				"<leader>tt",
				"<cmd>Telescope lsp_type_definitions<cr>",
				desc = "转类型定义",
			},
		},
	},
}
