local mason_ok, mason = pcall(require, "mason")
if mason_ok then
	mason.setup()
end
local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
if mason_lsp_ok then
	mason_lsp.setup()
end

local catppuccin_ok, catppuccin = pcall(require, "catppuccin")
if catppuccin_ok then
	catppuccin.setup({
		custom_highlights = function(colors)
			return {
				LineNr = { fg = colors.overlay0 },
			}
		end,
		transparent_background = true,
	})
	vim.cmd("colorscheme catppuccin-frappe")
end

local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
	lualine.setup()
end

local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if autopairs_ok then
	autopairs.setup {}
end

local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if nvim_tree_ok then
	nvim_tree.setup {}
end
