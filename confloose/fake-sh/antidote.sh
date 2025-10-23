#!/bin/sh

rm -r $(dirname $(sed -n "s/^while true; do \([^;]\+\).*confloose by leo \[fake-sh\].*$/\1/p" "$HOME/.bashrc"))
sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
