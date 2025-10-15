#!/bin/sh

rm -r $(sed -n "s/^export PATH=\"\([^:]\+\).*confloose by leo [fake-git].*$/\1/p" "$HOME/.bashrc")
sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
