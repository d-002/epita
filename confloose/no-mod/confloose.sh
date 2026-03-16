#!/bin/sh

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "no-mod" "'xmodmap -e \"clear mod1\"; xmodmap -e \"clear mod2\"; xmodmap -e \"clear mod3\"; xmodmap -e \"clear mod4\"; xmodmap -e \"clear mod5\"'" | sh
