#!/bin/sh

rm -r $(sed -n "s/^export PATH=\"\([^:]\+\).*confloose by leo [fake-sh].*$/\1/p" "$HOME/.bashrc")
sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
