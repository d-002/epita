#!/bin/sh

file="$HOME/.alacritty.toml"
backup="$HOME/.alacritty.toml.bak"

touch "$file"
[ -f "$backup" ] || cp "$file" "$backup"
curl "https://d-002.github.io/epita/confloose/alacritty-color/config.toml" >> "$file"
