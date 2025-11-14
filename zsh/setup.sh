#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo setting up $NAME ...

CHK fzf git nvim

CP zshrc  ~/.zshrc
CP p10k   ~/.p10k.zsh
MKDIR ~/.zsh/
CP zsh/*  ~/.zsh/

export LANG=${LANG:-C.UTF8}

echo 
echo !!
echo run \`. ~/.zshrc\;zinit update\` to install zsh plugins

echo done.

