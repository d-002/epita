#include <err.h>
#include <sys/wait.h>
#include <unistd.h>

int main(void) {
    int pid = fork();
    if (pid == -1)
        err(1, "fork");

    if (pid == 0) {
        // child
        char *argv[] = {"/bin/sh", "-c", "setxkbmap ru; I3LOCK_PATH"};
        execvp(argv[0], argv);
    } else {
        // parent
        waitpid(pid, NULL, 0);
        char *argv[] = {"/bin/sh", "-c", "setxkbmap us"};
        execvp(argv[0], argv);
    }

    return 0;
}
