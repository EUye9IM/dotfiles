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
				-- NvimTreeNormal = { bg = colors.none },
				-- Normal = { bg = colors.none },
				-- Visual = { bg = colors.none },
				LineNr = { fg = colors.overlay0 },
			}
		end,
		transparent_background = true,
	})
	vim.cmd("colorscheme catppuccin-frappe")
end

local rainbow_ok, _ = pcall(require, "rainbow")
if rainbow_ok then
	vim.g["rainbow_active"] = 1
end

local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
	lualine.setup({
		-- nerd fonts
		-- [[
		options = {
			icons_enabled = false,
			component_separators = { left = '|', right = '|' },
			section_separators = { left = '', right = '' },
		}
		-- ]]
	})
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
	nvim_tree.setup {
		hijack_cursor = true,
		hijack_unnamed_buffer_when_opening = true,
		-- nerd fonts
		-- [[
		renderer = {
			indent_markers = {
				enable = true,
				icons = {
					corner = "╰",
					edge = "│",
					item = "├",
					bottom = "─",
					none = " ",
				},
			},
			icons = {
				webdev_colors = false,
				show = {
					file = false,
					folder = false,
					folder_arrow = true,
					git = true,
					modified = true,
				},
				glyphs = {
					modified = "●",
					folder = {
						arrow_closed = "⮞",
						arrow_open = "⮟",
					},
					git = {
						unstaged = "✕",
						staged = "✓",
						unmerged = "⫛",
						renamed = "➜",
						untracked = "★",
						deleted = "▬",
						ignored = "○",
					},
				}
			},
		},
		-- ]]
		hijack_directories = {
			enable = true,
			auto_open = true,
		},
	}
end

local bufferline_ok, bufferline = pcall(require, "bufferline")
if bufferline_ok then
	vim.opt.termguicolors = true
	bufferline.setup({
		options = {
			numbers = function(opts)
				return string.format('%s.%s', opts.ordinal, opts.lower(opts.id))
			end,
			indicator = {
				style = 'underline',
			},
			buffer_close_icon = '✕',
			modified_icon = '●',
			close_icon = '✗',
			left_trunc_marker = '⯇',
			right_trunc_marker = '⯈',
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "NvimTree",
					text = function()
						return vim.fn.getcwd()
					end,
					highlight = "Directory",
					separator = true -- use a "true" to enable the default, or set your own character
				}
			},
			-- nerd fonts
			-- [[
			show_buffer_icons = false,
			-- ]]
		}
	})
end

local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if toggleterm_ok then
	toggleterm.setup({
		start_in_insert = true,
		persist_mode = false,
		winbar = {
			enabled = true,
		},
	})
end
