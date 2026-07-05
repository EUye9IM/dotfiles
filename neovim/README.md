# neovim

基于 [lazy.nvim](https://github.com/folke/lazy.nvim) 的 Neovim 配置，参考 [LazyVim](https://github.com/LazyVim/LazyVim) 结构。

## 文件结构

```
nvim/
├── init.lua                    # 入口，加载 options → lazy
└── lua/
    ├── config/
    │   ├── lazy.lua            # lazy.nvim 引导与插件导入
    │   └── options.lua         # 全局选项与快捷键
    └── plugins/
        ├── completion.lua      # nvim-cmp 补全引擎
        ├── editor.lua          # 编辑器增强（括号、注释、折叠、会话）
        ├── filetree.lua        # nvim-tree 文件浏览器
        ├── filetype.lua        # 文件类型增强（markdown/csv/log）
        ├── formatter.lua       # conform.nvim 格式化
        ├── git.lua             # Git 工具（gitsigns/blame/diffview）
        ├── lsp.lua             # LSP（mason/lspconfig/inlay-hints/lazydev）
        ├── telescope.lua       # telescope 模糊查找器
        ├── terminal.lua        # toggleterm 终端
        ├── testing.lua         # vim-test 测试运行
        ├── theme.lua           # tokyonight 主题
        ├── treesitter.lua      # treesitter 语法引擎
        ├── ui.lua              # 界面组件（lualine/bufferline/scrollview/neoscroll）
        └── whichkey.lua        # which-key 快捷键提示
```

## 插件一览

### 语法与 LSP

| 插件 | 说明 |
|---|---|
| `nvim-treesitter/nvim-treesitter` | 语法高亮、折叠、缩进 |
| `nvim-treesitter/nvim-treesitter-context` | 代码上下文提示 |
| `MysticalDevil/inlay-hints.nvim` | LSP inlay 提示（gopls） |
| `mason-org/mason.nvim` | LSP/DAP/linter 安装器 |
| `neovim/nvim-lspconfig` | LSP 客户端配置 |
| `folke/lazydev.nvim` | Lua 语言服务增强 |

### 查找

| 插件 | 说明 |
|---|---|
| `nvim-telescope/telescope.nvim` | 模糊查找器 |
| `nvim-lua/plenary.nvim` | telescope 依赖库 |
| `nvim-telescope/telescope-fzf-native.nvim` | fzf 加速排序 |
| `jmacadie/telescope-hierarchy.nvim` | 调用树查找 |

### 补全

| 插件 | 说明 |
|---|---|
| `hrsh7th/nvim-cmp` | 自动补全引擎 |
| `hrsh7th/cmp-nvim-lsp` | LSP 补全源 |
| `hrsh7th/cmp-buffer` | 缓冲区补全源 |
| `hrsh7th/cmp-path` | 路径补全源 |
| `hrsh7th/cmp-cmdline` | 命令行补全源 |
| `hrsh7th/vim-vsnip` | 代码片段引擎 |

### 编辑器

| 插件 | 说明 |
|---|---|
| `windwp/nvim-autopairs` | 自动闭合括号/引号 |
| `folke/ts-comments.nvim` | tree-sitter 注释切换 |
| `kevinhwang91/nvim-ufo` | 代码折叠 |
| `rmagatti/auto-session` | 自动会话保存/恢复 |

### 主题

| 插件 | 说明 |
|---|---|
| `folke/tokyonight.nvim` | 主题（tokyonight-night） |

### 界面组件

| 插件 | 说明 |
|---|---|
| `nvim-lualine/lualine.nvim` | 状态栏（集成 git-blame） |
| `akinsho/bufferline.nvim` | 标签栏 |
| `dstein64/nvim-scrollview` | 滚动条指示器 |
| `karb94/neoscroll.nvim` | 平滑滚动 |

### 文件浏览器

| 插件 | 说明 |
|---|---|
| `nvim-tree/nvim-tree.lua` | 文件浏览器 |

### 终端

| 插件 | 说明 |
|---|---|
| `akinsho/toggleterm.nvim` | 浮动/水平终端 |

### Git

| 插件 | 说明 |
|---|---|
| `lewis6991/gitsigns.nvim` | Git 变更标记 |
| `f-person/git-blame.nvim` | 行内 git blame |
| `sindrets/diffview.nvim` | Git diff 查看器 |

### 文件类型增强

| 插件 | 说明 |
|---|---|
| `MeanderingProgrammer/render-markdown.nvim` | Markdown 渲染 |
| `hat0uma/csvview.nvim` | CSV 表格查看 |
| `fei6409/log-highlight.nvim` | 日志文件高亮 |

### 测试

| 插件 | 说明 |
|---|---|
| `vim-test/vim-test` | 测试运行器（toggleterm 策略） |

## 快捷键

### 全局

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` | `<leader>w` | 切换换行 |
| `n` | `：`（全角冒号） | 进入命令模式（中文输入法适配） |
| `i` | `<localleader><localleader>` | 退出插入模式 |
| `i` | `、、`（中文逗号） | 退出插入模式 |
| `t` | `<localleader><localleader>` | 退出终端模式 |
| `t` | `、、` | 退出终端模式 |
| `n` / `v` | `<leader>f` | 格式化缓冲区 |

### Telescope

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` | `<leader>to` | 调用树（incoming calls） |
| `n` | `<leader>tf` | 搜索文件 |
| `n` | `<leader>tg` | 搜索内容 |
| `n` | `<leader>ts` | 搜索符号 |
| `n` | `<leader>tr` | 查找引用 |
| `n` | `<leader>ti` | 查找实现 |
| `n` | `<leader>td` | 跳转到定义 |
| `n` | `<leader>tt` | 跳转到类型定义 |

### 测试

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` | `<localleader>tt` | 运行当前测试 |
| `n` | `<localleader>tl` | 重新运行上次测试 |
| `n` | `<localleader>tv` | 跳转测试文件 |
| `n` | `<localleader>tf` | 运行文件内所有测试 |

### 其他

| 模式 | 按键 | 功能 |
|---|---|---|
| `n` | `<leader>ss` | 搜索会话列表 |
| `n` | `<localleader>vm` | 切换 Markdown 渲染 |
| `n` / `v` | `<localleader>vc` | 切换 CSV 表格视图 |
| `n` | `<leader>?` | 显示缓冲区快捷键 |
| `i` | `<C-Space>` | 触发补全 |
| `i` | `<CR>` | 确认补全 |

## 特色

- **中文输入适配**：全角冒号 `：` 进入命令模式，`、、` 退出插入模式
- **格式化**：conform.nvim 保存时自动格式化，支持 stylua / goimports / black / rustfmt 等
- **补全**：nvim-cmp 多源补全（LSP + buffer + path + cmdline + snippet）
- **折叠**：nvim-ufo 基于 tree-sitter / LSP 的智能折叠
- **会话**：auto-session 自动保存工作区状态
- **测试**：vim-test 集成 toggleterm，Go 测试配置 `-count=1 -gcflags=all=-l`
- **LSP**：mason 管理语言服务，gopls 启用完整 inlay hints

## 参考

- [LazyVim](https://github.com/LazyVim/LazyVim)
- [知乎专栏](https://zhuanlan.zhihu.com/p/583324604)
