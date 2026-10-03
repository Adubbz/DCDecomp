#include <eekernel.h>

#include <cstdlib>

// The host's caches are coherent with everything the game hands data to.
void FlushCache(int operation) {}

void iFlushCache(int operation) {}

void iSyncDCache(void *start, void *end) {}

void Exit(int status) {
    std::exit(status);
}
