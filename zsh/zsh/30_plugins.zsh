zinit load agkozak/zsh-z
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting
zinit ice depth"1"
zinit light romkatv/powerlevel10k

# p10k: source config immediately after plugin load (for instant prompt)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autosuggest: partial accept on right arrow / Ctrl-f
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(
	end-of-line
)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=(
	forward-char
	forward-word
)

zinit ice depth"1"
zinit light zsh-users/zsh-completions
