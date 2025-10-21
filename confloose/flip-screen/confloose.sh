#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"
[ -f "$backup" ] || cp "$conf" "$backup"

for output in $(xrandr | sed -nE "s/(^\S+) connected.*$/\1/p"); do
    echo "xrandr --output \"$output\" --rotate inverted" >> "$conf"
done
i3-msg reload
