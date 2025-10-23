#!/bin/sh

file="$HOME/.config/alacritty/alacritty.toml"
backup="$HOME/.config/alacritty/alacritty.toml.bak"

[ -f "$backup" ] && cp "$backup" "$file"
rm "$backup"
