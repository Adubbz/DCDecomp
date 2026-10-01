#include <libmc.h>

int sceMcInit() {
    PS2_UNIMPLEMENTED();
}

int sceMcSync(int mode, int *cmd, int *result) {
    PS2_UNIMPLEMENTED();
}

int sceMcOpen(int port, int slot, char *name, int flag) {
    PS2_UNIMPLEMENTED();
}

int sceMcClose(int fd) {
    PS2_UNIMPLEMENTED();
}

int sceMcRead(int fd, void *buffer, int size) {
    PS2_UNIMPLEMENTED();
}

int sceMcWrite(int fd, void *buffer, int size) {
    PS2_UNIMPLEMENTED();
}

int sceMcFlush(int fd) {
    PS2_UNIMPLEMENTED();
}

int sceMcChdir(int port, int slot, char *name, char *current) {
    PS2_UNIMPLEMENTED();
}

int sceMcMkdir(int port, int slot, char *name) {
    PS2_UNIMPLEMENTED();
}

int sceMcDelete(int port, int slot, char *name) {
    PS2_UNIMPLEMENTED();
}

int sceMcGetDir(int port, int slot, char *name, unsigned int mode, int count, void *table) {
    PS2_UNIMPLEMENTED();
}

int sceMcGetInfo(int port, int slot, int *type, int *free_size, int *formatted) {
    PS2_UNIMPLEMENTED();
}

int sceMcFormat(int port, int slot) {
    PS2_UNIMPLEMENTED();
}

int sceMcUnformat(int port, int slot) {
    PS2_UNIMPLEMENTED();
}
