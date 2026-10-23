return {
	{
		"echasnovski/mini.ai",
		version = false,
		event = "VeryLazy",
		opts = {
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
		},
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = "VeryLazy",
		opts = {
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
		},
	},
}
