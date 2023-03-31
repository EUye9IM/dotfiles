local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- leadkey
vim.g.mapleader = ";"
keymap('n', ';;', ';', opts)

-- nvim tree
local nvim_tree_ok, _ = pcall(require, "nvim-tree")
if nvim_tree_ok then
	keymap('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', opts)
	keymap('n', '<leader>tf', '<cmd>NvimTreeFindFile<CR><C-w><C-w>', opts)
end

-- nvim-comment
local comment_ok, _ = pcall(require, "nvim_comment")
if comment_ok then
	-- Normal mode mapping left hand side
	local line_mapping = "<leader>c"
	-- Visual/Operator mapping left hand side
	local operator_mapping = "<leader>c"
	-- text object mapping, comment chunk,,
	local comment_chunk_text_object = "ic"

	keymap("n", line_mapping, "<Cmd>set operatorfunc=CommentOperator<CR>g@l", opts)
	-- keymap("n", operator_mapping, "<Cmd>set operatorfunc=CommentOperator<CR>g@", opts)
	keymap("x", operator_mapping, ":<C-u>call CommentOperator(visualmode())<CR>", opts)
	keymap(
		"x",
		comment_chunk_text_object,
		"<Cmd>lua require('nvim_comment').select_comment_chunk()<CR>",
		opts
	)
	keymap(
		"o",
		comment_chunk_text_object,
		"<Cmd>lua require('nvim_comment').select_comment_chunk()<CR>",
		opts
	)
end
