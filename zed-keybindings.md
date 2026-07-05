# Zed 快捷键参考手册（面向 Neovim 迁移）

> 基于 [Zed Vim Mode 官方文档](https://zed.dev/docs/vim)和 [Zed Linux 默认 keymap](https://github.com/zed-industries/zed/blob/main/assets/keymaps/default-linux.json) 整理。

---

## 1. Zed Vim 模式概述

Zed 的 Vim 模式**不 1:1 复刻 Vim**，而是在 Vim 的模态编辑基础上融入了 Zed 的现代特性：

- **Motion** 使用 Tree-sitter 语义解析，不同语言行为不同。如 JS 中 `w` 把 `$` 当词字符，Rust 中 `%` 能匹配 `|`。
- **可视块选择** 用多光标实现，插入内容实时同步到所有行。
- **宏** 使用 Zed 录制系统，支持自动补全等复杂操作。
- **搜索替换** 默认全局匹配。

---

## 2. Vim 模式快捷键（Normal / Visual）

### 2.1 LSP 导航与重构

| 快捷键 | 功能 | Neovim 实现 |
|--------|------|------------|
| `g d` | 跳转到定义 | `vim.lsp.buf.definition()` |
| `g D` | 跳转到声明 | `vim.lsp.buf.declaration()` |
| `g y` | 跳转到类型定义 | `vim.lsp.buf.type_definition()` |
| `g I` | 跳转到实现 | `vim.lsp.buf.implementation()` |
| `c d` | 重命名符号 | `vim.lsp.buf.rename()` |
| `g A` | 查找所有引用 | `vim.lsp.buf.references()` |
| `g s` | 文件内符号搜索 | `vim.lsp.buf.document_symbol()` |
| `g S` | 项目符号搜索 | `vim.lsp.buf.workspace_symbol()` |
| `g h` | 显示 hover 信息 | `vim.lsp.buf.hover()` |
| `g .` | 打开代码操作菜单 | `vim.lsp.buf.code_action()` |

> **适配难度**: 低。Neovim 原生 LSP 均有对应，直接映射即可。

### 2.2 诊断导航

| 快捷键 | 功能 | Neovim 实现 |
|--------|------|------------|
| `g ]` 或 `] d` | 下一个诊断 | `vim.diagnostic.goto_next()` |
| `g [` 或 `[ d` | 上一个诊断 | `vim.diagnostic.goto_prev()` |

> **适配难度**: 低。

### 2.3 Tree-sitter 结构与文本对象

#### Motion

| 快捷键 | 功能 | Neovim 实现 |
|--------|------|------------|
| `[ m` / `] m` | 上/下一个方法开始 | treesitter-textobjects |
| `[ M` / `] M` | 上/下一个方法结束 | treesitter-textobjects |
| `[ [` / `] ]` | 上/下一个节/类开始 | treesitter-textobjects |
| `[ ]` / `] [` | 上/下一个节/类结束 | treesitter-textobjects |
| `[ /` / `] /` 或 `[ *` / `] *` | 上/下一个注释 | treesitter-textobjects |
| `[ x` | 选择更大的语法节点 | 需自定义 (Incremental Selection) |
| `] x` | 选择更小的语法节点 | 需自定义 (Incremental Selection) |

#### Text Objects

| 快捷键 | 功能 | Neovim 实现 |
|--------|------|------------|
| `a c` / `i c` | 类/定义（Around/Inside） | `@class.outer` / `@class.inner` |
| `a f` / `i f` | 函数/方法（Around/Inside） | `@function.outer` / `@function.inner` |
| `a a` / `i a` | 参数/列表项（含/不含尾部逗号） | mini.ai 或 treesitter |
| `a t` / `i t` | HTML 标签（Around/Inside） | `@tag.outer` / mini.ai |
| `a I` / `a i` / `i i` | 缩进级别（含前后行/仅前行/当前） | mini.indentscope |
| `g c` | 注释文本对象 | `gc` (Comment.nvim) |

> **适配难度**: 中。需要 `nvim-treesitter-textobjects` 和/或 `mini.ai`。

### 2.4 Git 集成

| 快捷键 | 功能 | Neovim 实现 |
|--------|------|------------|
| `] c` | 下一个 git 变更 | gitsigns.nvim |
| `[ c` | 上一个 git 变更 | gitsigns.nvim |
| `d o` | 展开光标处 diff hunk | gitsigns (preview_hunk) |
| `d O` | 切换暂存状态 | gitsigns (stage_buffer / reset_buffer) |
| `d u` | 取消暂存并下一个 | gitsigns (unstage_hunk) |
| `d U` | 暂存并下一个 | gitsigns (stage_hunk) |
| `d p` | 恢复光标处变更 | gitsigns (reset_hunk) |

> **适配难度**: 低。gitsigns.nvim 提供对应 API，映射即可。

### 2.5 多光标操作

| 快捷键 | 功能 | Neovim 实现 |
|--------|------|------------|
| `g l` | 添加光标选中下一个相同词 | ⚠️ 需插件 |
| `g L` | 添加光标选中上一个相同词 | ⚠️ 需插件 |
| `g a` | 为每个相同词添加可视选择 | ⚠️ 需插件 |
| `g <` | 跳过最新选择，添加上一个 | ⚠️ 需插件 |
| `g >` | 跳过最新选择，添加下一个 | ⚠️ 需插件 |
| `g A` | 在可视选区每行末尾添加光标 | `:'<,'>norm A` 或 multicursors |
| `g I` | 在可视选区每行首字符前添加光标 | `:'<,'>norm I` 或 multicursors |

> **适配难度**: 中-高。最接近的是 `mg979/vim-visual-multi`，但也无法完全匹配 Zed 的行为。

### 2.6 窗格与搜索

| 快捷键 | 功能 | Neovim 实现 |
|--------|------|------------|
| `g /` | 打开项目全局搜索 | Telescope / fzf-lua live_grep |
| `g <space>` | 打开当前搜索摘录 | ⚠️ Zed 特有 |
| `ctrl-w <space>` | 分割窗口打开搜索摘录 | ⚠️ Zed 特有 |
| `ctrl-w g d` | 分割窗口跳转到定义 | `:split | lua vim.lsp.buf.definition()` |
| `ctrl-w g D` | 分割窗口跳转到类型定义 | 同上替换为 type_definition |

### 2.7 内置插件功能

| 快捷键 | 功能 | Neovim 实现 |
|--------|------|------------|
| `ys<motion><char>` | 添加环绕 (yank surround) | nvim-surround / mini.surround |
| `cs<char><char>` | 修改环绕 (change surround) | 同上 |
| `ds<char>` | 删除环绕 (delete surround) | 同上 |
| `gc` | 注释 (visual 模式) | Comment.nvim / mini.comment |
| `gcc` | 注释当前行 (normal 模式) | 同上 |
| `gR` | ReplaceWithRegister | 需插件 (vim-ReplaceWithRegister) |
| `c x` | vim-exchange (交换文本) | 需插件 (vim-exchange) |
| `[-` / `]-` | 跳到上/下一个更低缩进行 | mini.indentscope |
| `[+` / `]+` | 跳到上/下一个更高缩进行 | mini.indentscope |
| `[=` / `]=` | 跳到上/下一个同级缩进行 | mini.indentscope |

### 2.8 AnyBrackets / MiniBrackets / AnyQuotes / MiniQuotes

Zed 提供两种策略的引号/括号文本对象（默认未绑定）：

| 类型 | 行为 | Neovim 实现 |
|------|------|------------|
| AnyQuotes (`q`) | 传统 Vim: 选最近的引号，找不到回退当前行 | mini.ai |
| AnyBrackets (`b`) | 传统 Vim: 选最近的括号 (含 `>` 在 `=>` 中的问题) | mini.ai |
| MiniQuotes (`Q`) | mini.ai 行为: 先搜当前行，再用 Tree-sitter | mini.ai |
| MiniBrackets (`B`) | mini.ai 行为: 区分 `>` 在 `=>` 和 `->` 中的不同角色 | mini.ai |

> **适配难度**: 低。Neovim 的 mini.ai 原生就是 MiniQuotes/MiniBrackets 行为。

---

## 3. 插入模式快捷键

| 快捷键 | 功能 | Neovim 实现 |
|--------|------|------------|
| `ctrl-x ctrl-o` | 打开补全菜单 | `C-n` / `C-p` (nvim-cmp 自动触发) |
| `ctrl-x ctrl-c` | 请求 GitHub Copilot 建议 | copilot.lua / copilot.vim |
| `ctrl-x ctrl-a` | 打开内联 AI 助手 | CodeCompanion / avante.nvim |
| `ctrl-x ctrl-l` | 打开代码操作菜单 | `vim.lsp.buf.code_action()` |
| `ctrl-x ctrl-z` | 隐藏所有建议 | nvim-cmp `cmp.close()` |

> **适配难度**: 中。Neovim 中习惯用 `C-n`/`C-p` 而非 `C-x` 组合。可选择性映射。

---

## 4. Ex 命令参考

### 4.1 文件与窗口

| 命令 | 功能 | Vim 兼容 |
|------|------|---------|
| `:w[rite][!]` | 保存当前文件 | ✅ |
| `:wq[!]` | 保存并关闭 | ✅ |
| `:q[uit][!]` | 关闭缓冲区 | ✅ |
| `:wa[ll][!]` | 保存所有文件 | ✅ |
| `:wqa[ll][!]` | 保存所有文件并关闭所有 | ✅ |
| `:qa[ll][!]` | 关闭所有缓冲区 | ✅ |
| `:[e]x[it][!]` | 关闭缓冲区 | ✅ |
| `:up[date]` | 仅当有修改时保存 | ✅ |
| `:cq` | 退出所有 Zed 实例 | ⚠️ 不同于 Vim 的 `:cquit` |
| `:bd[elete][!]` | 关闭当前文件 | ✅ |
| `:vs[plit]` | 垂直分割 | ✅ |
| `:sp[lit]` | 水平分割 | ✅ |
| `:new` | 水平分割新建文件 | ✅ |
| `:vne[w]` | 垂直分割新建文件 | ✅ |
| `:tabedit` / `:tabnew` | 新标签页新建文件 | ✅ |
| `:tabn[ext]` / `:tabp[rev]` | 下一个/上一个标签页 | ✅ |
| `:tabc[lose]` | 关闭当前标签页 | ✅ |
| `:ls` | 显示所有缓冲区 | ✅ |

> **注意**: Zed 的 Ex 命令暂不支持参数（如 `:w filename`），只能执行操作本身。

### 4.2 面板（Zed 独有，Neovim 无对应）

| 命令 | 打开面板 |
|------|---------|
| `:E[xplore]` | 项目面板 (文件树) |
| `:C[ollab]` | 协作面板 |
| `:Ch[at]` | 聊天面板 |
| `:A[I]` | AI 面板 |
| `:G[it]` | Git 面板 |
| `:D[ebug]` | 调试面板 |
| `:No[tif]` | 通知面板 |
| `:fe[edback]` | 反馈窗口 |
| `:cl[ist]` | 诊断窗口 |
| `:te[rm]` | 终端 |
| `:Ext[ensions]` | 扩展窗口 |

> Neovim 用其他方式打开这些面板（如 `:NvimTreeToggle`、`:Telescope` 等），不需要映射。

### 4.3 跳转

| 命令 | 功能 | Vim 兼容 |
|------|------|---------|
| `:<number>` | 跳转到指定行 | ✅ |
| `:$` | 跳转到文件末尾 | ✅ |
| `:/foo` | 跳转到下一个匹配 foo 的行 | ✅ |
| `:?foo` | 跳转到上一个匹配 foo 的行 | ✅ |

### 4.4 替换

| 命令 | 功能 | 说明 |
|------|------|------|
| `:[range]s/foo/bar/[g]` | 替换 foo 为 bar | 默认替换当前行第一个匹配，`g` 替换全部 |

### 4.5 编辑

| 命令 | 功能 | Vim 兼容 |
|------|------|---------|
| `:j[oin]` | 合并当前行 | ✅ |
| `:d[elete][l][p]` | 删除当前行 | ✅ |
| `:s[ort] [i]` | 排序当前选择 (`i` 不区分大小写) | ✅ |
| `:y[ank]` | 复制当前选择或行 | ✅ |

### 4.6 Set

| 命令 | 功能 | Vim 兼容 |
|------|------|---------|
| `:se[t] [no]wrap` | 切换自动换行 | ✅ |
| `:se[t] [no]nu[mber]` | 切换行号 | ✅ |
| `:se[t] [no]r[elative]nu[mber]` | 切换相对行号 | ✅ |
| `:se[t] [no]i[gnore]c[ase]` | 切换忽略大小写搜索 | ✅ |

---

## 5. 可选额外绑定（Zed 默认未开启）

这些是 Zed Vim 模式支持但**需要手动配置**的快捷键，可作为 Neovim 的参考增强：

### 5.1 子词移动 (camelCase / snake_case)

覆盖默认的 `w/b/e/ge`，让它们在驼峰/蛇形命名中按子词跳转：

| 快捷键 | 功能 | Caveat |
|--------|------|--------|
| `w` → `vim::NextSubwordStart` | 下一子词开始 | `dw` 等操作也受影响 |
| `b` → `vim::PreviousSubwordStart` | 上一子词开始 | |
| `e` → `vim::NextSubwordEnd` | 下一子词结束 | |
| `g e` → `vim::PreviousSubwordEnd` | 上一子词结束 | |

> Neovim 中可通过 `which-key` 或直接 `vim.keymap.set` 实现，或使用 `mini.jump2d` 风格。

### 5.2 Sneak Motion

类似 `vim-sneak` 的快速跳转，默认覆盖 `s` (替代 substitute)：

| 快捷键 | 功能 |
|--------|------|
| `s<char><char>` | 向前跳到两字符序列 |
| `S<char><char>` | 向后跳到两字符序列 |

> Neovim: 直接安装 `ggandor/leap.nvim` 或 `justinmk/vim-sneak`。

### 5.3 Visual Surround

在 visual 模式下用 `S` 添加环绕（默认 `S` 是替换选区并进入插入模式）：

| 快捷键 | 功能 |
|--------|------|
| `S` → `vim::PushAddSurrounds` | 为选区添加环绕 |

> Neovim: `nvim-surround` 的 visual 模式 `S<char>` 已支持。

### 5.4 Helix Jump to Word

跳转到可见词首，类似 Helix 编辑器的标签跳转：

| 快捷键 | 功能 |
|--------|------|
| `g w` → `vim::HelixJumpToWord` | 显示跳转标签 |

> Neovim: 使用 `ggandor/leap.nvim` 或 `folke/flash.nvim` 可达到类似效果。

### 5.5 vim-exchange (visual 模式)

默认 visual 模式下 `X` 是删除行，需手动绑定 exchange：

| 快捷键 | 功能 |
|--------|------|
| `X` → `vim::Exchange` | 交换两个选区 |

> Neovim: 安装 `tommcdo/vim-exchange`，visual 模式默认 `X` 即可。

---

## 6. Neovim 迁移路线图

### 优先级 P0 — 开箱即用或已有插件

| 功能分类 | 推荐插件 | 备注 |
|----------|---------|------|
| LSP 导航 | Neovim 内置 | 直接映射到 `vim.lsp.buf.*` |
| LSP 诊断 | Neovim 内置 | `vim.diagnostic.goto_next/prev` |
| Git signs/hunks | `lewis6991/gitsigns.nvim` | 映射 `]c`/`[c` 和 diff 操作 |
| Tree-sitter textobjects | `nvim-treesitter/nvim-treesitter-textobjects` | `]m`/`[m`、`af`/`if`、`ac`/`ic` 等 |
| 注释 | `numToStr/Comment.nvim` | `gc`/`gcc` 行为 |
| Surround | `kylechui/nvim-surround` | `ys`/`cs`/`ds` 全部支持 |

### 优先级 P1 — 需要额外插件

| 功能分类 | 推荐插件 | 备注 |
|----------|---------|------|
| 缩进级文本对象 | `echasnovski/mini.ai` + `mini.indentscope` | `a I`/`a i`/`i i`、缩进跳转 |
| 参数文本对象 | `echasnovski/mini.ai` | `a a`/`i a` |
| 引号/括号文本对象 | `echasnovski/mini.ai` | Any/Mini quotes/brackets |
| Exchange | `tommcdo/vim-exchange` | `c x` (normal), `X` (visual) |
| ReplaceWithRegister | `vim-scripts/ReplaceWithRegister` | `g R` |
| Subword motion | 自定义 keymap | `w`/`b`/`e`/`ge` 覆盖 |

### 优先级 P2 — 可选增强

| 功能分类 | 推荐插件 | 备注 |
|----------|---------|------|
| 增量选择 | `nvim-treesitter` 内置 `init_selection` | `[x`/`]x` 的替代 |
| 快速跳转 | `ggandor/leap.nvim` | 替代 Sneak / Helix Jump |
| 多光标 | `mg979/vim-visual-multi` | 部分覆盖 `g l`/`g L`/`g a` |

### 不需要适配的功能

- **Ex 窗格命令** (`:E`、`:te` 等) — Neovim 有自己的方式打开文件树/终端
- **多光标全功能** — Neovim 的架构下无法完全复刻 Zed 的多光标体验，`g A`/`g I` 可用 block visual 或 norm 命令替代
- **`g /` 项目搜索** — 直接用 Telescope live_grep 即可，体验更好
- **`g <space>` 搜索摘录** — Zed 特有概念，Neovim 无对应

---

## 参考

- [Zed Vim Mode 文档](https://zed.dev/docs/vim)
- [Zed All Actions](https://zed.dev/docs/all-actions)
- [Zed Linux 默认 keymap](https://github.com/zed-industries/zed/blob/main/assets/keymaps/default-linux.json)

---

*最后更新: 2026-06*
