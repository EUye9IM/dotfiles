# dotfiles

自用的一些配置文件

目标是在任何机器上实现脚本安装与配置，能够立刻得到我用得顺的环境

一些依赖会存放于 /opt，然后文件以复制的方式实现配置（不是软连接）。所以原本的配置会丢失

为了保证版本够新，安装脚本有时会将软件删了重装，注意备份配置文件

配置一般在个人目录下而不放在 /etc ，su 其他用户再运行 setup.sh 即可在其他用户环境上应用配置

建议在新系统上使用，或者参考配置自己手动改

欢迎 fork

---

目前仅支持 Rocky 和 Ubuntu ，amd64。

有考虑支持其他操作系统，但这是一个没人关心的项目，所以应该不会支持其他架构（架构的区别主要是在二进制安装包，可以自己搜索替换）

整个项目目前就是，安装配置 zsh 和 nvim 。顺带为 tmux 添加鼠标支持

详情查看各文件夹下 README

## 安装

主要有两个脚本 install 与 setup

install 安装特定软件，setup复制配置文件

```bash
git clone https://github.com/EUye9IM/dotfiles
cd dotfiles
sudo bash install.sh
bash setup.sh
```

## 体验

提供了docker命令脚本体验配置

```bash
git clone https://github.com/EUye9IM/dotfiles
cd dotfiles
sudo bash try_dotfile.sh
```

## 添加其他系统支持

首先修改 util.sh 内的 `OS_LIST`

然后在项目里搜索 `case $TARGET_OS in` 添加有差异的行为

## 卸载

为什么要卸载？没写脚本，得手动删。

