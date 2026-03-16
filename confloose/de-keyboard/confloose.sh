#!/bin/sh

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "de-keyboard" "'setxkbmap de'" | sh
