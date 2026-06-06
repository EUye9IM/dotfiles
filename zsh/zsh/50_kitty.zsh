if [[ "$TERM" == *"kitty"* ]] || [[ "$TERMINAL_EMULATOR" == *"kitty"* ]] || [[ -n "$KITTY_WINDOW_ID" ]]; then
    if command -v kitty >/dev/null 2>&1; then
        alias ssh='kitty +kitten ssh'
    fi
fi
