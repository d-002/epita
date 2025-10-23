#!/bin/bash

trap 'printf "\n$ps1"' INT

ps1="$(sed -n "s/^\s*PS1=[\"']*\(.*\)[\"']\s*$/\1/p" "$HOME/.bashrc")"
if [ -z "$ps1" ]; then
    ps1="\Ww\$ "
fi

ps1="$(echo "$ps1" | sed -E "s/[\][$]/$/g")"
ps1="$(echo "$ps1" | sed -E "s/[\][wW](\W)/$(basename $(pwd))\1/g")"

while true; do
    printf "$ps1"
    read cmd
    echo "bash: $cmd: command not found"
done
