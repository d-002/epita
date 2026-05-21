#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"

touch "$conf"
[ -f "$backup" ] || cp "$conf" "$backup"
echo "bindsym Tab exec i3lock" >> "$conf"
i3-msg restart
