local lsp_attach = function(client, bufnr)
  -- Create your keybindings here...
end


local mason_lsp_ok, mason_lsp = pcall(require, "mason-lspconfig")
local lsp_ok, lsp = pcall(require, "lspconfig")
if mason_lsp_ok and lsp_ok then
	local get_servers = mason_lsp.get_installed_servers
	for _, server_name in ipairs(get_servers()) do
		lsp[server_name].setup({
			on_attach = lsp_attach,
			capabilities = lsp_capabilities,
		})
	end
end

