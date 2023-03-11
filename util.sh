#!/bin/bash

OS_LIST=(
	"Ubuntu"
	"Rocky"
)

function raise_error() {
	echo Error: ${BASH_SOURCE[1]}:${BASH_LINENO[0]} "$*"
	exit -1
}

function get_os() {
	for os in ${OS_LIST[@]}; do
		if cat /etc/*release* | grep -q $os; then
			echo $os
			return
		fi
	done
	echo "unknown"
}
TARGET_OS=$(get_os)

function do_sub_scripts() {
	# path, script_name
	if [[ $# -ne 2 ]]; then
		raise_error "do_sub_scripts() need 2 arguments"
	else
		local path=$1
		local script_name=$2
	fi

	for dir in $(ls $path); do
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

function locate_dir(){
	local path=$(pwd)
	echo ${path##*/}
}

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

function install_package(){
	# package_name
	if [[ $# -lt 1 ]]; then
		raise_err "install_package need at least 1 argument"
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
function reinstall_package(){
	# package_name
	if [[ $# -lt 1 ]]; then
		raise_err "reinstall_package need at least 1 argument"
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



