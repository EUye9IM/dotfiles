# Neovim 快捷键

本文档是当前 Neovim 配置快捷键的集中索引。按键定义分散在 `nvim/lua/config/` 与 `nvim/lua/plugins/`；插件或文件类型专属行为以对应配置和插件加载后的映射为准。

## 约定

- `n`：普通模式；`i`：插入模式；`x`：可视模式；`o`：operator-pending 模式；`t`：终端模式。
- `<leader>` 默认是空格；`<localleader>` 默认是反斜杠 `\`。
- `a` / `i` 在文本对象中分别表示 around / inside；例如 `af` 是 around function。
- `<C-x>` 表示 Ctrl+x；`<CR>` 表示 Enter；`<Space>` 表示空格。

## 编辑与模式切换

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` | `<leader>w` | 切换自动换行 |
| `n` | `：`（全角冒号） | 进入命令行，适配中文输入法 |
| `i` | `<localleader><localleader>`（连续两个 `\`） | 返回普通模式 |
| `i` | `、、` | 返回普通模式，中文输入适配 |
| `t` | `<localleader><localleader>`（连续两个 `\`） | 返回终端窗口普通模式 |
| `t` | `、、` | 返回终端窗口普通模式 |
| 全模式 | `<leader>f` | 格式化当前缓冲区 |

## LSP 导航与代码操作

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` | `gd` | 跳转到定义 |
| `n` | `gD` | 跳转到声明 |
| `n` | `gy` | 跳转到类型定义 |
| `n` | `gI` | 跳转到实现 |
| `n` | `gA` | 查找引用 |
| `n` | `gs` | 当前文件符号 |
| `n` | `gS` | 工作区符号 |
| `n` | `gh` | 显示 hover 信息 |
| `n` | `g.` | 代码操作 |
| `n` | `cd` | 重命名符号 |
| `n` | `<C-w>gd` | 垂直分屏后跳转到定义 |
| `n` | `<C-w>gD` | 垂直分屏后跳转到类型定义 |
| `i` | `<C-x><C-l>` | 退出插入模式并打开代码操作 |

Neovim 0.12 自带的 LSP 映射也保留启用，例如 `grn` 重命名、`gra` 代码操作、`grr` 查找引用、`gri` 跳转实现、`grt` 跳转类型定义、`grx` 执行 code lens。

