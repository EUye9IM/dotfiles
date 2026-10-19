#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo setting up $NAME ...

CHK fzf git less zsh

CP zshrc ~/.zshrc || exit $?
if [[ $EUID -eq 0 ]]; then
    CP p10k-root ~/.p10k.zsh || exit $?
else
    CP p10k ~/.p10k.zsh || exit $?
fi
MKDIR ~/.zsh/ || exit $?
CP zsh/* ~/.zsh/ || exit $?

export LANG=${LANG:-C.UTF8}

echo 
echo !!
echo run \`. ~/.zshrc\;zinit update\` to install zsh plugins

echo done.

