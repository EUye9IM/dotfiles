#!/bin/bash

# https://stackoverflow.com/questions/59895/how-do-i-get-the-directory-where-a-bash-script-is-located-from-within-the-script
cur_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $cur_dir/util_base.sh
source $cur_dir/util_commands.sh
source $cur_dir/util_mirror.sh
source $cur_dir/util_package.sh