## 诊断

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` | `]d` / `g]` | 下一个诊断 |
| `n` | `[d` / `g[` | 上一个诊断 |

## 搜索与分屏

| 模式/上下文 | 按键 | 功能 |
|---|---|---|
| `n` | `g/` | Telescope 项目内容搜索（live grep） |
| `n` | `g<Space>` | 恢复 Telescope 最近一次 picker / 搜索 |
| Telescope picker | `<C-w><Space>` | 在垂直分屏中打开当前选中结果 |
| `n` | `<C-w>gd` | 垂直分屏跳转定义 |
| `n` | `<C-w>gD` | 垂直分屏跳转类型定义 |

`g<Space>` 恢复的是 Telescope 上次 picker，不是 Zed 搜索面板里的 excerpt；搜索结果的呈现和 pane 管理行为不同。

## Tree-sitter 导航与选择

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` / `x` / `o` | `]m` / `[m` | 下一个 / 上一个函数开始 |
| `n` / `x` / `o` | `]M` / `[M` | 下一个 / 上一个函数结束 |
| `n` / `x` / `o` | `]]` / `[[` | 下一个 / 上一个类开始；当前语法树没有类节点时回退到函数 |
| `n` / `x` / `o` | `][` / `[]` | 下一个 / 上一个类结束 |
| `n` / `x` / `o` | `]/`、`]*` | 下一个注释 |
| `n` / `x` / `o` | `[/`、`[*` | 上一个注释 |
| `n` / `x` | `[x` | 扩大到父语法节点 |
| `n` / `x` | `]x` | 缩小到子语法节点 |

以上 Tree-sitter 功能要求当前文件类型有可用 parser 和相应 query。函数、类及注释节点定义取决于语言 query。

## 文本对象、注释、环绕与交换

| 模式 | 按键 | 功能 |
|---|---|---|
| `x` / `o` | `af` / `if` | 函数 around / inside |
| `x` / `o` | `ac` / `ic` | 类 around / inside |
| `x` / `o` | `aa` / `ia` | 参数 around / inside |
| `x` / `o` | `at` / `it` | HTML-like 标签 around / inside |
| `x` / `o` | `ai` / `ii` | 当前缩进范围加前一行 / 当前缩进范围 |
| `x` / `o` | `aI` / `iI` | 当前缩进范围加前后各一行 / 当前缩进范围 |
| `x` | `gc` | 切换注释选区 |
| `n` | `gcc` | 切换当前行注释 |
| `o` | `gc` | 以注释节点作为文本对象目标 |
| `n` / `x` / `o` | `ys<motion><char>` | 给 motion 添加环绕，例如 `ysiw)` |
| `n` | `cs<char><char>` | 修改环绕 |
| `n` | `ds<char>` | 删除环绕 |
| `n` | `cx<motion>` | 选择待交换区域；再次执行 `cx<motion>` 完成交换 |
| `n` | `cxx` | 交换整行 |
| `x` | `X` | 交换可视选区 |
| `n` / `x` | `gR` | 用寄存器内容替换，不覆盖原寄存器 |
| `n` / `x` / `o` | `[i` / `]i` | 跳到当前缩进范围顶部 / 底部 |

在 CSV 文件中，csvview 会将 `af` / `if` 改为字段 around / inside，并额外启用以下映射：

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` / `x` | `<Tab>` / `<S-Tab>` | 下一个 / 上一个字段末尾 |
| `n` / `x` | `<Enter>` / `<S-Enter>` | 下一个 / 上一个 CSV 行 |

## Git

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` | `]c` / `[c` | 下一个 / 上一个 Git 变更 |
| `n` | `do` | 预览当前 hunk |
| `n` | `dp` | 恢复当前未暂存 hunk |
| `n` | `dU` | 暂存当前 hunk |
| `n` | `du` | 撤销本次 Neovim 会话中最近一次 hunk 暂存 |
| `n` | `dO` | 调用 Gitsigns `stage_hunk()` |

> Git 暂存映射目前保留 Neovim/Gitsigns 原有行为，**没有按 Zed 的 `du` / `dU` / `dO` 语义调整**。特别是 `du` 仅撤销当前会话最近一次暂存操作，`dO` 也不是保证准确的状态 toggle。

## 补全

| 模式 | 按键 | 功能 |
|---|---|---|
| `i` | `<C-x><C-o>` / `<C-Space>` | 手动打开补全菜单 |
| `i` | `<C-x><C-z>` / `<C-e>` | 关闭补全建议 |
| `i` | `<C-x><C-l>` | 代码操作 |
| `i` | `<C-n>` / `<C-p>` | nvim-cmp 默认向前 / 向后选择候选项 |
| `i` | `<C-b>` / `<C-f>` | 补全文档向上 / 向下翻页 |
| `i` | `<CR>` | 确认当前候选项（可确认预选项） |

## 文件类型、测试与会话

| 模式 | 按键 | 功能 |
|---|---|---|
| `n`（Markdown） | `<localleader>vm` | 切换 Markdown 渲染 |
| `n`（CSV） | `<localleader>vc` | 切换 CSV 视图 |
| `n` | `<localleader>tt` | 运行光标处测试 |
| `n` | `<localleader>tl` | 再次运行上次测试 |
| `n` | `<localleader>tv` | 跳转到上次测试文件 |
| `n` | `<leader>ss` | 搜索 / 加载会话 |
| 全局 | `<leader>?` | 显示当前缓冲区的 which-key 映射提示 |
| 全局 | `<C-\>` | 打开 / 切换 ToggleTerm |

`vim-test` 使用 ToggleTerm 策略；Go 测试会附加 `-v -count=1 -gcflags=all=-l`。

## 其他

- `nvim-tree` 没有在本配置中添加自定义键位，使用插件默认映射。
- `nvim-cmp` 命令行补全使用其默认 cmdline 映射。
- Telescope 当前只额外配置 `g/`、`g<Space>` 及 picker 内的 `<C-w><Space>`；README 旧版曾列出的 `<leader>tf`、`<leader>tg` 等组合并未在现有配置里定义。
- 多光标插件没有加入本快捷键表的 Zed 对齐范围；配置仅启用 `gl`、`ga`、`g>` 这几个 `vim-visual-multi` 映射。
