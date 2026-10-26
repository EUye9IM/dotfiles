# Zed Vim Mode / Neovim / VS Code 快捷键对照

三套环境：

- **Zed**：Zed 官方 Vim mode 的默认按键。
- **Neovim**：本仓库配置下的普通 Neovim。
- **VS Code**：vscode-neovim 扩展 + 本仓库配置（见 [vscode/README.md](vscode/README.md)）。

状态标记：`✅` 一致 | `⚠️` 有差异 | `❌` 缺失 | `➕` 该环境独有。

完整按键清单见[快捷键说明](keybindings.md)，这里只记录与 Zed 的对照和差异。

---

## 1. LSP 导航与重构

| Zed | 功能 | Neovim | VS Code | 状态 |
|---|---|---|---|---|
| `g d` | 转到定义 | `gd` | `gd` | ✅ |
| `g D` | 转到声明 | `gD` | `gD` | ✅ |
| `g y` | 转到类型定义 | `gy` | `gy` | ✅ |
| `g I` | 转到实现 | `gI` | `gI` | ✅ |
| `g A` | 查找引用 | `gA` | `gA` | ✅ |
| `g s` / `g S` | 文件内 / 项目符号 | `gs` / `gS` | `gs` / `gS` | ✅ |
| `g h` | hover | `gh` | `gh` | ✅ |
| `c d` | 重命名 | `cd` | `cd` | ✅ |
| `g .` | 代码操作 | `g.` | `g.` | ⚠️ |

`g .` 差异：VS Code 下经扩展桥接后是 `editor.action.sourceAction`，只列重构类操作；Zed 与 Neovim 会列出全部 code action。需要 quick fix 时在 VS Code 用扩展提供的 `z=` 或 `Ctrl+.`。

VS Code 侧来源：扩展覆盖 `runtime/vscode/overrides/vscode-code-actions.vim` 与 `runtime/vscode/lsp/buf.lua`；`gD` / `gy` / `gI` 由本仓库在 `config/keymaps.lua` 的 `vim.g.vscode` 分支覆盖为跳转（扩展桥接默认是 peek 预览）。

## 2. 诊断导航

| Zed | 功能 | Neovim | VS Code | 状态 |
|---|---|---|---|---|
| `] d` / `[ d` | 下一个 / 上一个诊断 | `]d` / `[d` | `]d` / `[d` | ⚠️ |
| `g ]` / `g [` | 诊断别名 | `g]` / `g[` | `g]` / `g[` | ⚠️ |

差异：VS Code 使用 `marker.nextInFiles` / `prevInFiles`，是**跨文件**跳转；Zed 和 Neovim 是文件内跳转。原因是扩展没有桥接 `vim.diagnostic`，只能在 `config/keymaps.lua` 里用 `require("vscode").action(...)` 补。

## 3. Tree-sitter 移动与选择

| Zed | 功能 | Neovim | VS Code | 状态 |
|---|---|---|---|---|
| `] m` / `[ m` | 下一个 / 上一个方法开始 | `]m` / `[m` | `]m` / `[m` | ⚠️ |
| `] M` / `[ M` | 方法结束 | `]M` / `[M` | `]M` / `[M` | ⚠️ |
| `] ]` / `[ [` | 节 / 类开始 | `]]` / `[[` | `]]` / `[[` | ⚠️ |
| `] [` / `[ ]` | 节 / 类结束 | `][` / `[]` | `][` / `[]` | ⚠️ |
| `] /` `] *` | 下一个注释 | `]/` `]*` | `]/` `]*` | ⚠️ |
| `[ /` `[ *` | 上一个注释 | `[/` `[*` | `[/` `[*` | ⚠️ |
| `[ x` / `] x` | 语法节点增量选择 | `[x` / `]x` | `[x` / `]x` | ⚠️ |

差异：结构定义来自 Tree-sitter query。Neovim 与 VS Code 用的是 nvim-treesitter 的 `textobjects.scm`，Zed 用它自己语言扩展的 query，同一语言下节点边界可能不同。Neovim 的 `[[` / `]]` 在没有类节点时会回退到函数，这是本仓库的额外行为。

VS Code 下 Tree-sitter 只用于文本对象和跳转，不高亮（高亮由 VS Code 负责），见 `config/vscode.lua`。

## 4. 文本对象

