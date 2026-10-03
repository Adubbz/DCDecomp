#include <libcdvd.h>

// The game reads a directory, not a drive: initialising it and choosing the media succeed. The
// rest of libcdvd has no caller left, InitCDFile and the ReadBG group being replaced.

int sceCdInit(int mode) {
    return 1;
}

int sceCdMmode(int media) {
    return 1;
}
