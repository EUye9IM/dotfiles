# zsh

使用 zinit 作为包管理器

zinit 安装于 /opt/zinit

## 引用插件一览

- zsh-users/zsh-syntax-highlighting: 语法高亮
- romkatv/powerlevel10k: 主题
- zsh-users/zsh-autosuggestions: fish-like 命令提示
- zsh-users/zsh-completions: 自动补全
- agkozak/zsh-z: 目录跳转 (根据历史 cd 智能推测路径，`z --help`)
- https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker: docker 补全

## 一些有别于原本zsh的操作

- powerlevel10k: `p10k configure` 用于重新设定主题风格
- zsh-autosuggestions: ctrl-f 或右方向键补全命令
- z: z命令自动补全跳转目录，详情查看 `z --help`
- shift tab 到达上一个补全（这个居然不是内置的）

## 添加了一些alias

- 如果有nvim，vim替换为nvim
- gitlog 图形化输出 git log
- proxy-on/proxy-off/proxy-test 设定代理（设定ALL_PROXY=$PROXY_SERVE）和关闭代理，测试代理



