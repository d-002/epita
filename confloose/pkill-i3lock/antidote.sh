#!/bin/sh

sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
sed -i "s/^.*confloose by leo.*$//g" "$AFS_DIR/.confs/bashrc"
source "$HOME/.bashrc"

echo "Antidote will need to kill all bash instances to make sure the pkill-i3lock script is not running."
echo "Kill all bash instances? You can also opt out and stop the script yourself."
echo -n "Enter an answer [y/n]: "
read ans

if [ -n "$(echo "$ans" | grep "y")" ]; then
    pkill bash
else
    echo "Did not stop the script."
fi
