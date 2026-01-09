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

## 安装

setup复制配置文件

~~~bash
git clone https://github.com/EUye9IM/dotfiles
cd dotfiles
./setup.sh
~~~

支持文件夹选择，例如如果只想安装配置 neovim

~~~bash
sudo ./install.sh neovim
./setup.sh neovim
~~~

也支持安装多个

~~~bash
sudo ./install.sh neovim zsh
./setup.sh neovim zsh
~~~

## 体验

提供了Container脚本体验配置

~~~bash
git clone https://github.com/EUye9IM/dotfiles
cd dotfiles
podman build --build-arg ALL_PROXY=$ALL_PROXY -t dotfiles .
podman run -it dotfiles
~~~
