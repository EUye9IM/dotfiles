#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo Setting up $NAME ...

CHK nvim

if command -v cygpath > /dev/null 2>&1;then
    NVIM_CFG_DIR=$(nvim --headless --clean +'echo stdpath("config")' +q! 2>&1|sed 's|\\|/|g'| xargs cygpath -u) || exit $?
else
    NVIM_CFG_DIR=$(nvim --headless --clean +'echo stdpath("config")' +q! 2>&1) || exit $?
fi
if [[ -z $NVIM_CFG_DIR || $NVIM_CFG_DIR == / ]]; then
    echo "Invalid Neovim config directory: $NVIM_CFG_DIR" >&2
    exit 1
fi
echo NVIM_CFG_DIR=$NVIM_CFG_DIR
if [[ -e $NVIM_CFG_DIR || -L $NVIM_CFG_DIR ]]; then
    NVIM_CFG_BACKUP=${NVIM_CFG_DIR}~
    if [[ -e $NVIM_CFG_BACKUP || -L $NVIM_CFG_BACKUP ]]; then
        n=1
        while [[ -e ${NVIM_CFG_DIR}.backup.$n || -L ${NVIM_CFG_DIR}.backup.$n ]]; do
            ((n++))
        done
        NVIM_CFG_BACKUP=${NVIM_CFG_DIR}.backup.$n
    fi
    echo "Backing up $NVIM_CFG_DIR to $NVIM_CFG_BACKUP"
    cp -Rp "$NVIM_CFG_DIR" "$NVIM_CFG_BACKUP" || exit $?
fi
RM "$NVIM_CFG_DIR" || exit $?
MKDIR "$NVIM_CFG_DIR" || exit $?
CP nvim/* "$NVIM_CFG_DIR" || exit $?

echo !!
echo run \`nvim --headless +"Lazy! sync" +qa!\` to continue setup
echo done.
