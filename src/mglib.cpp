#include "mglib.hpp"

/* Declared in exact retail `.sbss` address order: DmaCH8 (0x2A23C0),
 * Vif1Packet (0x2A23C4), VSyncField__2 (0x2A23C8), mgClearBackFlag
 * (0x2A23CC), mgTEX1Env (0x2A23D0, 8 bytes). */
s32 DmaCH8;
s32 Vif1Packet;
s32 VSyncField__2;
s32 mgClearBackFlag;
s32 mgTEX1Env[2];

/* Retail `mgWindowRect` (main.bss, 0x10 bytes) -- most likely the rectangle
 * MGSetWindowRect/MGGetWindowRect operate on. Field layout unconfirmed, so
 * migrated as a same-sized placeholder array. */
char mgWindowRect[0x10];
