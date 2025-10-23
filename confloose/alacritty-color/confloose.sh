#!/bin/sh

file="$HOME/.config/alacritty/alacritty.toml"
backup="$HOME/.config/alacritty/alacritty.toml.bak"

mkdir -p "$HOME/.config/alacritty"
touch "$file"

[ -f "$backup" ] || cp "$file" "$backup"
curl "https://d-002.github.io/epita/confloose/alacritty-color/config.toml" > "$file"
