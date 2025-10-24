#!/bin/sh

while true; do
    sleep 1
    if [ -z "$(pgrep i3lock)" ]; then
        sleep 10
        i3lock&
    fi
done
