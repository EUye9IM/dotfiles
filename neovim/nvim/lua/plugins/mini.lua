local textobjects = require("config.textobjects")

return {
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
