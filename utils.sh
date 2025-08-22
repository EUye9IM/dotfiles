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
	cp -rf $*
}


# 执行子目录脚本，子目录可选
# path, script_name, select sub dirs
function do_sub_scripts() {
	if [[ $# -lt 2 ]]; then
		raise_error "do_sub_scripts() need st least 2 arguments"
	else
		local path=$1
		local script_name=$2
		shift 2
		local select_set=${*:-$(ls $path)}
	fi

	for dir in $select_set; do
		if [[ -d $path/$dir && -f $path/$dir/$script_name ]]; then
			echo ' ==> ' $path/$dir/$script_name
			echo
			cd $path/$dir
			bash $script_name
			local co=$?
			if [[ $co -ne 0 ]]; then
				raise_error "$path/$dir/$script_name" exit with code: $co
			fi
			cd - &>/dev/null
			echo
		fi
	done
}

# 父目录名
function locate_dir(){
	local path=$(pwd)
	echo ${path##*/}
}