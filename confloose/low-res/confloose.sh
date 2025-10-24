#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"

touch $conf
[ -f "$backup" ] || cp "$conf" "$backup"

IFS=$'\n'
for output in $(xrandr | sed -nE "s/(^\S+) connected.*$/\1/p"); do
    echo "exec xrandr --output \"$output\" --mode 640x480" >> "$conf"
done
i3-msg restart
