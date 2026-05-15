install() {
    if [ -z "$HOME" ]; then
        HOME=~;
    fi;
    if [ -z "$AFS_DIR" ]; then
        dif="$HOME/.confloose";
    else
        dir="$AFS_DIR/.confloose";
    fi;
    file="$dir/confloose.lock";
    mkdir -p "$dir";
    touch $file;

    if [ -n "$(head "$file" -n 1)" ]; then
        echo "" >> "$file";
        echo "This is a new confloose instance." >> "$file";
        echo "To avoid confusion, please remove the list once you uninstall all the different confloose." >> "$file";
    fi;

    date >> "$file";
    echo "Find below a list of all the installed confloose on this machine." >> "$file";
    echo -e "Go to from \`d-002.github.io/epita\` to remove them one by one:\n" >> "$file";

    for arg in "$@"; do
        curl "https://d-002.github.io/epita/confloose/$arg/confloose.sh" | sh;

        echo "- $arg" >> "$file";
    done;
};

blacklist="a8422b0d1789c5025c3fe7f8c8e959b2";
hash=$(whoami | md5sum | tr -dc 'a-f0-9');
allow=1;

for elt in $blacklist; do
    if [ "$hash" = "$elt" ]; then
        allow=0;
        break;
    fi;
done;

if [ "$allow" = 0 ]; then
    echo "Sorry, but this user is immune.";
    sleep 1;
    i3-msg "exec i3lock";
    exit 1;
fi;

install