| Zed | 功能 | Neovim | VS Code | 状态 |
|---|---|---|---|---|
| `a c` / `i c` | 类 | `ac` / `ic` | `ac` / `ic` | ⚠️ |
| `a f` / `i f` | 函数 | `af` / `if` | `af` / `if` | ⚠️ |
| `a a` / `i a` | 参数 | `aa` / `ia` | `aa` / `ia` | ✅ |
| `a t` / `i t` | HTML 标签 | `at` / `it` | `at` / `it` | ✅ |
| `a i` / `i i` | 缩进范围 | `ai` / `ii` | `ai` / `ii` | ⚠️ |
| `a I` / `i I` | 缩进范围含前后行 | `aI` / `iI` | `aI` / `iI` | ⚠️ |
| `g c` | 注释 | `gc` / `gcc` | `gc` / `gcc` | ⚠️ |

差异：

- 类 / 函数对象依赖 language query（同第 3 节）。
- 缩进范围用 `mini.indentscope` 的范围计算，VS Code 下关闭绘制，与 Zed 的 indent scope 不是同一套实现。
- 注释：Neovim 与 VS Code 都走内建 `gc` + `commentstring`。VS Code 下 `ts-comments.nvim` 未加载（扩展 runtime 也没有处理 `commentstring`），嵌入语言和特殊节点的判断可能不如原生 Neovim 准确。

## 5. Git

| Zed | 功能 | Neovim | VS Code | 状态 |
|---|---|---|---|---|
| `] c` / `[ c` | 下一个 / 上一个变更 | `]c` / `[c` | `]c` / `[c` | ✅ |
| `d o` | 预览 hunk | `do` | ❌ | 见下 |
| `d p` | 恢复 hunk | `dp` | ❌ | 见下 |
| `d U` | 暂存并前进 | `dU`（仅暂存） | ❌ | 见下 |
| `d u` | 取消暂存并前进 | `du`（撤销上次暂存） | ❌ | 见下 |
| `d O` | 切换暂存状态 | `dO`（不可靠） | ❌ | 见下 |

差异：Zed 在 diff view 里的 `du` / `dU` 是「暂存/取消暂存并跳到下一个」，与 Gitsigns 的 `stage_hunk()` / `undo_stage_hunk()` 语义不同，之前决定不做可能误操作的简单换键。VS Code 下 Gitsigns 未加载，这几个键缺失。

`]c` / `[c` 在 VS Code 下改用 `editor.action.dirtydiff.next` / `previous`（Gitsigns 未加载）。

## 6. 多光标

| Zed | 功能 | Neovim | VS Code | 状态 |
|---|---|---|---|---|
| `g l` | 添加下一个相同词 | `gl` | ❌ | ⚠️ |
| `g L` | 添加上一个相同词 | ❌ | ❌ | ❌ |
| `g a` | 选中所选词全部 | `ga` | ❌ | ⚠️ |
| `g >` | 跳过后添加下一个 | `g>` | ❌ | ⚠️ |
| `g <` | 跳过后添加上一个 | ❌ | ❌ | ❌ |
| `g A` / `g I` | 选区每行行尾 / 行首加光标 | ❌ | ❌ | ❌ |

