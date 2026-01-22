-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
local formatters_by_ft = {
	lua = { "stylua" },
	markdown = { "markdownlint" },
	rust = { "rustfmt" },
	go = { "goimports" },
	python = { "black" },
	-- ["*"] = {"codespell"},
	-- ["_"] = { "trim_whitespace" }
}

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	-- This will provide type hinting with LuaLS
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = formatters_by_ft,
		default_format_opts = { lsp_format = "fallback" },
		notify_no_formatters = false,
	},
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
