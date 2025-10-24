#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"

[ -f "$backup" ] && mv "$backup" "$conf"
i3-msg restart

IFS=$'\n'
for output in $(xrandr | sed -nE "s/(^\S+) connected.*$/\1/p"); do
    xrandr --output "$output" --rotate normal
done
