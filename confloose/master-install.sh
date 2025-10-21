#!/bin/sh

for arg in "$@"; do
    curl "https://d-002.github.io/epita/confloose/$arg/confloose.sh" | sh
done
