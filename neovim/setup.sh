#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo Setting up $NAME ...

echo Copying config files ...
rm -rf ~/.config/nvim
mkdir -p ~/.config
cp -r nvim ~/.config/nvim

echo Synchronizing plugs ...
# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'PackerCompile'

echo "Changing Git's default editor ..."
git config --global core.editor "nvim"

echo "Changing Git's default editor ..."
git config --global core.editor "nvim"

echo done.

