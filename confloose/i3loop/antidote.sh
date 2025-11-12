#!/bin/sh

pkill -f "confloose-i3loop"
sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
sed -i "s/^.*confloose by leo.*$//g" "$AFS_DIR/.confs/bashrc"
source "$HOME/.bashrc"
