#!/bin/sh

while true; do
    sleep $(($RANDOM % 10 + 20))
    app=$((RANDOM % 10))
    case $app in
        0)
            geany&;;
        1)
            nemo&;;
        2)
            discord&;;
        3)
            i3lock&;;
        4)
            rider&;;
        5)
            gvim&;;
        6)
            code&;;
        7)
            dmenu&;;
        8)
            intellij&;;
        9)
            chromium&;;
        *)
            firefox&;;
    esac
done
