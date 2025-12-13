vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if not vim.g.vscode then
	require("config.lazy")
end
require("config.options")

