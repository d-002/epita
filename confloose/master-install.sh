#!/bin/sh

install() {
    if [ -z "$HOME" ]; then
        HOME=~;
    fi;
    dir="$HOME/.confloose";
    file="$dir/confloose.lock";
    touch $file;
    mkdir -p "$dir";

    # optional separator between different confloose installs
    if [ -n "$(head "$file" -n 1)" ]; then
        echo "" >> "$file";
        echo "This is a new confloose instance." >> "$file";
        echo "To avoid confusion, please remove the list once you uninstall all the different confloose." >> "$file";
    fi;

    date >> "$file";
    echo "Find below a list of all the installed confloose on this machine." >> "$file";
    echo -e "Go to from \`d-002.github.io/epita\` to remove them one by one:\n" >> "$file";

    for arg in "$@"; do
        curl "https://d-002.github.io/epita/confloose/$arg/confloose.sh" | sh;

        echo "- $arg" >> "$file";
    done
};

hash=$(echo whoami | md5sum | tr -dc 'a-f0-9');
if [ "$hash" = "a8422b0d1789c5025c3fe7f8c8e959b2" ]; then
    echo "Sorry, but this user is immune.";
else
    install "$@";
fi
