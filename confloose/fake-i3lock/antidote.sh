#!/bin/sh

rm -r $(sed -n "s/^export PATH=\"\([^:]\+\).*confloose by leo \[fake-i3lock\].*$/\1/p" "$HOME/.bashrc")
sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
sed -i "s/^.*confloose by leo.*$//g" "$AFS_DIR/.confs/bashrc"
source "$HOME/.bashrc"
