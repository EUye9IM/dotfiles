# dotfiles

自用的一些配置文件

目标是在任何机器上实现脚本安装与配置，能够立刻得到我用得顺的环境

一些依赖可能会存放于 /opt，然后文件以复制的方式实现配置（不是软连接）。由于使用
`cp -rfb` 原本的配置会产生备份，但安全起见建议备份防止旧配置丢失

为了保证版本够新，安装脚本有时会将软件删了重装，注意备份配置文件

配置一般在个人目录下而不放在 /etc ，su 其他用户再运行 setup.sh 即可在其他用户环
境上应用配置

建议在新系统上使用，或者参考配置自己手动改

欢迎 fork

---

目前仅支持 Rocky 和 Ubuntu ，amd64。

有考虑~~根据我自己需求~~支持其他操作系统，但这是一个没人关心的项目，所以应该不
会支持其他架构（架构的区别主要是在二进制安装包，可以自己搜索替换）

整个项目目前就是，安装配置 zsh 和 nvim 。顺带为 tmux 添加鼠标支持

详情查看各文件夹下 README

- [neovim](./neovim/README.md)
- [tmux](./tmux/README.md)
- [zsh](./zsh/README.md)

## 安装

主要有两个脚本 install 与 setup

install 安装特定软件，setup复制配置文件

```bash
git clone https://github.com/EUye9IM/dotfiles
cd dotfiles
sudo ./install.sh
./setup.sh
```

为了支持多用户，setup理应不需要 root 权限

两个脚本都支持文件夹选择，例如如果只想安装配置 neovim

```bash
sudo ./install.sh neovim
./setup.sh neovim
```

也支持安装多个

```bash
sudo ./install.sh neovim zsh
./setup.sh neovim zsh
```

## 体验

提供了docker命令脚本体验配置

```bash
git clone https://github.com/EUye9IM/dotfiles
cd dotfiles
sudo bash try_dotfile.sh
```

## 个性化

说白了这只是一个个人配置工具脚本，很多地方可能不适用于你的需求，这种情形可能需
要自己改动。

> 推荐自己fork一个仓库或者建立一个分支然后自己改动，方便自己多次使用

> ~~也可以尝试提 issue，幸运地话我可能会改~~

以下是一些在框架内改动的方法

### 添加其他系统（发行版）支持

首先修改 util.sh 内的 `OS_LIST`，在里面添加你的操作系统，有先后优先级

> 这个脚本判断操作系统的方式是在 `/etc/*release*` 文件里查找字符串，注意大小写

然后在项目里搜索 `case $TARGET_OS in` ，添加有差异的行为。

> 也可以和现有兼容操作系统一起，比如 Debian 和 Ubuntu ？

### 添加其他软件

例如你想添加 docker

```bash
cp .tmpl docker
```

然后修改里面的 install.sh 和 setup.sh 再自己添点资源文件

## 卸载

没写脚本，得手动删。

