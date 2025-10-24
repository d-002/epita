#include <unistd.h>

int main(void) {
    char *argv[] = {"/bin/sh", "-c", "setxkbmap ru; I3LOCK_PATH", NULL};
    execvp(argv[0], argv);
}
