# dotfiles

自用的开发环境配置，一键还原顺手的工作环境。

## 组件

| 组件 | 说明 | 安装目标 | 安装后操作 |
|---|---|---|---|
| `neovim/` | Neovim 编辑器配置 | `stdpath("config")` 返回值路径 | `Lazy! sync` |
| `zsh/` | Zsh 配置（zinit + p10k） | `~/.zshrc`, `~/.p10k.zsh`, `~/.zsh/*` | `zinit update` |
| `tmux/` | Tmux 终端复用器配置 | `~/.tmux.conf` | 无 |
| `kitty/` | Kitty 终端模拟器配置 | `~/.config/kitty/kitty.conf` | 无 |

## 安装

**`setup.sh`** — 复制配置文件到 `~`（无需 root）

配置文件以复制方式部署（非软链接），使用 `cp -rfb`，已有文件会自动备份。

```bash
# 完整安装
./setup.sh

# 选择性安装，例如仅 neovim + zsh
./setup.sh neovim zsh
```

## 容器体验

提供了 `Containerfile`，可在容器中预览配置效果：

```bash
podman build --build-arg ALL_PROXY=$ALL_PROXY -t dotfiles .
podman run -it dotfiles
```

## 新增组件

复制 `.tmpl/` 模板目录，参考现有组件编写 `setup.sh`，并 `source ../utils.sh` 使用公共工具函数。

## 注意事项

- 配置仅针对当前用户生效，su 切换用户后需重新运行 `setup.sh`
- 建议在新系统上使用，或参考配置自行修改
