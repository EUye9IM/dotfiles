#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo installing $NAME ...

# define requirements and target
target=$NAME
requirements="curl git unzip tar gzip"
version=0.8.0

# preparing
install_package $requirements
remove_package $target

# do auther something ...
case $TARGET_OS in
Ubuntu)
	curl -L -o neovim.deb https://github.com/neovim/neovim/releases/download/v$version/nvim-linux64.deb
	install_package ./neovim.deb
	rm -f neovim.deb
	;;
Rocky)
	install_package epel-release
	install_package neovim-$version
	;;
*)
	raise_error "unsupport OS"
	;;
esac

RM /usr/local/share/nvim/site/pack/packer/opt/packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
/usr/local/share/nvim/site/pack/packer/opt/packer.nvim

echo done.
