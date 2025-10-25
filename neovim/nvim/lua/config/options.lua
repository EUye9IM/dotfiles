local options = {
	-- clipboard = "unnamedplus",
	number = true,
	mouse = "nvi",
	list = true,
	listchars = {
		tab = "  `",
		lead = ".",
		trail = ".",
		extends = ">",
		precedes = "<",
	},
	wrap = false,
	ignorecase = true,
	-- tab
	tabstop = 4,
	shiftwidth = 4,
	expandtab = false,
	background = dark,
	encoding = "utf-8",
	fileformat = "unix",
	fileencodings = { "ucs-bom", "utf-8", "gb18030", "default", "latin1" },
	backspace = { "indent", "eol", "start" },
	undofile = true,
	swapfile = false,
	display = { "uhex", "lastline" },
	linebreak = true,
	cursorline = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.wo.colorcolumn = '121'