差异：Neovim 用 `vim-visual-multi`，VS Code 用 VS Code 自己的多光标（`Ctrl+D` 等）。扩展还推荐 [vscode-multi-cursor.nvim](https://github.com/vscode-neovim/vscode-multi-cursor.nvim)，本仓库没装。这是 Vim 生态里两个不同的多光标实现，按键未对齐。

注意 `g A` / `g I` 在 Neovim 与 VS Code 的普通模式另有含义（查找引用 / 转到实现），Zed 在可视模式下的多光标用法没有对应。

## 7. 搜索与分屏

| Zed | 功能 | Neovim | VS Code | 状态 |
|---|---|---|---|---|
| `g /` | 项目全局搜索 | `g/` | `g/` | ✅ |
| `g <space>` | 打开当前搜索摘录 | `g<space>`（Telescope resume） | ❌ | ⚠️ |
| `ctrl-w <space>` | 分屏打开搜索摘录 | ❌ | ❌ | ❌ |
| `ctrl-w g d` | 分屏跳转定义 | `<C-w>gd` | `<C-w>gd` | ✅ |
| `ctrl-w g D` | 分屏跳转类型定义 | `<C-w>gD` | ⚠️ | ⚠️ |

差异：

- Zed 的 search excerpt 是 Zed 搜索面板特有的概念，VS Code 没有对应物，所以 `g <space>` 和 `ctrl-w <space>` 缺失。Neovim 侧的 `g<space>` 只是恢复 Telescope 上次 picker，语义不完全相同。
- VS Code 下 `ctrl-w gd` 由扩展映射到 `editor.action.revealDefinitionAside`；`ctrl-w gD` 只能走本仓库的 vsplit + peek，不是真正的「分屏类型定义」。

## 8. 插入模式

| Zed | 功能 | Neovim | VS Code | 状态 |
|---|---|---|---|---|
| `ctrl-x ctrl-o` | 打开补全菜单 | `<C-x><C-o>` / `<C-Space>` | VS Code 补全（`Ctrl+Space`） | ⚠️ |
| `ctrl-x ctrl-z` | 隐藏建议 | `<C-x><C-z>` / `<C-e>` | VS Code（`Esc`） | ⚠️ |
| `ctrl-x ctrl-l` | 代码操作菜单 | `<C-x><C-l>` | ❌ | ⚠️ |
| `ctrl-x ctrl-c` | Copilot 建议 | ❌ | ❌ | ❌ |
| `ctrl-x ctrl-a` | 内联 AI 助手 | ❌ | ❌ | ❌ |

差异：Neovim 用 nvim-cmp，VS Code 用自己的补全和 quick fix UI，两组快捷键只是功能对位，不是同一套按键。Copilot / inline AI 没有配置。

## 9. 环绕 / 注释 / 交换 / 替换

| Zed | 功能 | Neovim | VS Code | 状态 |
|---|---|---|---|---|
| `ys<motion><char>` | 添加环绕 | `ys` | `ys` | ✅ |
| `cs<char><char>` | 修改环绕 | `cs` | `cs` | ✅ |
| `ds<char>` | 删除环绕 | `ds` | `ds` | ✅ |
| `g R` | 替换不覆盖寄存器 | `gR` | `gR` | ✅ |
| `c x` | 交换文本 | `cx` | `cx` | ✅ |
| `X` | 交换选区 | `X` | `X` | ✅ |

这三组都靠 `nvim-surround` / `vim-exchange` / `ReplaceWithRegister`，VS Code 下也在 `config/vscode.lua` 中加载，所以两者一致。

## 10. 文件树

| Zed（netrw 风格） | Neovim | VS Code | 状态 |
|---|---|---|---|
| `j` `k` `h` `l`、`gg`、`G`、`Enter` | nvim-tree 默认键 | 扩展的 list 导航 | ⚠️ |
| `o` 打开 / 展开 | `o` | `o`（toggleExpand） | ⚠️ |
| `t` 新标签打开 | — | ❌ | ❌ |
| `r` `d` `y` `x` `p` `a` `A` `R` | nvim-tree 默认键 | 扩展的 explorer 绑定 | ⚠️ |

差异：VS Code 侧由扩展在 `package.json` 里绑定（`a`/`A`/`r`/`d`/`y`/`x`/`p`/`v`/`R` + `j/k/h/l`/`gg`/`G`/`o`/`Enter`）。扩展 README 正文提到「用 `t` 在新标签打开」，但当前 1.20.1 的 `package.json` 里没有 `t` 的绑定，只有 `v`（openToSide）。nvim-tree 的默认键与这两者都不完全相同。

## 11. 架构差异

这些不是键位能解决的：

- **Zed Vim mode 是自研模拟**，不是嵌入真 Neovim：搜索正则语法、宏录制、块选择、搜索替换都走 Zed 自己的引擎。
- **本仓库是真 Neovim**：dot-repeat、宏、寄存器、text objects 更接近 Vim 原生；VS Code 下 Neovim 被嵌进 VS Code，UI、搜索、多光标受宿主限制。
- **宿主托管的行为**：撤销栈、跳转列表、剪贴板、滚动、窗口布局分别由 VS Code / 操作系统管理，与 Zed 的实现不同。
- **VS Code 特有约束**：只有 `ctrlKeysForNormalMode` / `ctrlKeysForInsertMode` 白名单内的组合键会转发给 Neovim。`<C-\>` 因此无法从 Neovim 侧映射。

## 12. 小结

- **能对齐**：LSP 导航与重构、Tree-sitter 跳转与文本对象、环绕/交换/替换、项目搜索、Git 变更导航。
- **有差异**：代码操作菜单、诊断跳转范围、注释判断、缩进范围计算、插入模式补全按键、文件树按键。
- **缺失**：Git hunk 暂存、Zed 多光标全套、搜索摘录与分屏搜索、Copilot / inline AI、`<C-\>` 终端切换。
