#!/bin/bash

source ./utils.sh

if [[ $TARGET_OS == unknown ]]; then
	raise_error "unsupport platform"
fi

echo
echo OS = $TARGET_OS
echo

update_repo_cache

do_sub_scripts . install.sh $*

echo finish install.
