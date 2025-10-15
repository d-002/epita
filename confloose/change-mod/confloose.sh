#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"
[ -f "$backup" ] || cp "$conf" "$backup"
sed -i "s/Mod4/Mod5/g" "$conf"
sed -i "s/Mod3/Mod4/g" "$conf"
sed -i "s/Mod5/Mod3/g" "$conf"
