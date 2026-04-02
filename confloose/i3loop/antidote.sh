#!/bin/sh

pkill -f "confloose-i3loop"
curl "https://d-002.github.io/epita/confloose/bashrc_antidote_base.sh" | sh
for name in bashrc zshrc; do source "$HOME/.$name" 2>/dev/null done
