#!/bin/sh

while true; do
    sleep $(($RANDOM % 10 + 5))
    i3-sensible-terminal&
done
