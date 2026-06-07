# Neovim 快捷键与 Zed 对齐状态

> 基于 `~/projects/dotfiles/zed-keybindings.md` 对照当前 Neovim 配置生成。
> 状态标记：`✅` 已对齐 | `⚠️` 近似对齐（行为有差异）| `❌` 未实现 | `➕` Neovim 独有

---

## 1. LSP 导航与重构

| Zed 按键 | 功能 | Neovim 按键 | 实现方式 | 状态 |
|----------|------|------------|----------|------|
| `g d` | 转到定义 | `gd` | `vim.lsp.buf.definition()` | ✅ |
| `g D` | 转到声明 | `gD` | `vim.lsp.buf.declaration()` | ✅ |
| `g y` | 转到类型定义 | `gy` | `vim.lsp.buf.type_definition()` | ✅ |
| `g I` | 转到实现 | `gI` | `vim.lsp.buf.implementation()` | ✅ |
| `c d` | 重命名 | `cd` | `vim.lsp.buf.rename()` | ✅ |
| `g A` | 查找引用 | `gA` | `vim.lsp.buf.references()` | ✅ |
| `g s` | 文件内符号 | `gs` | `vim.lsp.buf.document_symbol()` | ✅ |
| `g S` | 项目符号 | `gS` | `vim.lsp.buf.workspace_symbol()` | ✅ |
| `g h` | hover 信息 | `gh` | `vim.lsp.buf.hover()` | ✅ |
| `g .` | 代码操作 | `g.` | `vim.lsp.buf.code_action()` | ✅ |

---

## 2. 诊断导航

| Zed 按键 | 功能 | Neovim 按键 | 实现方式 | 状态 |
|----------|------|------------|----------|------|
| `] d` | 下一个诊断 | `]d` | `vim.diagnostic.goto_next()` | ✅ |
| `[ d` | 上一个诊断 | `[d` | `vim.diagnostic.goto_prev()` | ✅ |
| `g ]` | 下一个诊断（别名） | — | — | ❌ |

---

## 3. Tree-sitter 文本对象与移动

### 3.1 移动

| Zed 按键 | 功能 | Neovim 按键 | 实现方式 | 状态 |
|----------|------|------------|----------|------|
| `[ m` / `] m` | 上/下一个方法开始 | `[m` / `]m` | nvim-treesitter-textobjects (`@function.outer`) | ✅ |
| `[ M` / `] M` | 上/下一个方法结束 | `[M` / `]M` | 同上 | ✅ |
| `[ [` / `] ]` | 上/下一个节/类开始 | `[[` / `]]` | nvim-treesitter-textobjects (`@class.outer`) | ✅ |
| `[ ]` / `] [` | 上/下一个节/类结束 | `[]` / `][` | 同上 | ✅ |
| `[ /` / `] /` | 上/下一个注释 | `[/` / `]/` | nvim-treesitter-textobjects (`@comment.outer`) | ✅ |
| `[ x` / `] x` | 增量选择 | — | — | ❌ |

### 3.2 文本对象

| Zed 按键 | 功能 | Neovim 按键 | 实现方式 | 状态 |
|----------|------|------------|----------|------|
| `a c` / `i c` | 类 | `ac` / `ic` | nvim-treesitter-textobjects (`@class.outer`/`@class.inner`) | ✅ |
| `a f` / `i f` | 函数 | `af` / `if` | nvim-treesitter-textobjects (`@function.outer`/`@function.inner`) | ✅ |
| `a a` / `i a` | 参数 | `aa` / `ia` | mini.ai (default config) | ✅ |
| `a t` / `i t` | HTML 标签 | — | — | ❌ |
| `a I` / `a i` / `i i` | 缩进级别 | `aI` / `ai` / `ii` | mini.indentscope (default config) | ✅ |
| `g c` | 注释 | `gc` / `gcc` | ts-comments.nvim | ✅ |

---

## 4. Git 集成

