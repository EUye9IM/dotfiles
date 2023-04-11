# neovim

大量参考 LunarVim/Neovim-from-scratch ，实现基本设定与补全

## tab 设定

tab 不转空格，宽 4 字符

## 默认mapleader

设定为分号

由于分号被当作leader，原本分号的功能需要摁两次分号触发

## 代码补全快捷键

- Ctrl+k: 补全菜单的下一项
- Ctrl+j: 补全菜单的上一项
- Ctrl+b: 补全信息向上滚动
- Ctrl+f: 补全信息向下滚动
- Ctrl+y: 显示补全菜单
- Enter: 选定补全
- Tab: 补全菜单的下一项/snip的下一个位置
- Shift+Tab: 补全菜单的上一项/snip的上一个位置

## LSP

使用 mason 管理 Lsp

输入 `:Mason` 跳管理界面

i 安装/X卸载/ctrl+f语言过滤/其余 `g?` 输出帮助界面自己看

## LSP快捷键

这些快捷键在没有LSP时不生效，下面假定分号是leader键

**跳转类**

- gD 到声明
- gd 到定义
- gI 到实例
- gr 输出引用
- gl 输出诊断信息

- K 输出悬停引用，摁两次进入浮动窗口，q 退出

- ;lf 代码格式化
- ;la 显示当前代码可用动作
- ;lj 下一条诊断
- ;lk 上一条诊断
- ;lr 变量重命名
- ;ls 符号的签名信息
- ;lq 显示代码诊断列表

## 目录树快捷键

假定分号是leader键

- ;tt 打开关闭目录树
- ;tf 在目录树查找当前文件

剩下的快捷键在目录树窗口内输入 `g?` 查询

## 注释快捷键

假定分号是leader键

- ;c n模式注释行；v模式注释块
- ic v模式选择注释块

# 终端快捷键

假定分号是leader键

- ;te 打开、关闭终端

如果进入了normal模式可以用i、a进入插入模式

# TODO

https://zhuanlan.zhihu.com/p/583324604

1. telescope
2. Symbols-Outline


