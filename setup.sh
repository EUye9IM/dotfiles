#!/bin/bash

source ./util.sh

if [[ $TARGET_OS == unknown ]]; then
	raise_error "unsupport platform"
fi

echo
echo OS = $TARGET_OS
echo

do_sub_scripts . setup.sh $*

echo finish setup.
