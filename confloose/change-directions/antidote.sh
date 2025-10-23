#!/bin/sh

backup="$HOME/.config/i3/config.bak"
conf="$HOME/.config/i3/config"

[ -f "$backup" ] && mv "$backup" "$conf"
i3-msg reload
