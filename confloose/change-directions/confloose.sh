#!/bin/sh

conf="$HOME/.config/i3/config"
backup="$HOME/.config/i3/config.bak"
[ -f "$backup" ] || cp "$conf" "$backup"
sed -i "s/Left/TEMP_DIR/g" "$conf"
sed -i "s/Right/Left/g" "$conf"
sed -i "s/TEMP_DIR/Right/g" "$conf"
