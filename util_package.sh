#!/bin/bash

# 更新软件源
function update_repo_cache(){
	echo "Updating sources ..."
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
		raise_error "update failed"
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
	echo "Installing $pkg_name ..."

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
		raise_error "install $pkg_name failed"
	fi
}

# 从 git clone
function git_clone(){
	if [[ $# -lt 1 ]]; then
		return
	else
		local git_args="$*"
	fi
	echo "Cloning from $1"
	install_package git

	git clone --depth 1 ${git_args} || raise_error "git clone $1 failed"
}

# 从 url 安装二进制文件
function install_url(){
	if [[ $# -lt 1 ]]; then
		return
	else
		local pkgs_url=$*
	fi
	echo "Installing $pkgs_url"
	install_package curl
	
	local tempdir=$(mktemp -d) || raise_error "make temp dirctory failed"
	trap "RM $tempdir" EXIT
	cd ${tempdir}
	for pkg_url in $pkgs_url;do
		echo "Downloading $pkg_url"
		local pkg_name=${pkg_url##*/}
		curl -L -f -# -o $pkg_name $pkgs_url || raise_error "download $pkg_name failed"
		install_package ./$pkg_name
		RM $pkg_name
	done
	cd -
}

# 删除软件
function remove_package(){
	# package_name
	if [[ $# -lt 1 ]]; then
		return
	else
		local pkg_name="$*"
	fi
	echo "Removing $pkg_name ..."

	case $TARGET_OS in
		Ubuntu)
			apt --purge remove -y $pkg_name
			;;
		Rocky)
			dnf remove -y $pkg_name
			;;
		*)
		!	raise_error "unsupport OS"
			;;
	esac
	if [[ $? -ne 0 ]]; then
		raise_error "remove $pkg_name failed"
	fi
}
