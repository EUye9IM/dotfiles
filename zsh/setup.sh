#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo setting up $NAME ...

cp zshenv   ~/.zshenv
cp zshrc    ~/.zshrc
cp p10k ~/.p10k.zsh

# zsh -c "export LANG=$LANG; source ~/.zshrc; zplug install"
chsh -s $(zsh -c 'which zsh')

echo done.
