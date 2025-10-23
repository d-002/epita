#!/bin/sh

pkill "confloose-daemon-terminal"
sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
