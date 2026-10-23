autoload -Uz compinit
compinit -i

# Bun provides its own zsh completion definitions.
if command -v bun >/dev/null 2>&1; then
	source <(bun completions)
fi