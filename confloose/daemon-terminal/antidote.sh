#!/bin/sh

pkill -f "confloose-daemon-terminal"
sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
