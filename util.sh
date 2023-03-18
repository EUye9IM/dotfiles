#!/bin/bash

# 支持的操作系统列表
OS_LIST=(
	"Ubuntu"
	"Rocky"
)

# 抛出异常停止脚本
function raise_error() {
	echo Error: ${BASH_SOURCE[1]}:${BASH_LINENO[0]} "$*"
	exit -1
}

# 检测操作系统
function _get_os() {
	for os in ${OS_LIST[@]}; do
		if cat /etc/*release* | grep -q $os; then
			echo $os
			return
		fi
	done
	echo "unknown"
}
# 操作系统
TARGET_OS=$(_get_os)

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

# 所在目录
function locate_dir(){
	local path=$(pwd)
	echo ${path##*/}
}

# 更新软件源
function update_repo_cache(){
	case $TARGET_OS in
		Ubuntu)
			apt update
			;;
		Rocky)
			dnf makecache
			;;
		*)
			raise_error "unsupport OS"
			;;
	esac
	if [[ $? -ne 0 ]]; then
		raise_error 
	fi
}

# 安装软件
function install_package(){
	# package_name
	if [[ $# -lt 1 ]]; then
		return
	else
		local pkg_name="$*"
	fi

	case $TARGET_OS in
		Ubuntu)
			apt install -y $pkg_name
			;;
		Rocky)
			dnf install --allowerasing -y $pkg_name
			;;
		*)
			raise_error "unsupport OS"
			;;
	esac
	if [[ $? -ne 0 ]]; then
		raise_error 
	fi
}

# 重新安装软件
function reinstall_package(){
	# 计划弃用
	# package_name
	if [[ $# -lt 1 ]]; then
		return
	else
		local pkg_name="$*"
	fi

	case $TARGET_OS in
		Ubuntu)
			apt --reinstall install -y $pkg_name
			;;
		Rocky)
			dnf remove -y $pkg_name
			dnf install -y $pkg_name
			;;
		*)
			raise_error "unsupport OS"
			;;
	esac
	if [[ $? -ne 0 ]]; then
		raise_error 
	fi
}



