#!/bin/bash

source ../util.sh

NAME=$(locate_dir)

echo installing $NAME ...

# define requirements and target
target=$NAME
requirements=""
version=

# preparing
install_package $requirements
remove_package $target

# do auther something ...
install_package $target$version

echo done.
