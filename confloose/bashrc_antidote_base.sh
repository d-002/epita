for name in bashrc zshrc; do
    [ -f "$HOME/.$name" ] && sed -i "s/^.*confloose by leo.*$//g" "$HOME/.$name";
    [ -f "$AFS_DIR/.confs/$name" ] && sed -i "s/^.*confloose by leo.*$//g" "$AFS_DIR/.confs/$name";
done
