#include <sifrpc.h>

void sceSifInitRpc(int mode) {
    PS2_STUB();
}

int sceSifRebootIop(const char *path) {
    PS2_STUB();
}

int sceSifSyncIop() {
    PS2_STUB();
}

int sceSifLoadModule(const char *path, int arg_len, const char *args) {
    PS2_STUB();
}

int sceSifBindRpc(struct sceSifClientData *client, unsigned int number, unsigned int mode) {
    PS2_STUB();
}

int sceSifCallRpc(struct sceSifClientData *client, unsigned int number, unsigned int mode, void *send, int send_size, void *receive, int receive_size, void (*end_callback)(void *), void *end_parameter) {
    PS2_STUB();
}

int sceSifInitIopHeap() {
    PS2_STUB();
}

void *sceSifAllocIopHeap(unsigned int size) {
    PS2_STUB();
}

int sceSifFreeIopHeap(void *address) {
    PS2_STUB();
}
