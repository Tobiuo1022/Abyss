#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
 
#define PORT_NUM 3333
#define HOSTNAME "127.0.0.1"
#define BUFSIZE 1024
#define SEND_DATA "/Users/tobiuo/park/inet/fibonacci.p6"

void strfit(char before[128], char after[128]) {
    char *p = before;
    char *q = after;

    while(*p != '\0') {
        *q = *p;
        p++; q++;
    }
    *q = '\0';
}
 
int main(int argc, char *argv[]) {
    // Setup server socket.
    struct sockaddr_in server_addr;
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(PORT_NUM);
    server_addr.sin_addr.s_addr = inet_addr(HOSTNAME);
   
    int socket_fd;
    // Make a socket.
    if ((socket_fd = socket(AF_INET, SOCK_STREAM, 0)) < 0) {
        perror("socket error");
        return 1;
    }
   
    // Connect server.
    if (connect(socket_fd, (struct sockaddr *) &server_addr, sizeof(server_addr)) < 0) {
        perror("connect error");
        goto end_socket;
    }
   
    int buf_len;
    for (int i=1; i<argc; i++) {
        // Adjust length of message.
        char path[strlen(argv[i]) + 1];
        strfit(argv[i], path);

        // Send a message.
        if ((buf_len = send(socket_fd, path, sizeof(path), 0)) < 0) {
            perror("send error");
            goto end_socket;
        }
        if (buf_len != sizeof(path)) {
            printf("Sending data is not successful.\n");
        }
    }

    // Receive a message.
    char buf[BUFSIZE];
    memset(buf, 0, sizeof(buf));
    while ((buf_len = read(socket_fd, buf, sizeof(buf)))) {
        printf("%s", buf);
        memset(buf, 0, sizeof(buf));
    }
   
end_socket:
   
    if (close(socket_fd) < 0) {
        perror("close");
        return 2;
    }
   
    return 0;
}
