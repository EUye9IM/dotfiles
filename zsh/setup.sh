#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo setting up $NAME ...

CP zshrc  ~/.zshrc
CP p10k   ~/.p10k.zsh
MKDIR ~/.zsh/
CP zsh/*  ~/.zsh/

export LANG=${LANG:-C.UTF8}

zsh -c "source ~/.zshrc"
echo 
echo !!
echo run \`zinit update\` to install zsh plugins

echo done.

