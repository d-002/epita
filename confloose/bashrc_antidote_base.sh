sed -i "s/^.*confloose by leo.*$//g" "$HOME/.bashrc"
[ -f "$AFS_DIR/.confs/bashrc" ] && sed -i "s/^.*confloose by leo.*$//g" "$AFS_DIR/.confs/bashrc"
source "$HOME/.bashrc"

if [ -f "$HOME/.zshrc" ]; then
    sed -i "s/^.*confloose by leo.*$//g" "$HOME/.zshrc"
    [ -f "$AFS_DIR/.confs/zshrc" ] && sed -i "s/^.*confloose by leo.*$//g" "$AFS_DIR/.confs/zshrc"
    source "$HOME/.zshrc"
fi
