# VS Code（vscode-neovim）

本目录说明如何在 [vscode-neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) 中使用这套 Neovim 配置。

**这里不修改 VS Code 自己的配置。** 所有按键都定义在 Neovim 侧（`nvim/lua/config/keymaps.lua` 与 `nvim/lua/config/vscode.lua`），不新增、不修改 VS Code 的 `keybindings.json` 或 `settings.json`。

## 工作原理

vscode-neovim 会启动一个真实的 Neovim 进程并复用本仓库的 `init.lua`：

- `nvim/lua/config/options.lua` 和 `nvim/lua/config/keymaps.lua` 中定义的按键会生效。
- `nvim/lua/config/lazy.lua` 检测到 `vim.g.vscode` 时，不加载完整的 `plugins/`，而是加载 `nvim/lua/config/vscode.lua` 里的**编辑器类插件子集**。
- 语言服务、补全、诊断、文件树和终端由 VS Code 提供。

## VS Code 下加载的插件

来自 `nvim/lua/config/vscode.lua`：

| 插件 | 说明 |
|---|---|
| `nvim-treesitter` + `nvim-treesitter-textobjects` | 仅注册文本对象与跳转，不启用高亮和缩进 |
| `nvim-surround` | `ys` / `cs` / `ds` |
| `vim-exchange` | `cx` / `X` |
| `ReplaceWithRegister` | `gR` |
| `mini.ai` | `aa` / `ia` / `at` / `it` 等文本对象 |
| `mini.indentscope` | 仅提供缩进范围计算，关闭绘制以避免与 VS Code 渲染冲突 |

lualine、bufferline、nvim-tree、Telescope、nvim-cmp、mason/lspconfig、gitsigns、conform、vim-test、toggleterm、ts-comments 等不加载。

## VS Code 命令的来源

vscode-neovim 自带一层桥接：它把 `vim.lsp.buf.*` 重写成对应的 VS Code 命令，因此现有的 LSP 映射（`gd`、`gh`、`g.`、`cd`、`gs`、`gS`、`gA` 等）无需额外配置。

桥接没有覆盖的部分，在 `nvim/lua/config/keymaps.lua` 的 `vim.g.vscode` 分支里通过 `require("vscode").action(...)` 调用 VS Code 命令：

| 按键 | VS Code 命令 | 原因 |
|---|---|---|
| `gd` / `gD` / `gy` / `gI` | `editor.action.revealDefinition` 等 | 桥接默认是 peek 预览，这里改为直接跳转 |
| `]d` / `[d` / `g]` / `g[` | `editor.action.marker.nextInFiles` / `prevInFiles` | `vim.diagnostic` 没有桥接 |
| `g/` | `workbench.action.findInFiles` | 全局搜索由 VS Code 负责 |
| `<leader>f` | `editor.action.formatDocument` | conform 未加载 |
| `<leader>w` | `editor.action.toggleWordWrap` | 换行由 VS Code 控制 |
| `]c` / `[c` | `editor.action.dirtydiff.next` / `previous` | Gitsigns 未加载 |

## 已知限制

- `<C-\>`（终端切换）无法从 Neovim 侧映射：vscode-neovim 默认只把 `ctrlKeysForNormalMode` 白名单里的组合键转发给 Neovim，`\` 不在其中。若要使用，可在 VS Code 设置里把 `\` 加入该白名单，或改用 VS Code 内置的终端快捷键。
- `]d` / `[d` 使用跨文件诊断跳转，与普通 Neovim 的缓冲区内跳转略有不同。
- `:e` / `:q` / `:vsplit` 等文件与窗口命令会被 vscode-neovim 改写为 VS Code 行为。
- vscode-neovim 只转发它白名单内的特殊组合键；不在白名单内的 Ctrl/Alt 组合由 VS Code 处理，Neovim 侧映射不会触发。

## 未移植的快捷键

| 快捷键 | 原因 |
|---|---|
| `g<Space>` | Zed 搜索 excerpt 在 VS Code 无对应；Telescope 未加载 |
| `<leader>ss` | 会话管理由 VS Code 负责 |
| `<leader>?` | which-key 未加载 |
| `<localleader>tt` / `tl` / `tv` | vim-test 未加载；VS Code 用 Testing 面板 |
| `<localleader>vm` / `vc` | render-markdown / csvview 未加载 |
| `do` / `dp` / `dU` / `du` / `dO` | Git hunk 暂存语义与 Gitsigns 不同，暂不移植 |
| `gl` / `ga` / `g>` | 多光标由 VS Code 原生提供，按键未对齐 |
