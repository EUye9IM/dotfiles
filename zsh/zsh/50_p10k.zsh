# zinit plugins
# set <right> partial accept
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
	end-of-line
)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
	forward-char
	forward-word
)


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
