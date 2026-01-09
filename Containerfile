from archlinux

copy . /opt/dotfiles

ARG ALL_PROXY
ENV TERM xterm-256color

run echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist &&\
	pacman -Syyu --noconfirm less git zsh neovim tmux kitty
run cd /opt/dotfiles && bash ./setup.sh &&\
	nvim --headless +Lazy! sync +qa!
run zsh -c ". ~/.zshrc"

cmd zsh
