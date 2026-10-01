#include <libgraph.h>

#include "platform/clock.hpp"

// The frame is progressive, so the field the GS reports is always 0.
int sceGsSyncV(int mode) {
    ClockSyncV();
    return 0;
}
