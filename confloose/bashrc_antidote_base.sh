for name in bashrc zshrc; do
    if [ -f "$HOME/.$file" ]; then
        sed -i "s/^.*confloose by leo.*$//g" "$HOME/.$file";
        [ -f "$AFS_DIR/.confs/$file" ] && sed -i "s/^.*confloose by leo.*$//g" "$AFS_DIR/.confs/$file";
    fi;
done