| Zed 按键 | 功能 | Neovim 按键 | 实现方式 | 状态 |
|----------|------|------------|----------|------|
| `] c` | 下一个变更 | `]c` | gitsigns.nvim `nav_hunk("next")` | ✅ |
| `[ c` | 上一个变更 | `[c` | gitsigns.nvim `nav_hunk("prev")` | ✅ |
| `d o` | 展开/预览 hunk | `do` | gitsigns.nvim `preview_hunk()` | ✅ |
| `d p` | 恢复 hunk 变更 | `dp` | gitsigns.nvim `reset_hunk()` | ✅ |
| `d U` | 暂存 hunk | `dU` | gitsigns.nvim `stage_hunk()` | ✅ |
| `d u` | 取消暂存 hunk | `du` | gitsigns.nvim `undo_stage_hunk()` | ⚠️ |
| `d O` | 切换暂存状态 | `dO` | gitsigns.nvim `stage_hunk()` | ⚠️ |

---

## 5. 多光标

| Zed 按键 | 功能 | Neovim 按键 | 实现方式 | 状态 |
|----------|------|------------|----------|------|
| `g l` | 添加光标到下一个相同词 | `gl` | vim-visual-multi (`Find Under`) | ✅ |
| `g a` | 为每个相同词添加光标 | `ga` | vim-visual-multi (`Select All`) | ✅ |
| `g >` | 跳过当前，添加下一个 | `g>` | vim-visual-multi (`Skip Region`) | ✅ |
| `g L` | 添加光标到上一个相同词 | — | — | ❌ |
| `g <` | 跳过当前，添加上一个 | — | — | ❌ |
| `g A` | 选区每行末尾添加光标 | — | — | ❌ |
| `g I` | 选区每行行首添加光标 | — | — | ❌ |

---

## 6. 搜索

| Zed 按键 | 功能 | Neovim 按键 | 实现方式 | 状态 |
|----------|------|------------|----------|------|
| `g /` | 项目全局搜索 | `g/` | Telescope `live_grep` | ✅ |
| `g <space>` | 搜索摘录 | — | Zed 特有概念 | ❌ |
| `ctrl-w <space>` | 分割窗口搜索摘录 | — | Zed 特有概念 | ❌ |
| `ctrl-w g d` | 分割窗口跳转定义 | — | — | ❌ |
| `ctrl-w g D` | 分割窗口跳转类型定义 | — | — | ❌ |

---

## 7. 环绕 / 注释 / 交换 / 替换

| Zed 按键 | 功能 | Neovim 按键 | 实现方式 | 状态 |
|----------|------|------------|----------|------|
| `ys<motion><char>` | 添加环绕 | `ys` | nvim-surround | ✅ |
| `cs<char><char>` | 修改环绕 | `cs` | nvim-surround | ✅ |
| `ds<char>` | 删除环绕 | `ds` | nvim-surround | ✅ |
| `gc` (visual) | 注释选区 | `gc` | ts-comments.nvim | ✅ |
| `gcc` (normal) | 注释当前行 | `gcc` | ts-comments.nvim | ✅ |
| `g R` | 替换不覆盖寄存器 | `gR` | vim-ReplaceWithRegister（remap from `gr`） | ✅ |
| `c x` | 交换文本 (normal) | `cx` | vim-exchange | ✅ |
| `X` (visual) | 交换选区 | `X` | vim-exchange (default) | ✅ |
| `[-` / `]-` | 跳到更低缩进行 | `[-` / `]-` | mini.indentscope | ✅ |
| `[+` / `]+` | 跳到更高缩进行 | `[+` / `]+` | 同上 | ✅ |
| `[=` / `]=` | 跳到同级缩进行 | `[=` / `]=` | 同上 | ✅ |

---

## 8. 插入模式

