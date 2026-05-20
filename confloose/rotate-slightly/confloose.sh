#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"

touch "$conf"
[ -f "$backup" ] || cp "$conf" "$backup"

IFS=$'\n'
for output in $(xrandr | sed -nE "s/(^\S+) connected.*$/\1/p"); do
    echo "exec_always xrandr --output \"$output\" --transform 0.416,-0.909,0,0.909,0.416,0,0,0,1" >> "$conf"
done
i3-msg restart
