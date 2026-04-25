# zsh

使用 [zinit](https://github.com/zdharma-continuum/zinit) 作为插件管理器，按序号加载配置片段。

## 文件结构

```
zshrc                → ~/.zshrc（仅 source ~/.zsh/*.zsh）
p10k                 → ~/.p10k.zsh（powerlevel10k 主题配置）
zsh/*.zsh            → ~/.zsh/（分段配置，按序号加载）
```

### 配置片段说明

| 文件 | 说明 |
|---|---|
| `20_zinit.zsh` | zinit 初始化及插件加载 |
| `30_locale.zsh` | 本地化设置 |
| `30_plugins.zsh` | 额外插件配置 |
| `50_alias.zsh` | 通用别名 |
| `50_gitalias.zsh` | Git 相关别名 |
| `50_p10k.zsh` | powerlevel10k 主题加载 |
| `50_proxy.zsh` | 代理开关函数 |
| `80_complete.zsh` | 补全设置 |

## 插件

| 插件 | 说明 |
|---|---|
| `zsh-users/zsh-syntax-highlighting` | 命令行语法高亮 |
| `romkatv/powerlevel10k` | 主题 |
| `zsh-users/zsh-autosuggestions` | 根据历史记录提示命令 |
| `zsh-users/zsh-completions` | 额外补全定义 |
| `agkozak/zsh-z` | 根据历史 cd 记录智能跳转目录（`z --help`） |
| docker 补全 | 来自 docker CLI 仓库的补全脚本 |

## 特色功能

- **p10k configure** — 重新配置 powerlevel10k 主题样式
- **自动建议补全** — `Ctrl-f` 或 `→` 补全一个单词，`Ctrl-e` 补全整行
- **z** — 根据历史记录快速跳转目录，见 `z --help`
- **Shift-Tab** — 反向补全（上一个候选项）
- **代理开关** — `proxy-on` / `proxy-off` / `proxy-test`，环境变量 `ALL_PROXY=$PROXY_SERVE`
- **gitlog** — 图形化 `git log` 输出
- **vim → nvim** — 如已安装 neovim，自动将 `vim` 别名到 `nvim`

## 安装后

```bash
. ~/.zshrc
zinit update
```
