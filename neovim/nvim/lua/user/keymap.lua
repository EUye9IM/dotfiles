-- leadkey
vim.g.mapleader = ";"


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- mouse wheel
-- map("n", "<ScrollWheelUp>", "<C-Y>", opts)
-- map("n", "<ScrollWheelDown>", "<C-E>", opts)
local nvim_tree_ok, _ = pcall(require, "nvim-tree")
if nvim_tree_ok then
	keymap('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', opts)
	keymap('n', '<leader>tf', '<cmd>NvimTreeFindFile<CR><C-w><C-w>', opts)
end
