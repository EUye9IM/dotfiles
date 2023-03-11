#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

#settings

echo installing $NAME ...

reinstall_package tmux

echo done.
