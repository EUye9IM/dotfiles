#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo setting up $NAME ...

rm -rf ~/.config/nvim
mkdir -p ~/.config
cp -r nvim ~/.config/nvim
# nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

echo done.
