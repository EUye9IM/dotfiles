if [[ $(uname -s) == Darwin ]]; then
    alias ll='ls -lahG'
else
    alias ll='ls -lah --color'
fi

