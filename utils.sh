#!/bin/bash

# 移除目录
function RM(){
	# dirs
	if [[ $# -lt 1 ]]; then
		return
	fi
	echo "rm -rf $*"

	rm -rf $*
}

# 新建目录
function MKDIR(){
	# dirs
	if [[ $# -lt 1 ]]; then
		return
	fi
	echo "mkdir -p $*"

	mkdir -p $*
}

# 复制目录
function CP(){
	# from ... to
	if [[ $# -lt 2 ]]; then
		return
	fi
	local cp_opts="-rf"
	if cp --help 2>&1 | head -1 | grep -qi 'busybox'; then
		cp_opts="-rf"
	elif [[ $(uname -s) == Darwin ]] && ! cp -b /dev/null /dev/null >/dev/null 2>&1; then
		# BSD cp has no -b. Back up each existing destination before copying.
		local dest=${!#} src target backup n
		local -a sources=("${@:1:$#-1}")
		for src in "${sources[@]}"; do
			if [[ -d $dest ]]; then
				target=$dest/${src##*/}
			else
				target=$dest
			fi
			if [[ -e $target || -L $target ]]; then
				backup=${target}~
				if [[ -e $backup || -L $backup ]]; then
					n=1
					while [[ -e ${target}.backup.$n || -L ${target}.backup.$n ]]; do
						((n++))
					done
					backup=${target}.backup.$n
				fi
				echo "cp -Rp $target $backup"
				cp -Rp "$target" "$backup" || return $?
			fi
		done
		echo "cp -Rf ${sources[*]} $dest"
		cp -Rf "${sources[@]}" "$dest"
		return $?
	else
		cp_opts="-rfb"
	fi
	echo "cp $cp_opts $*"
	cp $cp_opts "$@"
}

function CHK(){
	for cmd in $*;do
		command -v $cmd &> /dev/null
		if [[ $? -ne 0 ]]; then
			echo '\e[33mwarn:\e[0m' command $cmd not exist.
		fi
	done
}


# 执行子目录脚本，子目录可选
# path, script_name, select sub dirs
function run_sub_scripts() {
	if [[ $# -lt 2 ]]; then
		raise_error "run_sub_scripts() need st least 2 arguments"
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
			(cd "$path/$dir" && bash "$script_name") || return $?
			echo
		fi
	done
}

# 父目录名
function locate_dir(){
	local path=$(pwd)
	echo ${path##*/}
}
