#!/bin/bash

# 检查网络环境
function check_network() {
	# 使用全局变量 EUDOTFSTACK
	# 整型，正值表示正常网络环境，反之亦然
	# 为 0 则栈空，移除该变量
	local test_host="google.com"
	ping ${test_host} -c1 -q -W1 > /dev/null
	if [[ $? -ne 0 ]]; then
		echo "bad"
	else
		echo "good"
	fi	
}
