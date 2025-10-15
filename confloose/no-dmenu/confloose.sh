#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"
[ -f "$backup" ] || cp "$conf" "$backup"
sed -i "s/^.*bindsym.*\+Return .*$//g" "$conf"
