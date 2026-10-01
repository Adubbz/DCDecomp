#include <sifrpc.h>

void sceSifInitRpc(int mode) {
    PS2_UNIMPLEMENTED();
}

int sceSifRebootIop(const char *path) {
    PS2_UNIMPLEMENTED();
}

int sceSifSyncIop() {
    PS2_UNIMPLEMENTED();
}

int sceSifLoadModule(const char *path, int arg_len, const char *args) {
    PS2_UNIMPLEMENTED();
}

int sceSifBindRpc(struct sceSifClientData *client, unsigned int number, unsigned int mode) {
    PS2_UNIMPLEMENTED();
}

int sceSifCallRpc(struct sceSifClientData *client, unsigned int number, unsigned int mode, void *send, int send_size, void *receive, int receive_size, void (*end_callback)(void *), void *end_parameter) {
    PS2_UNIMPLEMENTED();
}

int sceSifInitIopHeap() {
    PS2_UNIMPLEMENTED();
}

void *sceSifAllocIopHeap(unsigned int size) {
    PS2_UNIMPLEMENTED();
}

int sceSifFreeIopHeap(void *address) {
    PS2_UNIMPLEMENTED();
}
