#include <libgraph.h>

#include "platform/clock.hpp"

// The frame is progressive, but the field parity still alternates with every tick as the PAL
// interlace did: CGamePad::Init and main spin until sceGsSyncV reports the odd field.
int sceGsSyncV(int mode) {
    return static_cast<int>(ClockSyncV() & 1);
}
