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


