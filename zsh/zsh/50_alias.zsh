# 检查是否在 Kitty 终端中运行
if [[ "$TERM" == *"kitty"* ]] || [[ "$TERMINAL_EMULATOR" == *"kitty"* ]] || [[ -n "$KITTY_WINDOW_ID" ]]; then
    # 检查 kitty +kitten ssh 命令是否存在
    if command -v kitty >/dev/null 2>&1; then
        # 添加 alias，用 kitty 的 ssh 替换普通 ssh
        alias ssh='kitty +kitten ssh'
        # echo "Kitty terminal detected - ssh alias enabled"
    fi
fi
