#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"

touch $conf
[ -f "$backup" ] || cp "$conf" "$backup"
sed -i "s/^.*bindsym.*\+d\W.*$//g" "$conf"
sed -i "s/^.*bindsym.*\+D\W.*$//g" "$conf"
i3-msg reload
