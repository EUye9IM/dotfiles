#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo installing $NAME ...

rm -rf /usr/local/share/nvim

install_package curl git unzip tar gzip
case $TARGET_OS in
Ubuntu)
	install_package curl
	curl -L -o neovim.deb https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
	install_package ./neovim.deb
	rm -f neovim.deb
	;;
Rocky)
	install_package epel-release
	reinstall_package neovim
	;;
*)
	raise_error "unsupport OS"
	;;
esac

mkdir -p /usr/local/share/nvim/site/pack/packer/opt/
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
/usr/local/share/nvim/site/pack/packer/opt/packer.nvim

echo done.
