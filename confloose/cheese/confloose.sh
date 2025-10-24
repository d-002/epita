#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"

touch "$conf"
[ -f "$backup" ] || cp "$conf" "$backup"

IFS=$'\n'
for pointer in $(xinput --list 2>/dev/null | sed -nE "s/^\W*(.+\w)\s+id=[0-9].*\Wpointer\W.*$/\1/p"); do
    echo "exec xinput set-prop \"$pointer\" \"Coordinate Transformation Matrix\" -1 10 1 0 1 1 0 0 1" >> "$conf"
done
i3-msg restart
