#include <sifrpc.h>

// There is no IOP: rebooting it, syncing with it and loading its modules
// succeed at once. The RPC and IOP heap calls stay stubs until the audio
// replacement removes their callers.

void sceSifInitRpc(int mode) {}

int sceSifRebootIop(const char *path) {
    return 1;
}

int sceSifSyncIop() {
    return 1;
}

int sceSifLoadModule(const char *path, int arg_len, const char *args) {
    static int next_id;
    return ++next_id;
}
