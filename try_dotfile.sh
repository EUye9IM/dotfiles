#!/bin/bash

# support os:
# rockylinux:9 ubuntu:latest

# image=rockylinux:9
image=ubuntu:latest

echo
echo === prepare container ===
echo
echo image tag = $image
echo

docker run -it --rm \
	-v `pwd`:/dotfile \
	--name=try_dotfile \
	$image \
	bash -c 'bash -c "echo && echo === container prepare ok === && echo && cd /dotfile && bash install.sh && bash setup.sh" && $(grep ^$(id -un): /etc/passwd | cut -d : -f 7-)'
