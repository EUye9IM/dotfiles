#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo setting up $NAME ...

CP zshrc  ~/.zshrc
CP p10k   ~/.p10k.zsh

export LANG=${LANG:-C.UTF8}
chsh -s $(zsh -c 'which zsh')
zsh -c "source ~/.zshrc; zinit update"
echo done.

