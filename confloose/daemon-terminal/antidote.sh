#!/bin/sh

pkill -f "confloose-daemon-terminal"
curl "https://d-002.github.io/epita/confloose/bashrc_antidote_base.sh" | sh
