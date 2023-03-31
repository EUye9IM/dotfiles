local lsp_attach = function(client, bufnr)
	-- Create your keybindings here...
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	-- goto
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- 声明
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)  -- 定义
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- 实例
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)  -- 参考
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- 诊断信息
	-- 代码格式化
	keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
	-- hover
	keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
	keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
	keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
	keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end


local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
local lsp_ok, lsp = pcall(require, "lspconfig")
local nvim_lsp_ok, nvim_lsp = pcall(require, "cmp_nvim_lsp")
if mason_lsp_ok and lsp_ok and nvim_lsp_ok then
	local get_servers = mason_lsp.get_installed_servers
	local lsp_capabilities = nvim_lsp.default_capabilities()

	for _, server_name in ipairs(get_servers()) do
		lsp[server_name].setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
		})
	end
end

-- refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
if mason_lsp_ok and lsp_ok then
	mason_lsp.setup_handlers({
		-- you can provide targeted overrides for specific servers.
		--[[
		["lua_ls"] = function()
			lsp.lua_ls.setup {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }
						}
					}
				}
			}
		end,
		]]
	})
end
