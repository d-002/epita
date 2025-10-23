#!/bin/sh

rm -rf $(sed -n "s/^export PATH=\"\([^:]\+\).*confloose by leo \[fake-i3lock\].*$/\1/p" "$HOME/.bashrc")
rm "$HOME/.local/bin/epi3lock"
sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
