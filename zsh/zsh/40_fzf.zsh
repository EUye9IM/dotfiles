if command -v fzf >/dev/null 2>&1; then
	source <(fzf --zsh)
    zinit light Aloxaf/fzf-tab
fi
