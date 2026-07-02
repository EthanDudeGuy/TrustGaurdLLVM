#include <stdio.h>
#include <sys/socket.h>

int main(void) {
    char buf[21];

    buf[0] = 'A';
    buf[1] = 'B';
    buf[2] = 'C';
    buf[3] = 0;

    send(0, buf, 4, 0);

    recv(0, buf, 19, 0);

    buf[20] = 0;

    printf("%s\n", buf);

    return 0;
}
