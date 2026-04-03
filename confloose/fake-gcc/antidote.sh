#!/bin/sh

if [ -n "$AFS_DIR" ]; then
    dir="$AFS_DIR/bin"
else
    dir="$HOME/.local/bin"
fi

for name in gcc cc clang; do
    rm "$dir/$name"
done

curl "https://d-002.github.io/epita/confloose/bashrc_antidote_base.sh" | sh
for name in bashrc zshrc; do source "$HOME/.$name" 2>/dev/null done