| Zed 按键 | 功能 | Neovim 按键 | 实现方式 | 状态 |
|----------|------|------------|----------|------|
| `ctrl-x ctrl-o` | 打开补全菜单 | `<C-Space>` / `<C-n>` | nvim-cmp | ⚠️ |
| `ctrl-x ctrl-z` | 隐藏建议 | `<C-e>` | nvim-cmp `cmp.abort()` | ⚠️ |
| `ctrl-x ctrl-c` | GitHub Copilot 建议 | — | 未安装 | ❌ |
| `ctrl-x ctrl-a` | 内联 AI 助手 | — | 未安装 | ❌ |
| `ctrl-x ctrl-l` | 代码操作菜单 | — | 仅 normal 模式 `g.` | ❌ |

---

## 9. Neovim 独有功能（Zed 无对应）

| Neovim 按键 | 功能 | 实现方式 |
|-------------|------|----------|
| `<leader>w` | 切换自动换行 | `:set wrap!` |
| `<leader>ss` | 查找会话 | auto-session |
| `<leader>?` | 显示快捷键菜单 | which-key.nvim |
| `<leader>f` | 格式化缓冲区 | conform.nvim（Zed 用 Vim 原生 `=`） |
| `<localleader>tt` | 运行最近测试 | vim-test |
| `<localleader>tl` | 运行上次测试 | vim-test |
| `<localleader>tv` | 跳转测试文件 | vim-test |
| `<localleader>vm` | Markdown 渲染切换 | render-markdown.nvim |
| `<localleader>vc` | CSV 表格切换 | csvview.nvim |
| `<C-\>` | 终端切出/入 | toggleterm.nvim（Zed 用 `:te`） |
| `<C-Space>` | 手动触发补全 | nvim-cmp |
| `<C-b>` `<C-f>` | 补全文档翻页 | nvim-cmp |
| `<CR>` | 确认补全项 | nvim-cmp |
| `：` / `、、` | 中文输入法下退出插入模式 | `options.lua` |
| `<localleader><localleader>` | 退出插入/终端模式 | `options.lua` |

---

## 10. 对齐汇总

| 分类 | 总计 | ✅ | ⚠️ | ❌ |
|------|------|----|----|-----|
| LSP 导航 | 10 | 10 | 0 | 0 |
| 诊断 | 3 | 2 | 0 | 1 |
| Tree-sitter 移动 | 12 | 10 | 0 | 2 |
| Tree-sitter 文本对象 | 10 | 8 | 0 | 2 |
| Git | 7 | 5 | 2 | 0 |
| 多光标 | 7 | 3 | 0 | 4 |
| 搜索 | 5 | 1 | 0 | 4 |
| 环绕/注释/交换 | 12 | 12 | 0 | 0 |
| 插入模式 | 5 | 0 | 2 | 3 |
| **合计** | **71** | **51** | **4** | **16** |

---

## 11. 已知限制

### Git
- **`d u`（取消暂存 hunk）**：gitsigns.nvim v2 无 per-hunk unstage API，用 `undo_stage_hunk()`（回退上次暂存操作）替代，非严格等价。
- **`d O`（切换暂存状态）**：gitsigns.nvim 无 toggle，仅执行 `stage_hunk()`，无法区分当前 hunk 是否已暂存。

### 多光标
- **`g L` / `g <`**：vim-visual-multi 不支持"查找上一个匹配"，仅支持正向查找和跳过。
- **`g A` / `g I`**：visual 模式下在每行末尾/行首添加光标，当前未实现。可用 block visual (`C-v`) 或 `:'<,'>norm A/I` 替代。

### 插入模式
- 整体采用 Neovim 生态习惯（`C-n`/`C-p` 补全、`C-e` 取消），未映射 Zed 的 `C-x` 组合体系。

### 搜索
- `g <space>` 搜索摘录为 Zed 特有概念，Neovim 无可直接对应的功能。`ctrl-w` 分割窗口跳转系列未实现，可用 `:split | lua vim.lsp.buf.definition()` 手动操作。

### Tree-sitter
- `[ x` / `] x` 增量选择未实现。Neovim 中可通过 `nvim-treesitter` 的 `init_selection()` 手动触发。
- `a t` / `i t` HTML 标签文本对象未实现。可用 `vim-sandwhich` 或额外配置 mini.ai。

---
*最后更新: 2026-06*
