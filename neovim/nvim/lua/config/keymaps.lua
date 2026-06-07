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

-- Project search
vim.keymap.set("n", "g/", "<cmd>Telescope live_grep<cr>", { desc = "项目搜索" })
