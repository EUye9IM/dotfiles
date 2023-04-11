#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo setting up $NAME ...

CP tmux.conf ~/.tmux.conf

echo done.
