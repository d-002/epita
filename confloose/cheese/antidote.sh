#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"

[ -f "$backup" ] && mv "$backup" "$conf"
i3-msg restart

IFS=$'\n'
for pointer in $(xinput --list 2>/dev/null | sed -nE "s/^\W*(.+\w)\s+id=[0-9].*\Wpointer\W.*$/\1/p"); do
    xinput set-prop "$pointer" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
done
