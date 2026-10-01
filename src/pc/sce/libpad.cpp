#include <libpad.h>

int scePadInit(int mode) {
    PS2_STUB();
}

int scePadPortOpen(int port, int slot, void *buffer) {
    PS2_STUB();
}

int scePadRead(int port, int slot, unsigned char *data) {
    PS2_STUB();
}

int scePadGetState(int port, int slot) {
    PS2_STUB();
}

int scePadInfoMode(int port, int slot, int info, int index) {
    PS2_STUB();
}

int scePadSetMainMode(int port, int slot, int mode, int lock) {
    PS2_STUB();
}

int scePadInfoAct(int port, int slot, int actuator, int command) {
    PS2_STUB();
}

int scePadSetActAlign(int port, int slot, unsigned char *alignment) {
    PS2_STUB();
}

int scePadSetActDirect(int port, int slot, unsigned char *values) {
    PS2_STUB();
}
