#!/bin/bash

# 移除目录
function RM(){
	# dirs
	if [[ $# -lt 1 ]]; then
		return
	fi
	echo "Removing $* ..."

	rm -rf $*
}

# 新建目录
function MKDIR(){
	# dirs
	if [[ $# -lt 1 ]]; then
		return
	fi
	echo "Making directory $* ..."

	mkdir -p $*
}

# 复制目录
function CP(){
	# from ... to
	if [[ $# -lt 2 ]]; then
		return
	fi
	echo "Copying to ${!#} ..."
	cp -rfb $*
}
