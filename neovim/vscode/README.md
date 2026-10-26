# VS Code（vscode-neovim）

本目录保存 [vscode-neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) 所需的 VS Code 侧配置，让仓库里的 Neovim 快捷键方案在 VS Code 中尽量保持一致。

`keybindings.json` 是本配置对 VS Code 快捷键的补充；完整的按键清单见 [../keybindings.md](../keybindings.md)。

## 工作原理

vscode-neovim 会启动一个真实的 Neovim 进程并复用本仓库的 `init.lua`，所以：

- `nvim/lua/config/options.lua` 和 `nvim/lua/config/keymaps.lua` 中定义的按键会生效。
- `nvim/lua/config/lazy.lua` 检测到 `vim.g.vscode` 时，不再加载完整的 `plugins/`，而是加载 `nvim/lua/config/vscode.lua` 中的**编辑器类插件子集**。
- 语言服务、补全、诊断、文件树、搜索和终端由 VS Code 提供，不再重复启动 Neovim 侧实现。

## 安装

1. 安装 vscode-neovim 扩展，并确保 `nvim` 在 `PATH` 中（或通过 `vscode-neovim.neovimExecutablePaths.darwin` 等设置指定路径）。
2. 打开命令面板，执行 `Preferences: Open Keyboard Shortcuts (JSON)`。
3. 把 [`keybindings.json`](keybindings.json) 中的数组项合并进用户 `keybindings.json`。

> VS Code 用户配置不在本仓库内，这里只保留一份可复制的版本。修改仓库文件不会自动更新 VS Code 配置。

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

未加载的插件包括 lualine、bufferline、nvim-tree、Telescope、nvim-cmp、mason/lspconfig、gitsigns、conform、vim-test、toggleterm、ts-comments 等，它们要么由 VS Code 负责，要么在 VS Code 中没有可靠对应。

## 由 VS Code 接管的快捷键

`keybindings.json` 将以下按键交给 VS Code 命令；其余按键仍由 Neovim 处理。

| 按键 | VS Code 命令 |
|---|---|
| `gd` / `gD` / `gy` / `gI` / `gA` | 定义 / 声明 / 类型定义 / 实现 / 引用 |
| `gs` / `gS` | 文件符号 / 工作区符号 |
| `gh` / `g.` | hover / quick fix |
| `cd` | 重命名 |
| `]d` / `[d` / `g]` / `g[` | 下一个 / 上一个诊断（跨文件） |
| `g/` | 全项目搜索 |
| `<leader>f`（空格 `f`） | 格式化文档 |
| `<leader>w`（空格 `w`） | 切换自动换行 |
| `<C-\>` | 切换 VS Code 终端 |
| `]c` / `[c` | 下一个 / 上一个 Git 变更 |

说明：`gd`、`gh` 与扩展自带绑定相同，这里显式写出只是为了自包含，可按需删除。

## 未移植的快捷键

| 快捷键 | 原因 |
|---|---|
| `g<Space>` | Zed 搜索 excerpt 在 VS Code 无对应；Telescope 未加载 |
| `<leader>ss` | 会话管理由 VS Code 负责，无对应插件 |
| `<leader>?` | which-key 未加载 |
| `<localleader>tt` / `tl` / `tv` | vim-test 未加载；VS Code 用 Testing 面板 |
| `<localleader>vm` / `vc` | render-markdown / csvview 未加载；Markdown 用 VS Code 预览 |
| `do` / `dp` / `dU` / `du` / `dO` | Git hunk 暂存语义与 Gitsigns 不同，暂不移植 |
| `gl` / `ga` / `g>` | 多光标由 VS Code 原生提供，按键未对齐 |
| `[x` / `]x` 等 Tree-sitter 高亮 | 高亮由 VS Code 提供；文本对象仍可用 |

## 已知差异

- `]d` / `[d` 在 VS Code 中使用跨文件诊断（`marker.nextInFiles`），与 Neovim 的缓冲区内跳转略有不同。
- `:e` / `:q` / `:vsplit` 等文件与窗口命令会被 vscode-neovim 改写为 VS Code 行为。
- 若某个按键没有生效，先用 `Developer: Inspect Key Mapping` 确认 VS Code 是否拦截了它。
