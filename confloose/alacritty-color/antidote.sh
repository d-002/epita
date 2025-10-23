#!/bin/sh

file="$HOME/.alacritty.toml"
backup="$HOME/.alacritty.toml.bak"

[ -f "$backup" ] && cp "$backup" "$file"
rm "$backup"
