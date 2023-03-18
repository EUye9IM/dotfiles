#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo setting up $NAME ...

cp zshenv   ~/.zshenv
cp zshrc    ~/.zshrc
cp p10k ~/.p10k.zsh

export LANG=${LANG:-C.UTF8}
zsh -c "source ~/.zshrc; zinit update"
chsh -s $(zsh -c 'which zsh')

echo done.

