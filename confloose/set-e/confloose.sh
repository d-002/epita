#!/bin/sh

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "set-e" "\"set -e\"" | sh
