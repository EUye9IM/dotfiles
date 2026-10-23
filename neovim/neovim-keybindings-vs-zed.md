# Neovim 与 Zed Vim Mode 快捷键对照

快捷键的当前完整清单统一维护在[Neovim 快捷键说明](keybindings.md)。本文仅记录与 Zed Vim Mode 的对齐范围和已知差异，避免重复维护两份按键表。

## 已对齐或提供对应映射

- LSP 导航、重命名、代码操作及诊断导航。
- 函数/类/注释跳转、语法节点增量选择和主要文本对象。
- 项目搜索、搜索结果恢复、分屏打开搜索结果和分屏 LSP 跳转。
- 环绕、注释、文本交换、补全快捷键及缩进范围对象。

具体按键以[快捷键说明](keybindings.md)和当前配置为准。

## 有意未完全对齐的项目

- **Git 暂存**：`du`、`dU`、`dO` 暂时保留 Gitsigns 原有行为；Zed 在 diff view 中的操作语义不同，未做可能误操作的简单换键。
- **多光标**：只保留 `vim-visual-multi` 当前配置的 `gl`、`ga`、`g>`，没有实现完整 Zed 多光标按键方案。
- **AI**：未配置 Copilot 或 Zed 风格的 inline AI 对应功能。
- **搜索/pane**：Telescope 的 picker 与 Zed search excerpt/pane 工作流不同；映射提供的是 Neovim 内的近似行为。
- **语言结构**：函数、类和注释范围依赖 Tree-sitter parser/query；不同语言的结构定义可能与 Zed 语言扩展不同。
