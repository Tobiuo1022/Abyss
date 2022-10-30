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
#define PATHSIZE 512

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
        if (close(socket_fd) < 0) {
            perror("close");
            return 2;
        }
    }

    // Send the client's cwd. 
    char cwd[PATHSIZE];
    getcwd(cwd, sizeof cwd);
    // Adjust length of cwd.
    char send_cwd[strlen(cwd) + 1];
    strncpy(send_cwd, cwd, sizeof send_cwd);

    int buf_len;
    if ((buf_len = send(socket_fd, send_cwd, sizeof(send_cwd), 0)) < 0) {
        perror("send error");
        if (close(socket_fd) < 0) {
            perror("close error");
            return 2;
        }
    }
    if (buf_len != sizeof(send_cwd)) {
        printf("Sending data is not successful.\n");
    }

    // Receive a response. 
    char buf[BUFSIZE];
    buf_len = read(socket_fd, buf, sizeof(buf));

    // Send a message.
    for (int i=1; i<argc; i++) {
        // Adjust length of message.
        char send_path[strlen(argv[i]) + 1];
        strncpy(send_path, argv[i], sizeof send_path);

        if ((buf_len = send(socket_fd, send_path, sizeof(send_path), 0)) < 0) {
            perror("send error");
            if (close(socket_fd) < 0) {
                perror("close error");
                return 2;
            }
        }
        if (buf_len != sizeof(send_path)) {
            printf("Sending data is not successful.\n");
        }
    }

    // Receive a message.
    memset(buf, 0, sizeof(buf));
    while ((buf_len = read(socket_fd, buf, sizeof(buf)))) {
        printf("%s", buf);
        memset(buf, 0, sizeof(buf));
    }
   
    // close a socket. 
    if (close(socket_fd) < 0) {
        perror("close error");
        return 2;
    }
   
    return 0;
}
