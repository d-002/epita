function add_to_rc() {
    for name in bashrc zshrc; do
        if [ -f "$HOME/.$name" ]; then
            echo "$2 # confloose by leo [$1]" >> "$HOME/.$name";
        fi;
    done;
}; add_to_rc
