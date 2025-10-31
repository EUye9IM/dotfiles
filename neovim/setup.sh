#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo Setting up $NAME ...

if command -v cygpath > /dev/null 2>&1;then
    NVIM_CFG_DIR=$(nvim --headless --clean +'echo stdpath("config")' +q! 2>&1|sed 's|\\|/|g'| xargs cygpath -u)
else
    NVIM_CFG_DIR=$(nvim --headless --clean +'echo stdpath("config")' +q! 2>&1)
fi
echo NVIM_CFG_DIR=$NVIM_CFG_DIR
RM $NVIM_CFG_DIR
MKDIR $NVIM_CFG_DIR
CP nvim/* $NVIM_CFG_DIR

echo !!
echo run \`nvim --headless +"Lazy! sync" +qa!\` to continue setup
echo done.
