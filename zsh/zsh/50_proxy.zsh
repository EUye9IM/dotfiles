# proxy
# export PROXY_SERVE=''
alias active-proxy='export ALL_PROXY=$PROXY_SERVE http_proxy=$PROXY_SERVE https_proxy=$PROXY_SERVE'
alias deactive-proxy="unset ALL_PROXY http_proxy https_proxy"
PROXY_TEST_ADDR="www.google.com"
alias try-proxy='curl -m 3 -s -o /dev/null $PROXY_TEST_ADDR \
	-w "%{http_code} %{time_connect}" | \
	awk "{printf \"$PROXY_TEST_ADDR: Code:%-4d Delay:%.2fms\",\$1,(\$2*1000)}"| \
	xargs -I {} echo "{}"'