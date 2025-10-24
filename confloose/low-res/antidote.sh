#!/bin/sh

backup="$HOME/.config/i3/config.bak"
conf="$HOME/.config/i3/config"

[ -f "$backup" ] && mv "$backup" "$conf"
i3-msg restart

IFS=$'\n'
for output in $(xrandr | sed -nE "s/(^\S+) connected.*$/\1/p"); do
    xrandr --output "$output" --mode 1920x1080
done
