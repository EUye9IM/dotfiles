#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo Setting up $NAME ...

RM ~/.config/nvim/plugin
MKDIR ~/.config
CP nvim/* ~/.config/nvim

# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'PackerCompile'

git config --global core.editor "nvim"
git config --global diff.tool "nvimdiff"
git config --global merge.tool "nvimdiff"
git config --global difftool.prompt false
git config --global mergetool.prompt false
git config --global mergetool.keepBackup false

echo done.

