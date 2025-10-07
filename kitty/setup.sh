#!/bin/bash

source ../utils.sh

NAME=$(locate_dir)

echo setting up $NAME ...

# do something...
CP  ./kitty.conf ~/.config/kitty/kitty.conf

echo done.
