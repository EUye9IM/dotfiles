#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo setting up $NAME ...

CHK fzf git less zsh

CP zshrc  ~/.zshrc
if [[ $EUID -eq 0 ]]; then
    CP p10k-root ~/.p10k.zsh
else
    CP p10k   ~/.p10k.zsh
fi
MKDIR ~/.zsh/
CP zsh/*  ~/.zsh/

export LANG=${LANG:-C.UTF8}

echo 
echo !!
echo run \`. ~/.zshrc\;zinit update\` to install zsh plugins

echo done.

