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
			require("config.textobjects").setup_treesitter()

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("NvimTreesitter", { clear = true }),
				callback = function(event)
					local name = vim.api.nvim_buf_get_name(event.buf)
					local ok, stats = pcall(vim.uv.fs_stat, name)
					if ok and stats and stats.size > 100 * 1024 then
						return
					end

					local has_parser, parser = pcall(vim.treesitter.get_parser, event.buf)
					if not has_parser or not parser then
						return
					end

					pcall(vim.treesitter.start, event.buf)
					vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
