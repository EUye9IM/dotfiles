#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo setting up $NAME ...

CP zshenv ~/.zshenv
CP zshrc  ~/.zshrc
CP p10k   ~/.p10k.zsh

export LANG=${LANG:-C.UTF8}
zsh -c "source ~/.zshrc; zinit update"
chsh -s $(zsh -c 'which zsh')

echo done.

