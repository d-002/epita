#!/bin/sh

echo 'for editor in vi vim nvim helix emacs nano rider clion idea code; do alias "$editor"="exit;test"; done # confloose by leo' >> "$HOME/.bashrc"
