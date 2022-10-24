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

void get_fullpath(char path[PATHSIZE], char fullpath[PATHSIZE]) {
    char cwd[PATHSIZE];
    getcwd(cwd, sizeof cwd);

    // absolute path
    if(path[0] == '/') {
        snprintf(fullpath, PATHSIZE, "%s", path);
    // like a ./hoge
    } else if(path[0] == '.' && path[1] == '/') {
        snprintf(fullpath, PATHSIZE, "%s", cwd);
        char *f = fullpath;
        char *p = path;
        while(*f != '\0') {
            f++;
        }
        p++;
        while(*p != '\0') {
            *f = *p;
            f++; p++;
        }
        *f = '\0';
    // relative path
    } else {
        snprintf(fullpath, PATHSIZE, "%s/%s", cwd, path);
    }
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
        if (close(socket_fd) < 0) {
            perror("close");
            return 2;
        }
    }

    // resolve the filepath. 
    char fullpath[PATHSIZE];
    get_fullpath(argv[1], fullpath);
   
    // Send a message.
    int buf_len;
    for (int i=1; i<argc; i++) {
        // Adjust length of message.
        char send_path[strlen(fullpath) + 1];
        strncpy(send_path, fullpath, sizeof send_path);

        if ((buf_len = send(socket_fd, send_path, sizeof(send_path), 0)) < 0) {
            perror("send error");
            if (close(socket_fd) < 0) {
                perror("close");
                return 2;
            }
        }
        if (buf_len != sizeof(send_path)) {
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
   
    // close a socket. 
    if (close(socket_fd) < 0) {
        perror("close");
        return 2;
    }
   
    return 0;
}
