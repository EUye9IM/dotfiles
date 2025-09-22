#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo Setting up $NAME ...
RM ~/.config/nvim
MKDIR ~/.config/nvim
CP nvim/* ~/.config/nvim

echo done.

