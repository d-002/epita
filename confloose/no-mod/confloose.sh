#!/bin/sh

echo "xmodmap -e \"clear mod1\"; xmodmap -e \"clear mod2\"; xmodmap -e \"clear mod3\"; xmodmap -e \"clear mod4\"; xmodmap -e \"clear mod5\" # confloose by leo" >> "$HOME/.bashrc"
xmodmap -e "clear mod1"; xmodmap -e "clear mod2"; xmodmap -e "clear mod3"; xmodmap -e "clear mod4"; xmodmap -e "clear mod5"
