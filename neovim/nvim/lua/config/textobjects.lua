-- Text object settings and mappings shared by the plain Neovim config and the
-- VS Code (vscode-neovim) config. Keep this module free of top-level `require`
-- calls so it is safe to load before plugins are installed.

local M = {}

---Options for `mini.ai`.
---@type table
M.mini_ai = {
	mappings = {
		around = "a",
		inside = "i",
		goto_left = "",
		goto_right = "",
	},
	custom_textobjects = {
		i = function(ai_type)
			local scope = require("mini.indentscope").get_scope()
			local from = math.max(1, scope.body.top - (ai_type == "a" and 1 or 0))
			local to = scope.body.bottom
			return {
				from = { line = from, col = 1 },
				to = { line = to, col = math.max(1, #vim.api.nvim_buf_get_lines(0, to - 1, to, false)[1]) },
				vis_mode = "V",
			}
		end,
		I = function(ai_type)
			local scope = require("mini.indentscope").get_scope()
			local from = math.max(1, scope.body.top - 1)
			local to = math.min(vim.api.nvim_buf_line_count(0), scope.body.bottom + 1)
			if ai_type == "i" then
				from = scope.body.top
				to = scope.body.bottom
			end
			return {
				from = { line = from, col = 1 },
				to = { line = to, col = math.max(1, #vim.api.nvim_buf_get_lines(0, to - 1, to, false)[1]) },
				vis_mode = "V",
			}
		end,
	},
}

---Options for `mini.indentscope`.
---@type table
M.mini_indentscope = {
	draw = {
		delay = 100,
	},
	symbol = "│",
	options = { try_as_border = true },
	mappings = {
		object_scope = "",
		object_scope_with_border = "",
		goto_top = "[i",
		goto_bottom = "]i",
	},
}

---Register the Tree-sitter based text objects and motions.
---Requires `nvim-treesitter` and `nvim-treesitter-textobjects` to be loaded.
function M.setup_treesitter()
	local textobjects_select = require("nvim-treesitter-textobjects.select")
	local textobjects_move = require("nvim-treesitter-textobjects.move")

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
end

return M
