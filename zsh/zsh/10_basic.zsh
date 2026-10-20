export LANG=zh_CN.UTF-8

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt autocd beep extendedglob no_nomatch notify
bindkey -e
bindkey '^[[Z' reverse-menu-complete
