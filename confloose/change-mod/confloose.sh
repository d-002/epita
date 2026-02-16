#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"

touch "$conf"
[ -f "$backup" ] || cp "$conf" "$backup"
sed -i "s/Mod1/Mod5/g" "$conf"
sed -i "s/Mod3/Mod1/g" "$conf"
sed -i "s/Mod1/Mod3/g" "$conf"
i3-msg reload
