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

			local textobjects_select = require("nvim-treesitter-textobjects.select")
			for _, mapping in ipairs({
				{ "af", "@function.outer" },
				{ "if", "@function.inner" },
				{ "ac", "@class.outer" },
				{ "ic", "@class.inner" },
			}) do
				local lhs, capture = mapping[1], mapping[2]
				vim.keymap.set({ "x", "o" }, lhs, function()
					textobjects_select.select_textobject(capture, "textobjects")
				end, { desc = "Select " .. capture })
			end

			local textobjects_move = require("nvim-treesitter-textobjects.move")
			for _, mapping in ipairs({
				{ "]M", "goto_next_end", "@function.outer" },
				{ "][", "goto_next_end", "@class.outer" },
				{ "[M", "goto_previous_end", "@function.outer" },
				{ "[]", "goto_previous_end", "@class.outer" },
				{ "]*", "goto_next_start", "@comment.outer" },
				{ "]/", "goto_next_start", "@comment.outer" },
				{ "[*", "goto_previous_start", "@comment.outer" },
				{ "[/", "goto_previous_start", "@comment.outer" },
			}) do
				local lhs, action, capture = mapping[1], mapping[2], mapping[3]
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					textobjects_move[action](capture, "textobjects")
				end, { desc = "Move to " .. capture })
			end

			for _, mapping in ipairs({
				{ "]m", "goto_next_start", "@function.outer" },
				{ "[m", "goto_previous_start", "@function.outer" },
				{ "]]", "goto_next_start", "@class.outer", "@function.outer" },
				{ "[[", "goto_previous_start", "@class.outer", "@function.outer" },
			}) do
				local lhs, action, preferred, fallback = unpack(mapping)
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
					local query = vim.treesitter.query.get(lang, "textobjects")
					local has_class = false
					local ok, parser = pcall(vim.treesitter.get_parser, 0, lang)
					if query and ok and parser then
						for _, tree in ipairs(parser:parse()) do
							for capture_id in query:iter_captures(tree:root(), 0) do
								if query.captures[capture_id] == "class.outer" then
									has_class = true
									break
								end
							end
							if has_class then
								break
							end
						end
					end
					local target = fallback and not has_class and fallback or preferred
					textobjects_move[action](target, "textobjects")
				end, { desc = "Move to function or class" })
			end

			vim.keymap.set("o", "gc", function()
				textobjects_select.select_textobject("@comment.outer", "textobjects")
			end, { desc = "Comment text object" })

			vim.keymap.set({ "n", "x" }, "[x", function()
				vim.treesitter.select("parent")
			end, { desc = "Select larger syntax node" })
			vim.keymap.set({ "n", "x" }, "]x", function()
				vim.treesitter.select("child")
			end, { desc = "Select smaller syntax node" })

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
