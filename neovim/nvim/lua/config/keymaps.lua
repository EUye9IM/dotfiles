-- LSP navigation (Zed Vim mode alignment)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "转到定义" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "转到声明" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "转到类型定义" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "转到实现" })
vim.keymap.set("n", "gA", vim.lsp.buf.references, { desc = "查找引用" })
vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, { desc = "文件内符号" })
vim.keymap.set("n", "gS", vim.lsp.buf.workspace_symbol, { desc = "项目符号" })
vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "显示信息" })
vim.keymap.set("n", "g.", vim.lsp.buf.code_action, { desc = "代码操作" })
vim.keymap.set("n", "cd", vim.lsp.buf.rename, { desc = "重命名" })

-- Diagnostics
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "下一个诊断" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "上一个诊断" })
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, { desc = "下一个诊断" })
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, { desc = "上一个诊断" })

-- Project search (Telescope is not available in VS Code)
if not vim.g.vscode then
	vim.keymap.set("n", "g/", "<cmd>Telescope live_grep<cr>", { desc = "项目搜索" })
	vim.keymap.set("n", "g<Space>", "<cmd>Telescope resume<cr>", { desc = "打开当前搜索结果" })
end
vim.keymap.set("n", "<C-w>gd", function()
	vim.cmd("vsplit")
	vim.lsp.buf.definition()
end, { desc = "分屏跳转到定义" })
vim.keymap.set("n", "<C-w>gD", function()
	vim.cmd("vsplit")
	vim.lsp.buf.type_definition()
end, { desc = "分屏跳转到类型定义" })

-- VS Code (vscode-neovim)
--
-- vscode-neovim already bridges `vim.lsp.buf.*` to VS Code commands, so the LSP
-- mappings above work unchanged. The mappings below cover what it does not
-- bridge, plus a few overrides where the bridge uses a "peek" variant while we
-- want a real jump. Everything stays in the Neovim config: no entries are added
-- to VS Code's own `keybindings.json`.
if vim.g.vscode then
	local function action(name)
		return function()
			require("vscode").action(name)
		end
	end

	-- Jump instead of the bridge's peekDefinition/peekDeclaration/... variants.
	vim.keymap.set("n", "gd", action("editor.action.revealDefinition"), { desc = "转到定义" })
	vim.keymap.set("n", "gD", action("editor.action.revealDeclaration"), { desc = "转到声明" })
	vim.keymap.set("n", "gy", action("editor.action.goToTypeDefinition"), { desc = "转到类型定义" })
	vim.keymap.set("n", "gI", action("editor.action.goToImplementation"), { desc = "转到实现" })

	-- Diagnostics: `vim.diagnostic` is not bridged.
	vim.keymap.set("n", "]d", action("editor.action.marker.nextInFiles"), { desc = "下一个诊断" })
	vim.keymap.set("n", "[d", action("editor.action.marker.prevInFiles"), { desc = "上一个诊断" })
	vim.keymap.set("n", "g]", action("editor.action.marker.nextInFiles"), { desc = "下一个诊断" })
	vim.keymap.set("n", "g[", action("editor.action.marker.prevInFiles"), { desc = "上一个诊断" })

	-- Search / format / wrapping.
	vim.keymap.set("n", "g/", action("workbench.action.findInFiles"), { desc = "项目搜索" })
	vim.keymap.set({ "n", "x" }, "<leader>f", action("editor.action.formatDocument"), { desc = "格式化" })
	vim.keymap.set("n", "<leader>w", action("editor.action.toggleWordWrap"), { desc = "切换换行" })

	-- Git gutter navigation (Gitsigns is not loaded in VS Code).
	vim.keymap.set("n", "]c", action("editor.action.dirtydiff.next"), { desc = "下一个变更" })
	vim.keymap.set("n", "[c", action("editor.action.dirtydiff.previous"), { desc = "上一个变更" })
end
