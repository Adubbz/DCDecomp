#pragma once

#include "common.h"

extern s32 DmaCH8;
extern s32 Vif1Packet;
/* Retail has two distinct `VSyncField` symbols (0x2A23C8 GLOBAL -- this one
 * -- and 0x2A25DC LOCAL, in a still-raw TU); the `__2` suffix is the
 * disassembly dump's disambiguation, kept here to avoid a link collision. */
extern s32 VSyncField__2;
extern s32 mgTEX1Env[2];
extern s32 mgClearBackFlag;
