if vim.env.SSH_TTY ~= nil or vim.env.SSH_CONNECTION ~= nil then
	vim.g.low_bandwidth = true
end
