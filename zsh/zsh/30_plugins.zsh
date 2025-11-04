
zinit load agkozak/zsh-z
zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting
zinit ice depth"1"
zinit light romkatv/powerlevel10k
zinit ice depth"1"
zinit light zsh-users/zsh-completions
if command -v fzf >/dev/null 2>&1; then
zinit light Aloxaf/fzf-tab
fi
