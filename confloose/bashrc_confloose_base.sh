function add_to_rc() {
    echo "$2 # confloose by leo [$1]" >> "$HOME/.bashrc";
    source "$HOME/.bashrc";
    if [ -f "$HOME/.zshrc" ]; then
        echo "$2 # confloose by leo [$1]" >> "$HOME/.zshrc";
        source "$HOME/.zshrc";
    fi;
}; add_to_rc
