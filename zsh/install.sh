#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo installing $NAME ...

# define requirements and target
target=$NAME
requirements="curl git"
version=

# preparing
install_package $requirements
remove_package $target

# do auther something ...

case $TARGET_OS in
Rocky)
	# chsh
	install_package util-linux-user
	;;
esac

install_package $target

source zshenv

ZINIT_HOME=${ZINIT[BIN_DIR]}

echo $ZINIT_HOME

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone --depth 1 https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

echo done.
