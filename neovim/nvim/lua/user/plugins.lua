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

local comment_ok, comment = pcall(require, "nvim_comment")
if comment_ok then
	comment.setup({
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = false,
  -- trim empty comment whitespace
  comment_empty_trim_whitespace = true,
  -- Should key mappings be created
  create_mappings = false,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
  -- text object mapping, comment chunk,,
  comment_chunk_text_object = "ic",
  -- Hook function to call before commenting takes place
  hook = nil
})
end

local nvim_tree_ok, nvim_tree = pcall(require, "nvim-tree")
if nvim_tree_ok then
	nvim_tree.setup {}
end
