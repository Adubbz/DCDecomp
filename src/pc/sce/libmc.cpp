#include <libmc.h>

int sceMcInit() {
    PS2_STUB();
}

int sceMcSync(int mode, int *cmd, int *result) {
    PS2_STUB();
}

int sceMcOpen(int port, int slot, char *name, int flag) {
    PS2_STUB();
}

int sceMcClose(int fd) {
    PS2_STUB();
}

int sceMcRead(int fd, void *buffer, int size) {
    PS2_STUB();
}

int sceMcWrite(int fd, void *buffer, int size) {
    PS2_STUB();
}

int sceMcFlush(int fd) {
    PS2_STUB();
}

int sceMcChdir(int port, int slot, char *name, char *current) {
    PS2_STUB();
}

int sceMcMkdir(int port, int slot, char *name) {
    PS2_STUB();
}

int sceMcDelete(int port, int slot, char *name) {
    PS2_STUB();
}

int sceMcGetDir(int port, int slot, char *name, unsigned int mode, int count, void *table) {
    PS2_STUB();
}

int sceMcGetInfo(int port, int slot, int *type, int *free_size, int *formatted) {
    PS2_STUB();
}

int sceMcFormat(int port, int slot) {
    PS2_STUB();
}

int sceMcUnformat(int port, int slot) {
    PS2_STUB();
}
